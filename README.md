# Tecnologías Web 2026-B · Muro de bloqueos y banco de conocimiento

Repositorio compartido por los dos grupos de la electiva de profundización **Tecnologías Web**
del programa de Ingeniería de Sistemas de Unitrópico.

Aquí no vive el código de ningún proyecto. Aquí viven dos cosas:

| Pieza | Dónde está | Para qué sirve |
| --- | --- | --- |
| **Muro de bloqueos** | Pestaña **Issues** y vista **Projects** | Hacer visible en qué está atascado cada equipo |
| **Banco de conocimiento** | Carpeta [`entradas/`](entradas/) | Dejar documentada cada solución para quien venga después |

Entre los dos pesan el **6 %** de la nota del semestre, y las revisiones de equipo espejo
otro **9 %**. No son actividades voluntarias.

---

## La regla que ordena todo

> **Ningún equipo puede permanecer bloqueado en silencio más de una semana.**

Si lleva más de tres días atascado en lo mismo, abra un issue. Callarlo no lo resuelve,
le cuesta la nota y le quita a sus compañeros la oportunidad de aprender de su problema.

---

## Cómo se usa

### 1. Publicar un bloqueo

Abra un issue con la plantilla **Bloqueo técnico**. La plantilla le pide describir qué intentó
antes de pedir ayuda: eso no es burocracia, es la mitad del trabajo de diagnosticar.

Etiquete el issue con su grupo (`grupo:1` o `grupo:2`) y su ruta (`ruta:A` … `ruta:I`).
Si el bloqueo pone en riesgo una entrega, agregue `bloquea-entrega`.

### 2. Resolver el bloqueo de otro equipo

Comente en el issue con la solución. Si funcionó, quien abrió el issue lo confirma
y lo cierra. **Quien resolvió un bloqueo ajeno recibe crédito por ello.**

### 3. Documentar la solución en el banco

Un issue cerrado todavía no es conocimiento: es una conversación desordenada.
El conocimiento es la entrada depurada.

1. Copie [`entradas/PLANTILLA.md`](entradas/PLANTILLA.md)
2. Renómbrela como `AAAA-MM-DD-tema-corto.md`
3. Diligencie los cuatro campos
4. Ábrala como pull request

La entrada entra al banco cuando el pull request se aprueba y se integra.

---

## Estados de un bloqueo

| Etiqueta | Significa |
| --- | --- |
| `estado:abierto` | Publicado, nadie lo está mirando todavía |
| `estado:en-analisis` | Alguien está trabajando en él |
| `estado:resuelto` | Funcionó, y la entrada del banco ya está integrada |

Un bloqueo no se cierra hasta que existe su entrada en `entradas/`.

---

## Qué se califica y cómo

El banco vale **6 %**. **No se califica por cantidad.** Tres entradas que le sirvan a alguien
que no vivió el problema valen más que quince de una línea. El criterio es simple:

> ¿Un compañero de otra ruta puede resolver su propio problema leyendo únicamente esta entrada?

Se valoran tres cosas, con la matriz CLEO de registro de aportes documentados:

- Bloqueos propios publicados a tiempo, no acumulados al final del corte
- Aportes reales a la resolución de bloqueos de otros equipos
- Calidad de las entradas del banco: reproducibles, con causa identificada y referencia verificable

El primer corte cierra en la **semana 8** y el segundo en la **semana 16**.
Los aportes se cuentan en el corte en que ocurrieron.

---

## Lo que no va aquí

- Código de los proyectos: ese va en el repositorio de cada equipo
- Credenciales, tokens, cadenas de conexión o archivos `.env` de nadie
- Datos personales reales de terceros
- Capturas de pantalla que expongan datos de pacientes, denunciantes o usuarios reales

Si necesita mostrar un error que incluye una credencial, reemplácela por `<REDACTADO>`
antes de publicar. Un secreto publicado en un repositorio público se considera filtrado
aunque después se borre el commit.

---

## Estructura del repositorio

```
.
├── entradas/                    Banco de conocimiento (una entrada por archivo)
│   ├── PLANTILLA.md
│   └── AAAA-MM-DD-tema.md
├── docs/
│   └── guia-estudiante.md       Guía de una página
├── scripts/
│   ├── crear-etiquetas.sh       Crea las etiquetas del repositorio (docente)
│   └── reporte-aportes.sh       Reporte de aportes por estudiante (docente)
└── .github/
    ├── ISSUE_TEMPLATE/          Plantilla de bloqueo
    └── PULL_REQUEST_TEMPLATE.md Plantilla de entrada al banco
```
| **Muro de bloqueos** | [Tablero](URL_DEL_TABLERO) y pestaña Issues | Hacer visible en qué está atascado cada equipo |
---

*Electiva de Profundización — Componente Desarrollo Web · Noveno semestre · Semestre 2026-B*
