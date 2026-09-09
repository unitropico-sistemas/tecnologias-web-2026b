# Guía de una página · Muro de bloqueos y banco de conocimiento

## La regla

**Ningún equipo puede estar bloqueado en silencio más de una semana.** Si lleva más de
tres días atascado en lo mismo, abra un issue.

## Los tres pasos

### 1. Publicar

Pestaña **Issues** → New issue → plantilla **Bloqueo técnico**.

La plantilla le pide síntoma, pasos para reproducirlo y **qué ya intentó**. Ese último
campo es obligatorio: un bloqueo sin intentos previos no es un bloqueo, es una pregunta
que no se hizo.

Etiquete con su grupo y su ruta. Si pone en riesgo una entrega, agregue `bloquea-entrega`.

### 2. Resolver el de otro

Comente en el issue con la solución. Quien abrió el issue confirma si funcionó.
**Resolver bloqueos ajenos suma nota.**

### 3. Documentar

Cuando algo se resuelve, hay que dejarlo escrito. El issue es la conversación
desordenada; la entrada del banco es el resultado depurado.

1. Copie `entradas/PLANTILLA.md`
2. Renómbrela `AAAA-MM-DD-tema-corto.md`
3. Diligencie los cuatro campos
4. Ábrala como pull request con `Closes #NN`

**Un bloqueo no se cierra hasta que existe su entrada.**

## Los cuatro campos

| Campo | Qué va ahí |
| --- | --- |
| **Síntoma** | Qué se observaba. Error literal, código de estado, comportamiento. |
| **Causa** | **Por qué ocurría.** No qué hizo para que dejara de ocurrir. |
| **Solución** | Qué cambió, con el fragmento mínimo de código o configuración. |
| **Referencia** | Documentación oficial o fuente verificable. No un foro sin respaldo. |

Si no logra explicar la causa, la entrada todavía no está lista. Ese es el punto del
ejercicio: entender, no solo destrabar.

## Cómo se califica

El banco vale **6 %** y las revisiones de equipo espejo **9 %**.

**No se califica por cantidad.** Tres entradas útiles valen más que quince triviales.
El criterio es uno solo:

> ¿Un compañero de otra ruta puede resolver su propio problema leyendo únicamente
> esta entrada?

Se valoran los bloqueos publicados a tiempo —no acumulados al final del corte—,
los aportes reales a bloqueos de otros equipos, y la calidad de las entradas.

## Antes de publicar cualquier cosa

- Nada de credenciales, tokens ni contenido de archivos `.env`. Reemplace por `<REDACTADO>`.
- Nada de datos personales reales de terceros, ni en el texto ni en las capturas.
- Un secreto publicado en un repositorio público se considera filtrado aunque
  después borre el commit.

## En clase

En los diez minutos del tablero abierto no se lee el issue en voz alta. Se dice el
número: «seguimos en el 14» o «cerramos el 9». El estado tiene que estar escrito
**antes** de entrar a clase.
