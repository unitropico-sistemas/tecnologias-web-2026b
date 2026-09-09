# El navegador bloquea el POST por CORS aunque el GET funciona

| | |
| --- | --- |
| **Bloqueo** | #14 |
| **Ruta** | B |
| **Grupo** | 1 |
| **Equipo** | Equipo 2 |
| **Autor** | @ejemplo |
| **Fecha** | 2026-09-24 |

## Síntoma

Las peticiones GET al backend funcionaban con normalidad, pero al enviar el formulario
de registro con POST la petición nunca llegaba al servidor. En la consola del navegador
aparecía el mensaje de política CORS y en la pestaña de red se veía una petición OPTIONS
respondida con 404.

## Causa

El POST con `Content-Type: application/json` no es una petición simple, así que el
navegador envía primero una petición de verificación previa con el método OPTIONS.
El servidor solo tenía definidas las rutas GET y POST, de modo que respondía 404 al
OPTIONS y el navegador cancelaba la petición real antes de enviarla. El GET sí
funcionaba porque no dispara verificación previa.

## Solución

Registrar el middleware de CORS antes de las rutas y declarar explícitamente el origen,
los métodos y los encabezados permitidos.

```js
// app.js — antes de app.use('/api', rutas)
import cors from 'cors';

app.use(cors({
  origin: process.env.ORIGEN_PERMITIDO,   // no usar '*' si hay credenciales
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
}));
```

El orden importa: si el middleware se registra después de las rutas, nunca alcanza a
responder el OPTIONS.

## Referencia

MDN Web Docs — *Cross-Origin Resource Sharing (CORS)*, sección sobre peticiones con
verificación previa: https://developer.mozilla.org/es/docs/Web/HTTP/CORS

## Notas

Si el frontend envía cookies o el encabezado `Authorization`, `origin` no puede ser `*`.
En ese caso hay que declarar el origen exacto, y por eso conviene tenerlo en una variable
de entorno distinta en desarrollo y en producción.
