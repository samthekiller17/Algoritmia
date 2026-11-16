Algoritmo CalculadoraPropinas
	
	Definir cuenta, porcentaje, personas Como Real;
	Definir propina, total, porPersona Como Real;
	
	Escribir "Valor de la cuenta:";
	Leer cuenta;
	Escribir "Porcentaje de propina (ej. 10):";
	Leer porcentaje;
	Escribir "Número de personas:";
	Leer personas;
	
	propina <- cuenta * porcentaje / 100;
	total <- cuenta + propina;
	porPersona <- total / personas;
	
	Escribir "Propina: ", propina;
	Escribir "Total a pagar: ", total;
	Escribir "Cada persona paga: ", porPersona;
FinAlgoritmo
