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
			/* Tabla Trasaction
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




SHOW CREATE TABLE company;
SHOW CREATE TABLE credit_card;
SHOW CREATE TABLE transaction;
SHOW CREATE TABLE user;

CREATE TABLE `company` (
  `id` varchar(15) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `credit_card` (
  `id` varchar(10) NOT NULL,
  `iban` varchar(35) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `cvv` varchar(3) DEFAULT NULL,
  `expiring_date` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `transaction` (
  `id` varchar(255) NOT NULL,
  `credit_card_id` varchar(15) DEFAULT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `declined` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `birth_date` varchar(100) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `transaction` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




