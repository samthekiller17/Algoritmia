Algoritmo FacturaRestaurante
	Definir subtotal, impuesto, propina Como Real
	
	subtotal <- LeerPedido()
	impuesto <- CalcularPorcentaje(subtotal, 8)
	propina <- CalcularPorcentaje(subtotal, 10)
	ImprimirFactura(subtotal, impuesto, propina)
FinAlgoritmo

SubProceso subtotal <- LeerPedido
	Definir cantBandejas, cantAjiaco Como Entero
	Definir precioBandeja, precioAjiaco, subtotal Como Real
	
	Escribir "Cantidad de bandejas:"
	Leer cantBandejas
	Escribir "Precio de la bandeja:"
	Leer precioBandeja
	Escribir "Cantidad de ajiacos:"
	Leer cantAjiaco
	Escribir "Precio del ajiaco:"
	Leer precioAjiaco
	
	subtotal <- cantBandejas * precioBandeja + cantAjiaco * precioAjiaco
FinSubProceso

SubProceso resultado <- CalcularPorcentaje(base, porcentaje)
	Definir resultado Como Real
	resultado <- base * porcentaje / 100
FinSubProceso

SubProceso ImprimirFactura(subtotal, impuesto, propina)
	Definir total Como Real
	total <- subtotal + impuesto + propina
	
	Escribir "----- FACTURA -----"
	Escribir "Subtotal: $", subtotal
	Escribir "Impuesto al consumo (8%): $", impuesto
	Escribir "Propina sugerida (10%): $", propina
	Escribir "TOTAL: $", total
FinSubProceso