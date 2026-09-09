# La API en contenedor no conecta a PostgreSQL: connection refused

| | |
| --- | --- |
| **Bloqueo** | #1 |
| **Ruta** | A |
| **Grupo** | 1 |
| **Equipo** | Equipo 0 (ejemplo del docente) |
| **Autor** | @JuankF2026 |
| **Fecha** | 2026-09-04 |

## Síntoma

El contenedor de la API arranca y se cae de inmediato con
`Error: connect ECONNREFUSED 127.0.0.1:5432`. El contenedor de PostgreSQL
está corriendo y saludable, y desde el host se puede conectar a la base
con `psql` en `localhost:5432` sin problema.

## Causa

Cada contenedor tiene su propia interfaz de red. Dentro del contenedor de
la API, `localhost` y `127.0.0.1` se refieren **al contenedor mismo**, no
al host ni a los otros servicios. Como en ese contenedor no hay ningún
PostgreSQL escuchando, la conexión se rechaza.

Desde el host sí funciona porque ahí el puerto publicado por `ports` está
efectivamente escuchando. Son dos redes distintas y esa es la confusión.

## Solución

En la red que crea Docker Compose, cada servicio es alcanzable por el
**nombre del servicio**. La cadena de conexión debe usar ese nombre y el
**puerto interno**, no el publicado.

```yaml
# compose.yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    volumes:
      - datos_db:/var/lib/postgresql/data
    healthcheck:
      # pg_isready confirma que la base acepta conexiones,
      # no solo que el contenedor arrancó
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER}"]
      interval: 5s
      timeout: 3s
      retries: 10

  api:
    build: .
    environment:
      # 'db' es el nombre del servicio, no localhost
      # 5432 es el puerto interno, aunque afuera se publique otro
      DATABASE_URL: postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@db:5432/${POSTGRES_DB}
    depends_on:
      db:
        condition: service_healthy   # espera al healthcheck, no solo al arranque
    ports:
      - "3000:3000"

volumes:
  datos_db:
```

Dos cambios respecto al intento inicial:

1. `localhost` pasa a ser `db`, el nombre del servicio.
2. `depends_on` con `condition: service_healthy`. La forma corta de
   `depends_on` solo espera a que el contenedor arranque; PostgreSQL
   tarda unos segundos más en aceptar conexiones, y en ese intervalo la
   API falla igual.

## Referencia

Docker Docs — *Networking in Compose*: los servicios se resuelven por
nombre dentro de la red del proyecto.
https://docs.docker.com/compose/how-tos/networking/

Docker Docs — *Compose file reference: depends_on*, sobre
`service_healthy`.
https://docs.docker.com/reference/compose-file/services/#depends_on

## Notas

El mismo razonamiento aplica a Redis, al broker MQTT de la ruta I y a
cualquier servicio del compose: siempre nombre de servicio y puerto
interno.

Si la aplicación corre fuera de Docker y solo la base está en contenedor,
entonces sí es `localhost` con el puerto publicado. La confusión aparece
cuando se mezclan los dos escenarios entre desarrollo y despliegue.
