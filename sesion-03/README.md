# Algoritmia · Sesión 3: Repetir y descomponer

## Contenido

| Archivo | Programa | Patrón principal |
|---|---|---|
| `01_CajeroParqueadero.psc` | Cobra carro por carro hasta que se escribe 0 | Centinela, contador y acumulador |
| `02_Calificaciones.psc` | Estadísticas de 5 notas en un solo ciclo `Para` | Acumulador, contador, máximo, mínimo y bandera |
| `03_Piramide.psc` | Dibuja una pirámide de `n` pisos | Ciclos anidados |
| `04_FacturaRestaurante.psc` | Factura con impuesto y propina | Subprocesos |

---

## 1. CajeroParqueadero

El cajero no sabe cuántos carros van a llegar, así que usa `Mientras`. El valor `0` es el **centinela**: la señal de cerrar la caja.

### Las 4 partes del ciclo

| Parte | En este programa |
|---|---|
| Inicio | `carros <- 0`, `total <- 0` y la primera lectura de `valor`, antes del ciclo |
| Condición | `Mientras valor <> 0` |
| Cuerpo | `total <- total + valor` y `carros <- carros + 1` |
| Actualización | `Leer valor` dentro del ciclo |

Sin el segundo `Leer valor`, `valor` se quedaría en 4000 para siempre y el ciclo no terminaría nunca.

### Tabla de traza (entradas: 4000, 8000, 2000, 0)

| Vuelta | valor | total | carros | lee |
|---|---|---|---|---|
| Antes del ciclo | 4000 | 0 | 0 | — |
| 1 | 4000 | 4000 | 1 | 8000 |
| 2 | 8000 | 12000 | 2 | 2000 |
| 3 | 2000 | 14000 | 3 | 0 |
| Fin | 0 | 14000 | 3 | `valor <> 0` es Falso, sale |

**Resultado:** 3 carros atendidos y $14.000 recaudados.

### Casos borde

| # | Entradas | Esperado |
|---|---|---|
| 1 | 0 (nada más) | 0 carros, $0 (el ciclo no da ninguna vuelta) |
| 2 | 4000, 0 | 1 carro, $4.000 |
| 3 | 4000, 8000, 2000, 0 | 3 carros, $14.000 |

---

## 2. Calificaciones

En **una sola pasada** (`Para i <- 1 Hasta 5`) se calcula todo. El promedio se calcula **después** del ciclo (`suma / 5`).

Valores iniciales: `suma <- 0`, `aprobados <- 0`, `mayor <- 0`, `menor <- 5`, `alguienPerdio <- Falso`. El mayor arranca en 0 y el menor en 5 para que la primera nota siempre los reemplace.

### Tabla de traza (notas: 3.5, 2.8, 4.9, 3.0, 4.2)

| i | nota | suma | aprobados | mayor | menor | alguienPerdio |
|---|---|---|---|---|---|---|
| Antes | — | 0 | 0 | 0 | 5 | Falso |
| 1 | 3.5 | 3.5 | 1 | 3.5 | 3.5 | Falso |
| 2 | 2.8 | 6.3 | 1 | 3.5 | 2.8 | Verdadero |
| 3 | 4.9 | 11.2 | 2 | 4.9 | 2.8 | Verdadero |
| 4 | 3.0 | 14.2 | 3 | 4.9 | 2.8 | Verdadero |
| 5 | 4.2 | 18.4 | 4 | 4.9 | 2.8 | Verdadero |

Después del ciclo: `promedio <- 18.4 / 5 = 3.68`.

| Resultado | Esperado | Obtenido |
|---|---|---|
| Promedio | 3.68 | 3.68 |
| Aprobados | 4 | 4 |
| Nota más alta | 4.9 | 4.9 |
| Nota más baja | 2.8 | 2.8 |
| ¿Alguien perdió? | Sí | Hay estudiantes en refuerzo |

---

## 3. Pirámide

Dos ciclos anidados: el de afuera recorre las **filas** y el de adentro dibuja cada fila (primero los espacios y luego los asteriscos).

- Espacios en la fila `f`: `n - f` (de 1 hasta `n - fila`, con `Con Paso 1`).
- Asteriscos en la fila `f`: `2 * f - 1` (números impares: 1, 3, 5, 7).

El error típico es escribir `2 * fila`: da 2, 4, 6, 8 y sale una escalera en vez de una pirámide. Es un error por uno.

### Tabla de traza (n = 4)

| Fila | Espacios (`n - fila`) | Asteriscos (`2 * fila - 1`) |
|---|---|---|
| 1 | 3 | 1 |
| 2 | 2 | 3 |
| 3 | 1 | 5 |
| 4 | 0 | 7 |

En la última fila hay 0 espacios: `Para e <- 1 Hasta 0 Con Paso 1` no da ninguna vuelta. Ese es el caso borde.

### Resultado esperado

```
   *
  ***
 *****
*******
```

---

## 4. FacturaRestaurante

El problema grande se parte en piezas pequeñas (subprocesos):

| Subproceso | Recibe | Devuelve |
|---|---|---|
| `LeerPedido` | nada | el subtotal |
| `CalcularPorcentaje(base, porcentaje)` | una base y un porcentaje | el valor del porcentaje |
| `ImprimirFactura(subtotal, impuesto, propina)` | los tres valores | nada, muestra la factura |

El impuesto al consumo (8 %) y la propina (10 %) son **el mismo problema**: calcular un porcentaje. Por eso se escribe un solo subproceso y se usa dos veces.

### Algoritmo principal

```
subtotal <- LeerPedido()
impuesto <- CalcularPorcentaje(subtotal, 8)
propina  <- CalcularPorcentaje(subtotal, 10)
ImprimirFactura(subtotal, impuesto, propina)
```

### Prueba de escritorio (2 bandejas de $25.000 y 1 ajiaco de $12.000)

| Paso | Cálculo | Resultado |
|---|---|---|
| 1 | subtotal = 2 × 25.000 + 1 × 12.000 | 62.000 |
| 2 | impuesto = 62.000 × 8 / 100 | 4.960 |
| 3 | propina = 62.000 × 10 / 100 | 6.200 |
| 4 | total = 62.000 + 4.960 + 6.200 | **73.160** |

---

## 5. Árbol de componentes: tienda de ropa en línea

Una página web se descompone en un árbol de cajas, igual que con Flexbox y Grid en HTML. La tarjeta de producto se repite para cada producto: es un **ciclo**. Cada caja tiene su trabajo y se reutiliza, como un **subproceso**.

```
Página
├── Encabezado
│   ├── Logo
│   ├── Menú
│   │   ├── Hombre
│   │   ├── Mujer
│   │   └── Ofertas
│   └── Carrito
├── Contenido
│   ├── Filtros
│   │   ├── Talla
│   │   └── Precio
│   └── Lista de productos
│       └── Tarjeta de producto  ×N  (se repite: es un ciclo)
│           ├── Imagen
│           ├── Nombre y precio
│           └── Botón «Agregar al carrito»
└── Pie de página
    ├── Contacto
    └── Redes sociales
```

| Idea de la sesión | En la página |
|---|---|
| Ciclo | La tarjeta de producto se repite una vez por cada producto |
| Subproceso | Cada caja (encabezado, tarjeta, pie) tiene un trabajo y se reutiliza |
| Descomponer | La página grande se parte en cajas pequeñas |

---

## Lista de entrega

- [x] 4 archivos de PSeInt en esta carpeta
- [x] Tabla de traza del cajero
- [x] Tabla de traza de la pirámide
- [x] Árbol de componentes
- [x] Commit y push
