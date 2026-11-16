Algoritmo Piramide
	Definir n, fila, e, a Como Entero
	
	Escribir "Altura de la pirámide:"
	Leer n
	
	Para fila <- 1 Hasta n Con Paso 1 Hacer
		Para e <- 1 Hasta n - fila Con Paso 1 Hacer
			Escribir Sin Saltar " "
		FinPara
		Para a <- 1 Hasta 2 * fila - 1 Con Paso 1 Hacer
			Escribir Sin Saltar "*"
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo
