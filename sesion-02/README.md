# Algoritmia · Sesión 2: Lógica y decisiones

## Contenido

| Archivo | Programa |
|---|---|
| `01_ValidarRegistro.psc` | Registro con edad mínima (14) y términos aceptados |
| `02_ValidarEdad.psc` | Validación de edad (0 a 120) usando la Ley de De Morgan |
| `03_Parqueadero.psc` | Tarifa del parqueadero con tope diario y descuento por factura |
| `04_Semaforo.psc` | Semáforo de inventario |
| `05_Bisiesto.psc` | Año bisiesto |

---

## 1. ValidarRegistro

**Regla:** te registras si tienes 14 años o más **Y** aceptas los términos.

### Tabla de verdad

| `edad >= 14` | Acepta los términos | Resultado |
|---|---|---|
| Verdadero | Verdadero | Registro exitoso |
| Verdadero | Falso | No puedes registrarte |
| Falso | Verdadero | No puedes registrarte |
| Falso | Falso | No puedes registrarte |

### Pruebas

La respuesta se convierte a mayúsculas con `Mayusculas` antes de comparar, así que «s» y «S» funcionan igual.

| # | Edad | Respuesta | Esperado | Obtenido |
|---|---|---|---|---|
| 1 | 14 | S | Registro exitoso | Registro exitoso |
| 2 | 13 | S | No puedes registrarte | No puedes registrarte |
| 3 | 20 | N | No puedes registrarte | No puedes registrarte |
| 4 | 20 | s | Registro exitoso | Registro exitoso |

### Prueba de escritorio (edad 20, respuesta «s»)

| Paso | Instrucción | edad | respuesta | Condición |
|---|---|---|---|---|
| 1 | `Leer edad` | 20 | — | — |
| 2 | `Leer respuesta` | 20 | s | — |
| 3 | `Mayusculas(respuesta)` | 20 | S | — |
| 4 | `edad >= 14 Y respuesta = "S"` | 20 | S | V Y V = **Verdadero** |
| 5 | Salida | | | Registro exitoso |

---

## 2. ValidarEdad (negar sin equivocarse)

- Edad válida: `edad >= 0 Y edad <= 120`
- Edad inválida (De Morgan): `edad < 0 O edad > 120`

Al negar se invierten las comparaciones **y** se cambia el Y por O. Si se dejara `Y`, ningún número cumpliría las dos condiciones a la vez (nada es menor que 0 y mayor que 120) y el programa aceptaría cualquier edad.

### Pruebas

| # | Edad | `edad < 0` | `edad > 120` | Inválida (O) | Esperado | Obtenido |
|---|---|---|---|---|---|---|
| 1 | -1 | V | F | **V** | Edad inválida | Edad inválida |
| 2 | 0 | F | F | **F** | Edad válida (borde) | Edad válida |
| 3 | 120 | F | F | **F** | Edad válida (borde) | Edad válida |
| 4 | 121 | F | V | **V** | Edad inválida | Edad inválida |

---

## 3. Parqueadero

### Reglas

1. Carro: $4.000 por hora o fracción. Moto: $2.000 por hora o fracción.
2. Los primeros 15 minutos son gratis.
3. El cobro máximo del día es $30.000.
4. Con factura del centro comercial se paga la mitad, **después** de aplicar el máximo.
5. Si el tipo no es carro ni moto, o los minutos son negativos: error.

«Hora o fracción» significa que con 61 minutos se pagan 2 horas. Se calcula con `trunc((minutos + 59) / 60)`.

### Tabla de decisión

| Regla | Tipo | Minutos | Factura | Resultado |
|---|---|---|---|---|
| R1 | Cualquiera | Menos de 0 | Cualquiera | Error: minutos negativos |
| R2 | Ni 1 ni 2 | 0 o más | Cualquiera | Error: tipo no válido |
| R3 | Carro o moto | De 0 a 15 | Cualquiera | Gratis |
| R4 | Carro o moto | Más de 15 | No | Horas × tarifa, máximo $30.000 |
| R5 | Carro o moto | Más de 15 | Sí | Lo mismo que R4, dividido entre 2 |

### Casos borde

El tipo se ingresa como 1 (carro) o 2 (moto).

