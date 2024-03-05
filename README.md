# Sprint3

## Objectius
- Manipulació de dades.
- Treballar amb vistes i índexs


## Instruccions
En este sprint, se simula una situación empresarial en la que debes realizar diversas manipulaciones en las tablas de la base de datos. A su vez, tendrás que trabajar con índices y vistas. 

En esta actividad, continuarás trabajando con la base de datos que contiene información de una empresa dedicada a la venta de productos online. 

En esta tarea, empezarás a trabajar con información relacionada con tarjetas de crédito.



### Exercici 1
La teva tasca és dissenyar i crear una taula anomenada "credit_card" que emmagatzemi detalls crucials sobre les targetes de crèdit. La nova taula ha de ser capaç d'identificar de manera única cada targeta i establir una relació adequada amb les altres dues taules ("transaction" i "company"). Després de crear la taula serà necessari que ingressis la informació del document denominat "dades_introduir_credit". Recorda mostrar el diagrama i realitzar una breu descripció d'aquest.


### Exercici 2
El departament de Recursos Humans ha identificat un error en el número de compte de l'usuari amb el: IBAN CcU-2938. Es requereix actualitzar la informació que identifica un compte bancari a nivell internacional (identificat com "IBAN"): TR323456312213576817699999. Recorda mostrar que el canvi es va realitzar.


### Exercici 3
En la taula "transaction" ingressa un nou usuari amb la següent informació:

```
Id	            108B1D1D-5B23-A76C-55EF-C568E49A99DD
credit_card_id	CcU-9999
company_id	    b-9999
user_id	        9999
lat	            829.999
longitude	    -117.999
amount	        111.11
declined	    0
```

### Exercici 4
Des de recursos humans et sol·liciten eliminar la columna "pan" de la taula credit_*card. Recorda mostrar el canvi realitzat.


## Nivell 2


### Exercici 1
- Elimina de la taula transaction el registre amb ID 02C6201E-D90A-1859-B4EE-88D2986D3B02 de la base de dades


### Exercici 2
- El departament de Recursos Humans ha identificat un error en el número de compte de l'usuari amb ID CcU-2938. 
- Es requereix actualitzar la informació ingressada en l'IBAN. La informació que ha de mostrar-se per a aquest registre és: R323456312213576817699999 . Recorda mostrar que el canvi es va realitzar.


### Exercici 3
Filtra la vista VistaMarketing per a mostrar només les companyies que tenen el seu país de residència en "Germany"