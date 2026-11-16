# Algoritmia · Sesión 1: Introducción

## Contenido

| Archivo | Descripción |
|---|---|
| `tinto.md` | Instrucciones del tinto del robot (10 pasos) |
| `01_Saludo.psc` | Pide el nombre y saluda |
| `02_EdadEnDias.psc` | Calcula los días vividos a partir de la edad |
| `03_Propinas.psc` | Calcula propina, total y valor por persona |
| `04_PromedioNotas.psc` | Promedio de 3 notas |
| `diagramas/` | Diagrama de flujo exportado de cada programa |

## 1. Saludo

**Entrada:** el nombre. **Proceso:** guardarlo en una variable de texto. **Salida:** un saludo.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | Samuel | Hola, Samuel. ¡Bienvenido a Algoritmia! |
| 2 | Camila | Hola, Camila. ¡Bienvenido a Algoritmia! |

## 2. Edad en días

**Entrada:** edad en años. **Proceso:** `edad * 365`. **Salida:** días vividos.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | 20 | Has vivido aproximadamente 7300 días. |
| 2 | 18 | Has vivido aproximadamente 6570 días. |

El resultado es aproximado porque no cuenta los años bisiestos (29 de febrero).

## 3. Calculadora de propinas

**Entrada:** cuenta, porcentaje de propina y número de personas.
**Proceso:** `propina = cuenta * porcentaje / 100`, `total = cuenta + propina`, `porPersona = total / personas`.
**Salida:** propina, total y lo que paga cada persona.

Cada paso del proceso usa su propia variable. Escribirlo todo en una sola línea hace la división antes que la suma y da un resultado incorrecto.

| Prueba | Entrada (cuenta, %, personas) | Salida |
|---|---|---|
| 1 | 120000, 10, 4 | Propina: 12000, Total: 132000, Cada persona: 33000 |
| 2 | 50000, 15, 2 | Propina: 7500, Total: 57500, Cada persona: 28750 |

Con 0 personas el programa falla por división entre cero. Se resuelve con decisiones (sesión 2).

## 4. Promedio de notas

**Entrada:** 3 notas de 0 a 5. **Proceso:** `suma = nota1 + nota2 + nota3`, `promedio = suma / 3`. **Salida:** el promedio.

Las notas son variables Real porque tienen decimales.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | 4, 3.5, 4.5 | (completar con lo que te dé tu programa: debe ser 4) |
| 2 | 3, 3, 4 | (completar con lo que te dé tu programa: debe ser 3.33) |

## Lista de entrega

- [x] `tinto.md`
- [x] 4 programas de PSeInt
- [x] Diagramas de flujo exportados en `diagramas/` (uno por programa)
- [x] Pruebas del programa 4 completas
- [x] Commit y push
