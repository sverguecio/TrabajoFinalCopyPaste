// Programa para controlar el uso de las cocheras de un estacionamiento

//Proceso Principal
Proceso SistemaDeCocheras
	Definir opcion,cocheras Como Entero; // definimos las variable a utilizar y las matrices 
	Definir matriz Como Caracter;	
	Dimension matriz[1000,4];

	MenuPrincipal(matriz, cocheras);
		
FinProceso

//Este es el menu de carga Principal
SubProceso MenuPrincipal(matriz Por Referencia,cocheras Por Referencia)
	Definir opcion Como Entero; 
	Repetir
		Borrar Pantalla;
		Escribir '_______MENU PRINCIPAL______';
		Escribir '1. Español';
		Escribir '2. English';		
		Escribir '3. Salir / Exit';		
		Escribir '___________________________';
		Escribir 'Elija una opción de menú: ';
		Escribir 'Choose a menu option: ' Sin Saltar;
		Leer opcion;
		Escribir '';
		// evaluamos la seleccion del usuario
		Segun opcion  Hacer
			1:
				BienvenidoEspanol(matriz,cocheras);
			2:
				BienvenidoIngles(matriz,cocheras);	
			3: 
				MensajeDespedida();
			De Otro Modo:
				Borrar Pantalla;
				Escribir '___________________________';
				Escribir 'opción de menú inválida';
				Escribir 'invalid menu option';
				
				Escribir '___________________________';
				Escribir 'Presione enter para continuar';
				Escribir 'Press enter to continue';
				Esperar Tecla;
		FinSegun
	Hasta Que opcion=3
	
FinSubProceso

// Este SubProceso sin para InicializarMatriz con vacio
SubProceso InicializarMatriz(matriz Por Referencia,cocheras Por Referencia) 
	Definir i,j Como Entero;
	Para i<-0 Hasta cocheras Hacer
		Para j<-0 Hasta 3 Hacer
			matriz[i,j]<-'';
		FinPara
	FinPara
FinSubProceso


//SUBPROCESOS EN ESPAÑOL 
//MENSAJE DE BIENVENIDO Y LECTURA DE VARIABLES DE CANTIDAD DE COCHERAS
SubProceso BienvenidoEspanol (matriz Por Referencia,cocheras Por Referencia)
	Borrar Pantalla;
	
	Definir opcion Como Entero; // definimos las variable a utilizar y las matrices 
	
	Escribir ' ____  _                           _     _           ';
	Escribir '| __ )(_) ___ _ ____   _____ _ __ (_) __| | ___  ___ ';
	Escribir '|  _ \| |/ _ \  _ \ \ / / _ \  _ \| |/ _` |/ _ \/ __|';
	Escribir '| |_) | |  __/ | | \ V /  __/ | | | | (_| | (_) \__ \';
	Escribir '|____/|_|\___|_| |_|\_/ \___|_| |_|_|\__,_|\___/|___/';
	Escribir '';
	Escribir 'Cuantas cocheras tienes disponible:' Sin Saltar;
	Leer cocheras;
	// Esperar Tecla
	cocheras <- cocheras-1;
	// cocheras <- 9; //esta variable asigna la cantidad de cocheras a utilizar incluye la posicion 0 (cero)
	InicializarMatriz(matriz,cocheras); // Llamamos al Sub Proceso InicializarMatriz con en fin de cargar VACIO la matriz de 4 x 4 
	// creamos un menu para poder elegir la accion a realizar	
	IdiomaEspanol(matriz,cocheras);
	
FinSubProceso

SubProceso IdiomaEspanol (matriz Por Referencia, cocheras Por Referencia) 
	Definir opcion Como Entero; 
	Borrar Pantalla;
	
	Repetir
		Borrar Pantalla;
		Escribir '____________MENU__________';
		Escribir '1. Ingreso de Vehiculos';
		Escribir '2. Salida de Vehiculos';
		Escribir '3. Ver Cocheras Disponible';
		Escribir '4. Al menu principal';
		Escribir '___________________________';
		Escribir 'Elija una opcion de menu: ' Sin Saltar;
		Leer opcion;
		Escribir '';
		// evaluamos la seleccion del usuario
		Segun opcion  Hacer
			1:
				IngresoVehiculosEspanol(matriz,cocheras);
			2:
				SalidaVeniculosEspanol(matriz,cocheras);
			3:
				VerCocherasEspanol(matriz,cocheras, idioma);
			4:
				
			De Otro Modo:
				Borrar Pantalla;
				Escribir '___________________________';
				Escribir 'opcion de menu invalida';
				Escribir '___________________________';
				Escribir 'Presione enter para continuar';
				Esperar Tecla;
		FinSegun
	Hasta Que opcion=4
	MenuPrincipal(matriz, cocheras );
