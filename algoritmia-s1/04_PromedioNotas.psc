Algoritmo PromedioNotas
	
	Definir nota1, nota2, nota3 Como Real;
	Definir suma, promedio Como Real;
	
	Escribir "Nota 1 (0 a 5):";
	Leer nota1;
	Escribir "Nota 2 (0 a 5):";
	Leer nota2;
	Escribir "Nota 3 (0 a 5):";
	Leer nota3;
	
	suma <- nota1 + nota2 + nota3;
	promedio <- suma / 3;
	
	Escribir "El promedio es: ", promedio;
FinAlgoritmo
