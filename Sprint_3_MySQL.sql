## Exercici 2

/* El departament de Recursos Humans ha identificat un error en el número de compte de l'usuari amb el:
IBAN CcU-2938. 
Es requereix actualitzar la informació que identifica un compte bancari a nivell internacional 
	(identificat com "IBAN"): TR323456312213576817699999. 
*/
# Paso 1
/*Voy a identificar el dato: */
SELECT * FROM credit_card WHERE id = "CcU-2938";


/* Ahora debo rremplazar, esto quiere decir, alterar la tabla credit_card*/
update credit_card set iban = 'TR323456312213576817699999' where id = "CcU-2938";
SELECT id, iban  FROM credit_card WHERE id = "CcU-2938";


### Exercici 3

/*En la taula "transaction" ingressa un nou usuari amb la següent informació:*/
# Paso 1: verificar los campos de la tabla transaccion para generar el comando de insertar:
	SHOW COLUMNS FROM transaction;

# Paso 2:  
/* Para ingresar lo que pide el enunciado debo utilizar este codigo:
INSERT INTO transaction(id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined)
VALUES ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", 9999, 829.999, -117.999, NOW(), 111.11, 0);
*/
/* Sin embargo, antes de utlizarlo debo insertar el valor de b-9999 en la tabla de company, ya que esta esta relacionada con transaction*/

INSERT INTO company(id) VALUES ('b-9999');

# Ahora ingreso el valor en la tabla
INSERT INTO transaction(id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined)
VALUES ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", 9999, 829.999, -117.999, NOW(), 111.11, 0);

# Reviso que efectivamente se ha hecho bien:
select * from transaction
where id ="108B1D1D-5B23-A76C-55EF-C568E49A99DD";


# Exercici 4
/* Borrado de columna mediante el comando :*/

alter table credit_card drop column pan;
SELECT * FROM credit_card;

########################################################################################
######################     NIVEL 2      ################################################
########################################################################################
# Sprint 3 - Nivel 2

## Exercici 1
/*- Elimina de la taula transaction el registre amb ID 02C6201E-D90A-1859-B4EE-88D2986D3B02 de la base de dades*/
/* Para eliminar el registro existe el siguiente comando*/

DELETE FROM transaction WHERE id = "02C6201E-D90A-1859-B4EE-88D2986D3B02";

/* Sin embargo, al momento de aplicarlo, aparece un mensaje de error que dice que quiero eliminar eliminar una fila en una tabla que tiene una restricción de (foreign key constraint)*/

select * from transaction
where id ="02C6201E-D90A-1859-B4EE-88D2986D3B02";

DELETE FROM user WHERE id = (SELECT user_id FROM transaction WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02');
DELETE FROM transaction WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';

# Exercici 2
/* Crear una vista llamada: VistaMarketing*/
CREATE VIEW VistaMarketing AS 
SELECT company_name, phone, country, round(avg(amount), 2) as Mitjana
FROM company
JOIN transaction
ON transaction.company_id = company.id
GROUP BY company_name, phone, country
ORDER BY mitjana desc;

# mostrar
SELECT * FROM VistaMarketing;

# Exercici 3
/*Filtra la vista VistaMarketing per a mostrar només les companyies que tenen el seu país de residència en "Germany"*/
SELECT * FROM VistaMarketing
WHERE country = 'Germany';


########################################################################################
######################     NIVEL 3      ################################################
########################################################################################
# Sprint 3 - Nivel 3


# Exercici 2
/* L'empresa també et sol·licita crear una vista anomenada "InformeTecnico" que contingui la següent informació:
ID de la transacció     
Nom de l'usuari/ària        
Cognom de l'usuari/ària     
IBAN de la targeta de crèdit usada.     
Nom de la companyia de la transacció realitzada.    
Assegura't d'incloure informació rellevant de totes dues taules i utilitza àlies per a canviar de nom columnes segons sigui necessari.      
Mostra els resultats de la vista, ordena els resultats de manera descendent en funció de la variable ID de transaction.*/

CREATE VIEW InformeTecnico  AS 
SELECT transaction.id		 AS	 "ID de la transacció",
		user.name			 AS  "Nom usuari/ària" ,
		user.surname 		 AS  "Cognom usuari/ària",
		credit_card.iban 	 AS  "IBAN targeta crèdi",
		company.company_name  AS  "Nom companyia transacció"
FROM   transaction
JOIN   user 			ON		user.id 		= transaction.user_id
JOIN   credit_card		ON		credit_card.id 	= transaction.credit_card_id
JOIN   company			ON		company.id 		= transaction.company_id
ORDER BY  transaction.id DESC;

SELECT * FROM InformeTecnico