FinSubProceso



SubProceso IngresoVehiculosEspanol(matriz Por Referencia,cocheras Por Referencia)
	Definir i,j,inicio Como Entero;
	Definir libre Como Logico;
	libre <- Falso; // inicializamos libre como falso 
	Para i<-cocheras Hasta 0 Con Paso -1 Hacer // recorremos la matriz solo mirando en la primer columna a fin de verificar si se encuentra vacia
		Para j<-0 Hasta 0 Hacer
			// Condicional para verificar vacio si no esta vacio asignamos el valor de la fila a i y cambiamos la variable libre con verdadero
			Si matriz[i,j]='' Entonces
				inicio <- i;
				libre <- Verdadero;
			FinSi
		FinPara
	FinPara
	// Verificacion de la variable libre si se encontro algun espacio vacio el estado de la variable habrá cambiado a verdadero caso contrario se inicializo como falso
	Si libre=Verdadero Entonces
		Borrar Pantalla;
		// recorremos la matriz pero en la fila que se encontro vacia
		Para i<-inicio Hasta inicio Hacer
			Para j<-0 Hasta 3 Hacer
				Si j=0 Entonces
					Escribir 'Escriba tipo vehiculo' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=1 Entonces
					Escribir 'Escriba tipo Dominio' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=2 Entonces
					Escribir 'Escriba Fecha Ingreso' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=3 Entonces
					Escribir 'Escriba Hora de Ingreso' Sin Saltar;
					Leer matriz[i,j];
				FinSi
			FinPara
		FinPara
	SiNo
		// caso contrario se mostrara el mensaje de ESTAMOS LLENOS
		Borrar Pantalla;
		Escribir '___________________________';
		Escribir 'ESTAMOS LLENOS!!';
		Escribir '___________________________';
		Escribir 'Presione enter para continuar';
		Esperar Tecla;
	FinSi
	IdiomaEspanol(matriz,cocheras);
FinSubProceso

SubProceso VerCocherasEspanol(matriz Por Referencia,cocheras Por Referencia,idioma Por Referencia) // Simplemete impreme por pantalla el contenido de la matriz
	Borrar Pantalla;
	Definir i,j Como Entero;
	Escribir '___________________________________________________';
	Para i<-0 Hasta cocheras Hacer
		Para j<-0 Hasta 0 Hacer
			Si matriz[i,j]='' Entonces
				Escribir '|Cochera ',i+1,' Disponible |' Sin Saltar;
			SiNo
				Escribir 'Cochera ',i+1,': ' Sin Saltar;
				Para j<-0 Hasta 3 Hacer
					Escribir matriz[i,j],' - ' Sin Saltar;
				FinPara
			FinSi
		FinPara
		Escribir '';
		Escribir '___________________________________________________';
	FinPara
	Escribir 'Presione enter para continuar';
	Esperar Tecla;
	
	IdiomaEspanol(matriz,cocheras);	
FinSubProceso




SubProceso SalidaVeniculosEspanol(matriz Por Referencia,cocheras Por Referencia) // SubProceso para dar salida a los vehiculos
	Borrar Pantalla;
	Definir i,j,fila Como Entero;
	Definir dominio Como Caracter;
	Definir noencontrado,encontrado Como Logico;
	// se solicita ingresar una busqueda 
	Escribir 'Ingresa el Dominio a Buscar';
	Leer dominio;
	encontrado <- Falso;
	Escribir '___________________________________________________';
	// se procede a buscar en la matriz solo mirando la segunda columna donde guardamos el dominio
	Para i<-0 Hasta cocheras Hacer
		Para j<-1 Hasta 1 Hacer
			// se evalua lo ingresado con lo guardado en la matriz
			Si matriz[i,j]=dominio Entonces
				fila <- i;
				encontrado <- Verdadero;
			FinSi
		FinPara
	FinPara
	// se evalua la variable econtrado 	
	Si encontrado=Verdadero Entonces
		Escribir 'Se encontro el Domino en: ' Sin Saltar;
		Escribir '';
		// Se muestra el contenido de la matriz en la fila donde se encontro el dominio
		Para i<-fila Hasta fila Hacer
			Para j<-0 Hasta 3 Hacer
				Escribir 'Cochera ',i+1,' -->> ' Sin Saltar;
				Para j<-0 Hasta 3 Hacer
					Escribir matriz[i,j],' - ' Sin Saltar;
				FinPara
			FinPara
		FinPara
		Escribir '';
		Escribir '___________________________________________________';
		Escribir 'PROCEDE A COBRAR EL IMPORTE, SE LIBERARÁ LA COCHERA';
		Escribir '___________________________________________________';
		// se borran los datos de la fila para que se utilice nuevamente esa fila
		Para i<-fila Hasta fila Hacer
			Para j<-0 Hasta 3 Hacer
				matriz[i,j]<-'';
			FinPara
		FinPara
	SiNo
		// caso contrario se muestra un mensaje de que no se encontro el dominio
		Escribir 'NO se encontro el Dominio que buscas';
		Escribir '___________________________________________________';
	FinSi
	Escribir 'Presione enter para continuar';
	Esperar Tecla;
	IdiomaEspanol(matriz,cocheras);
