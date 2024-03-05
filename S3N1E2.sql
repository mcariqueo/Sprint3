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

			/*
			| Field           | Type            | Null | Key | Default | Extra |
			|-----------------|-----------------|------|-----|---------|-------|
			| id              | varchar(255)    | NO   | PRI | NULL    |       |
			| credit_card_id  | varchar(15)     | YES  |     | NULL    |       |
			| company_id      | varchar(20)     | YES  | MUL | NULL    |       |
			| user_id         | int             | YES  | MUL | NULL    |       |
			| lat             | float           | YES  |     | NULL    |       |
			| longitude       | float           | YES  |     | NULL    |       |
			| timestamp       | timestamp       | YES  |     | NULL    |       |
			| amount          | decimal(10,2)   | YES  |     | NULL    |       |
			| declined        | tinyint(1)      | YES  |     | NULL    |       |
			*/

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
where id ="108B1D1D-5B23-A76C-55EF-C568E49A99DD"



