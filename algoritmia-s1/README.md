# Algoritmia · Sesión 1: Introducción

## Contenido

| Archivo | Descripción |
|---|---|
| `tinto.md` | Instrucciones para preparar tinto (10 pasos) |
| `preparar-limonada.md` | Algoritmo para preparar limonada |
| `cruzar-la-quebrada.md` | Solución paso a paso del problema del campesino, el perro, la gallina y el maíz |
| `01_Saludo.psc` | Pide el nombre y muestra un saludo |
| `02_EdadEnDias.psc` | Calcula los días vividos a partir de la edad |
| `03_Propinas.psc` | Calcula propina, total y valor por persona |
| `04_PromedioNotas.psc` | Calcula el promedio de tres notas |
| `05_positivo-negativo-cero.psc` | Clasifica un número como positivo, negativo o cero |
| `06_AreaRectangulo.psc` | Calcula el área de un rectángulo |
| `diagramas/` | Diagramas de flujo de los programas iniciales |

## 1. Saludo

**Entrada:** el nombre.  
**Proceso:** guardarlo en una variable de texto.  
**Salida:** un saludo.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | Samuel | Hola, Samuel. ¡Bienvenido a Algoritmia! |
| 2 | Camila | Hola, Camila. ¡Bienvenido a Algoritmia! |

## 2. Edad en días

**Entrada:** edad en años.  
**Proceso:** `edad * 365`.  
**Salida:** días vividos aproximados.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | 20 | Has vivido aproximadamente 7300 días. |
| 2 | 18 | Has vivido aproximadamente 6570 días. |

El resultado es aproximado porque no cuenta los años bisiestos.

## 3. Calculadora de propinas

**Entrada:** cuenta, porcentaje de propina y número de personas.  
**Proceso:** calcula la propina, el total y el valor que paga cada persona.  
**Salida:** propina, total y pago individual.

| Prueba | Entrada (cuenta, %, personas) | Salida |
|---|---|---|
| 1 | 120000, 10, 4 | Propina: 12000, Total: 132000, Cada persona: 33000 |
| 2 | 50000, 15, 2 | Propina: 7500, Total: 57500, Cada persona: 28750 |

Con cero personas el programa fallaría por división entre cero; esta validación se aborda con decisiones en la sesión 2.

## 4. Promedio de notas

**Entrada:** tres notas entre 0 y 5.  
**Proceso:** suma las notas y divide el resultado entre 3.  
**Salida:** promedio final.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | 4, 3.5, 4.5 | 4 |
| 2 | 3, 3, 4 | 3.33 |

Las notas se almacenan como valores reales para permitir decimales.

## 5. Positivo, negativo o cero

**Entrada:** un número real.  
**Proceso:** compara el número con cero mediante decisiones anidadas.  
**Salida:** indica si el número es positivo, negativo o cero.

| Prueba | Entrada | Salida |
|---|---|---|
| 1 | 8 | El número ingresado es Positivo |
| 2 | -3.5 | El número ingresado es Negativo |
| 3 | 0 | El número ingresado es Cero |

## 6. Área de un rectángulo

**Entrada:** base y altura.  
**Proceso:** `area <- base * altura`.  
**Salida:** el área del rectángulo.

| Prueba | Entrada (base, altura) | Salida |
|---|---|---|
| 1 | 5, 3 | El área del rectángulo es: 15 |
| 2 | 8.5, 2 | El área del rectángulo es: 17 |

## Ejercicios de pensamiento algorítmico

- `tinto.md`: instrucciones ordenadas para preparar un tinto.
- `preparar-limonada.md`: procedimiento para preparar una limonada.
- `cruzar-la-quebrada.md`: solución en siete viajes para cruzar la quebrada sin que el perro se coma a la gallina ni la gallina al maíz.

## Lista de entrega

- [x] Ejercicios documentados
- [x] 6 programas en PSeInt
- [x] Diagramas de flujo de los programas iniciales
- [x] Pruebas de escritorio
- [x] Commit y push