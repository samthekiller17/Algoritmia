# Cruzar la quebrada

Un campesino debe cruzar con un perro, una gallina y un bulto de maíz. La canoa solo lleva al campesino y una cosa más.

**Restricciones:**
- Si quedan solos el perro y la gallina, el perro se come la gallina.
- Si quedan solos la gallina y el maíz, la gallina se come el maíz.

## Entrada, proceso y salida

| Entrada | Proceso | Salida |
|---|---|---|
| Campesino, perro, gallina y maíz en la orilla de salida | Los 7 viajes, en orden | Los cuatro en la otra orilla, sin perder nada |

## Algoritmo

1. Cruza con la gallina.
2. Regresa solo.
3. Cruza con el perro.
4. Regresa con la gallina.
5. Cruza con el maíz.
6. Regresa solo.
7. Cruza con la gallina.
8. Fin.

El truco está en el paso 4: a veces hay que devolverse para poder avanzar.
