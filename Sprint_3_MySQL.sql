# Sprint 3 - Nivell 1

## Exercici 1

CREATE TABLE credit_card (
    id 		VARCHAR(15) 		PRIMARY KEY, # Identifico a id como Clave Primaria 
    iban 	VARCHAR(36) 		NOT NULL,
    pan 	VARCHAR(20) 		NOT NULL,
    pin 	VARCHAR(6) 			NOT NULL,
    cvv 	VARCHAR(5) 			NOT NULL,
    expiring_date VARCHAR(8) 	NOT NULL
);

-- Crear índices
CREATE INDEX idx_transaction_credit_card_id -- columna credit_card_id de transaction
ON transaction(credit_card_id); 

-- Foreing KEY: transaction - credit_card
ALTER TABLE transaction
ADD CONSTRAINT fk_credit_card_id
FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);

## Exercici 3
# Paso 1
SELECT * FROM credit_card WHERE id = "CcU-2938";

update credit_card set iban = 'TR323456312213576817699999' where id = "CcU-2938";
SELECT id, iban  FROM credit_card WHERE id = "CcU-2938";

### Exercici 3
-- Quito el not null de todas los campos de credit_card
ALTER TABLE credit_card
MODIFY COLUMN iban varchar(36),
MODIFY COLUMN pan varchar(20),
MODIFY COLUMN pin varchar(6),
MODIFY COLUMN cvv varchar(5),
MODIFY COLUMN expiring_date varchar(8);

INSERT INTO credit_card (id) VALUES ('Ccu-9999');
INSERT INTO company(id) VALUES ('b-9999');

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined)
VALUES ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", 9999, 829.999, -117.999, NOW(), 111.11, 0);

# Exercici 4
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
SELECT * FROM transaction WHERE id = "02C6201E-D90A-1859-B4EE-88D2986D3B02";


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

# Exercici 1

-- Debo realizar correctamente las relaciones

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


