Algoritmo Parqueadero
	Definir tipo, minutos, horas Como Entero
	Definir tarifa, valor Como Real
	Definir factura Como Caracter
	
	Escribir "Tipo de vehículo (1 = Carro, 2 = Moto):"
	Leer tipo
	Escribir "Minutos de permanencia:"
	Leer minutos
	Escribir "¿Tiene factura del centro comercial? (S/N)"
	Leer factura
	factura <- Mayusculas(factura)
	
	Si minutos < 0 Entonces
		Escribir "Error: minutos negativos"
	SiNo
		Segun tipo Hacer
			1:
				tarifa <- 4000
			2:
				tarifa <- 2000
			De Otro Modo:
				tarifa <- 0
		FinSegun
		
		Si tarifa = 0 Entonces
			Escribir "Error: tipo no válido"
		SiNo
			Si minutos <= 15 Entonces
				Escribir "Gratis. Valor a pagar: 0"
			SiNo
				horas <- trunc((minutos + 59) / 60)
				valor <- horas * tarifa
				
				Si valor > 30000 Entonces
					valor <- 30000
				FinSi
				
				Si factura = "S" Entonces
					valor <- valor / 2
				FinSi
				
				Escribir "Valor a pagar: $", valor
			FinSi
		FinSi
	FinSi
FinAlgoritmo