FinSubProceso


//SUBPROCESOS EN INGLES 

SubProceso BienvenidoIngles (matriz Por Referencia,cocheras Por Referencia)
	Borrar Pantalla;
	
	Definir opcion Como Entero; // definimos las variable a utilizar y las matrices 

	
	
	Escribir '__        _______ _     ____ ___  __  __ _____ ';
	Escribir '\ \      / / ____| |   / ___/ _ \|  \/  | ____|';
	Escribir ' \ \ /\ / /|  _| | |  | |  | | | | |\/| |  _|  ';
	Escribir '  \ V  V / | |___| |__| |__| |_| | |  | | |___ ';
	Escribir '   \_/\_/  |_____|_____\____\___/|_|  |_|_____|';
	Escribir 'How many garages do you have available?:' Sin Saltar;
	Leer cocheras;
	// Esperar Tecla
	cocheras <- cocheras-1;
	// cocheras <- 9; //esta variable asigna la cantidad de cocheras a utilizar incluye la posicion 0 (cero)
	InicializarMatriz(matriz,cocheras); // Llamamos al Sub Proceso InicializarMatriz con en fin de cargar VACIO la matriz de 4 x 4 
	// creamos un menu para poder elegir la accion a realizar	
	IdiomaIngles(matriz,cocheras);
	
FinSubProceso

SubProceso IdiomaIngles (matriz Por Referencia,cocheras Por Referencia) 
	Definir opcion Como Entero; 
	Borrar Pantalla;
	
	Repetir
		Borrar Pantalla;
		Escribir '____________MENU__________'; 
		Escribir '1. Vehicle Entry';
		Escribir '2. Vehicles Exit';
		Escribir '3. See Garages Available';
		Escribir '4. To The Main Menu';
		Escribir '___________________________';
		Escribir 'Choose a menu option: ' Sin Saltar;
		Leer opcion;
		Escribir '';
		// evaluamos la seleccion del usuario
		Segun opcion  Hacer
			1:
				IngresoVehiculosIngles(matriz,cocheras);
			2:
				SalidaVeniculosIngles(matriz,cocheras);
			3:
				VerCocherasIngles(matriz,cocheras, idioma);
			4:
				
			De Otro Modo:
				Borrar Pantalla;
				Escribir '___________________________';
				Escribir 'invalid menu option';
				Escribir '___________________________';
				Escribir 'Press enter to continue';
				Esperar Tecla;
		FinSegun
	Hasta Que opcion=4
	MenuPrincipal(matriz, cocheras );
FinSubProceso


SubProceso IngresoVehiculosIngles(matriz Por Referencia,cocheras Por Referencia)
	Definir i,j,inicio Como Entero;
	Definir libre Como Logico;
	libre <- Falso; // inicializamos libre como falso 
	Para i<-cocheras Hasta 0 Con Paso -1 Hacer // recorremos la matriz solo mirando en la primer columna a fin de verificar si se encuentra vacia
		Para j<-0 Hasta 0 Hacer
			// Condicional para verificar vacio si no esta vacio asignamos el valor de la fila a i y cambiamos la variable libre con verdadero
			Si matriz[i,j]='' Entonces
				inicio <- i;
				libre <- Verdadero;
			FinSi
		FinPara
	FinPara
	// Verificacion de la variable libre si se encontro algun espacio vacio el estado de la variable habrá cambiado a verdadero caso contrario se inicializo como falso
	Si libre=Verdadero Entonces
		Borrar Pantalla;
		// recorremos la matriz pero en la fila que se encontro vacia
		Para i<-inicio Hasta inicio Hacer
			Para j<-0 Hasta 3 Hacer
				Si j=0 Entonces
					Escribir 'Type vehicle type' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=1 Entonces
					Escribir 'Type  license plate' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=2 Entonces
					Escribir 'Enter Date of Entry' Sin Saltar;
					Leer matriz[i,j];
				FinSi
				Si j=3 Entonces
					Escribir 'Enter Time of Entry' Sin Saltar;
					Leer matriz[i,j];
				FinSi
			FinPara
		FinPara
	SiNo
		// caso contrario se mostrara el mensaje de ESTAMOS LLENOS
		Borrar Pantalla;
		Escribir '___________________________';
		Escribir 'WE ARE FULL!!';
		Escribir '___________________________';
		Escribir 'Press enter to continue';
		Esperar Tecla;
	FinSi
	IdiomaIngles(matriz,cocheras);