| # | Tipo | Minutos | Factura | Esperado | Obtenido |
|---|---|---|---|---|---|
| 1 | Carro | 15 | No | 0 | Gratis. Valor a pagar: 0 |
| 2 | Carro | 16 | No | 4.000 | Valor a pagar: $4000 |
| 3 | Carro | 60 | No | 4.000 | Valor a pagar: $4000 |
| 4 | Carro | 61 | No | 8.000 | Valor a pagar: $8000 |
| 5 | Moto | 61 | Sí | 2.000 | Valor a pagar: $2000 |
| 6 | Carro | 600 | No | 30.000 (tope) | Valor a pagar: $30000 |
| 7 | Carro | 600 | Sí | 15.000 | Valor a pagar: $15000 |
| 8 | 3 | 30 | No | Tipo no válido | Error: tipo no válido |
| 9 | Carro | -5 | No | Minutos negativos | Error: minutos negativos |

### Prueba de escritorio del caso 4 (carro, 61 min, sin factura)

| Paso | Instrucción | Valor |
|---|---|---|
| 1 | `minutos < 0` | Falso, sigue |
| 2 | `Segun tipo` (1) → `tarifa` | 4.000 |
| 3 | `tarifa = 0` | Falso, el tipo es válido |
| 4 | `minutos <= 15` | Falso (61 > 15) |
| 5 | `horas <- trunc((61 + 59) / 60)` = trunc(2) | 2 |
| 6 | `valor <- horas * tarifa` | 8.000 |
| 7 | `valor > 30000` | Falso, no se aplica tope |
| 8 | `factura = "S"` | Falso, sin descuento |
| 9 | Salida | **$8.000** |

### Prueba de escritorio del caso 7 (carro, 600 min, con factura)

| Paso | Instrucción | Valor |
|---|---|---|
| 1 | `tarifa` (tipo 1) | 4.000 |
| 2 | `horas <- trunc((600 + 59) / 60)` = trunc(10,98) | 10 |
| 3 | `valor <- horas * tarifa` | 40.000 |
| 4 | tope: `valor > 30000` → `valor <- 30000` | 30.000 |
| 5 | factura: `valor <- valor / 2` | 15.000 |
| 6 | Salida | **$15.000** |

El tope va **antes** del descuento. Si se invierte el orden, 40.000 / 2 = 20.000 y luego el tope no lo toca: el resultado sería $20.000 y no $15.000.

---

## 4. Semáforo de inventario

### Tabla de decisión

| Unidades | Resultado |
|---|---|
| Menos de 0 | Error |
| 0 | Rojo: agotado |
| De 1 a 10 | Amarillo: hay que pedir |
| Más de 10 | Verde: todo bien |

### Casos borde

Se prueba justo en cada cambio de regla: -1 / 0, 0 / 1 y 10 / 11.

| # | Unidades | Esperado | Obtenido |
|---|---|---|---|
| 1 | -1 | Error | Error: las unidades no pueden ser negativas |
| 2 | 0 | Rojo: agotado | ROJO: agotado |
| 3 | 1 | Amarillo: hay que pedir | AMARILLO: hay que pedir |
| 4 | 10 | Amarillo: hay que pedir | AMARILLO: hay que pedir |
| 5 | 11 | Verde: todo bien | VERDE: todo bien |

---

## 5. Año bisiesto

**Condición:** `(anio MOD 4 = 0 Y anio MOD 100 <> 0) O anio MOD 400 = 0`

En el código la variable se llama `anio` (sin ñ) para evitar problemas de codificación en PSeInt.

| Año | MOD 4 = 0 | MOD 100 <> 0 | (A Y B) | MOD 400 = 0 | Resultado (O) | ¿Bisiesto? | Obtenido |
|---|---|---|---|---|---|---|---|
| 2026 | F | V | F | F | **F** | No | 2026 no es bisiesto |
| 2024 | V | V | V | F | **V** | Sí | 2024 es bisiesto |
| 1900 | V | F | F | F | **F** | No | 1900 no es bisiesto |
| 2000 | V | F | F | V | **V** | Sí | 2000 es bisiesto |

Los paréntesis importan: `Y` se evalúa antes que `O`, y aun así se dejan para que la condición se lea sin dudas.

---

## Lista de entrega

- [x] 5 archivos de PSeInt en esta carpeta
- [x] Tablas de verdad y de decisión
- [x] Pruebas de escritorio
- [x] Columnas «Obtenido» completas
- [x] Commit y push