FinSubProceso

SubProceso VerCocherasIngles(matriz Por Referencia,cocheras Por Referencia,idioma Por Referencia) // Simplemete impreme por pantalla el contenido de la matriz
	Borrar Pantalla;
	Definir i,j Como Entero;
	Escribir '___________________________________________________';
	Para i<-0 Hasta cocheras Hacer
		Para j<-0 Hasta 0 Hacer
			Si matriz[i,j]='' Entonces
				Escribir '|Garage ',i+1,' Available |' Sin Saltar;
			SiNo
				Escribir 'Garage ',i+1,': ' Sin Saltar;
				Para j<-0 Hasta 3 Hacer
					Escribir matriz[i,j],' - ' Sin Saltar;
				FinPara
			FinSi
		FinPara
		Escribir '';
		Escribir '___________________________________________________';
	FinPara
	Escribir 'Press enter to continue';
	Esperar Tecla;
	
	IdiomaIngles(matriz,cocheras);	
FinSubProceso




SubProceso SalidaVeniculosIngles(matriz Por Referencia,cocheras Por Referencia) // SubProceso para dar salida a los vehiculos
	Borrar Pantalla;
	Definir i,j,fila Como Entero;
	Definir dominio Como Caracter;
	Definir noencontrado,encontrado Como Logico;
	// se solicita ingresar una busqueda 
	Escribir 'Enter the license plate to Search';
	Leer dominio;
	encontrado <- Falso;
	Escribir '___________________________________________________';
	// se procede a buscar en la matriz solo mirando la segunda columna donde guardamos el dominio
	Para i<-0 Hasta cocheras Hacer
		Para j<-1 Hasta 1 Hacer
			// se evalua lo ingresado con lo guardado en la matriz
			Si matriz[i,j]=dominio Entonces
				fila <- i;
				encontrado <- Verdadero;
			FinSi
		FinPara
	FinPara
	// se evalua la variable econtrado 	
	Si encontrado=Verdadero Entonces
		Escribir 'The License Plate was found in: ' Sin Saltar;
		Escribir '';
		// Se muestra el contenido de la matriz en la fila donde se encontro el dominio
		Para i<-fila Hasta fila Hacer
			Para j<-0 Hasta 3 Hacer
				Escribir 'Cochera ',i+1,' -->> ' Sin Saltar;
				Para j<-0 Hasta 3 Hacer
					Escribir matriz[i,j],' - ' Sin Saltar;
				FinPara
			FinPara
		FinPara
		Escribir '';
		Escribir '___________________________________________________';
		Escribir 'Proceed to collect the amount, the garage is released';
		Escribir '___________________________________________________';
		// se borran los datos de la fila para que se utilice nuevamente esa fila
		Para i<-fila Hasta fila Hacer
			Para j<-0 Hasta 3 Hacer
				matriz[i,j]<-'';
			FinPara
		FinPara
	SiNo
		// caso contrario se muestra un mensaje de que no se encontro el dominio
		Escribir 'The license plate you are looking for was not found';
		Escribir '___________________________________________________';
	FinSi
	Escribir 'Press enter to continue';
	Esperar Tecla;
	IdiomaIngles(matriz,cocheras);
FinSubProceso

SubProceso MensajeDespedida()
	
	Borrar Pantalla;
	Escribir '  ____ ___  ______   __     __  ____   _    ____ _____ _____ ';
	Escribir ' / ___/ _ \|  _ \ \ / /    / / |  _ \ / \  / ___|_   _| ____|';
	Escribir '| |  | | | | |_) \ V /    / /  | |_) / _ \ \___ \ | | |  _|  ';
	Escribir '| |__| |_| |  __/ | |    / /   |  __/ ___ \ ___) || | | |___ ';
	Escribir ' \____\___/|_|    |_|   /_/    |_| /_/   \_\____/ |_| |_____|';
	Escribir '';
	Escribir 'Integrantes: VERGUECIO Sebastiam, MESAS Franco, GIMENEZ Matias, LIMACHI Lucas, VIOLA Jesica, BRITEZ NEIRA Leila, SOLAN Leonardo, VASQUEZ Maria,  y BENEGAS Cristian';
	Escribir '--------------------------------------';
	Escribir 'Programa Finalizado / Finished Program';
	Esperar Tecla;
FinSubProceso
