    -- Creamos la base de datos
    CREATE DATABASE IF NOT EXISTS transactions;
    USE transactions;

    -- Creamos la tabla company
    CREATE TABLE IF NOT EXISTS company (
        id VARCHAR(15) 	PRIMARY KEY,
        company_name 	VARCHAR(255),
        phone 			VARCHAR(15),
        email 			VARCHAR(100),
        country 		VARCHAR(100),
        website 		VARCHAR(255)
    );


    -- Creamos la tabla transaction
    CREATE TABLE IF NOT EXISTS transaction (
        id VARCHAR(255) PRIMARY KEY,
        credit_card_id VARCHAR(15) REFERENCES credit_card(id),
        company_id VARCHAR(20), 
        user_id INT REFERENCES user(id),
        lat FLOAT,
        longitude FLOAT,
        timestamp TIMESTAMP,
        amount DECIMAL(10, 2),
        declined BOOLEAN,
        FOREIGN KEY (company_id) REFERENCES company(id) 
    );
    
    CREATE TABLE credit_card (
    id 		VARCHAR(15) 		PRIMARY KEY, # Identifico a id como Clave Primaria 
    iban 	VARCHAR(36) 		NOT NULL,
    pan 	VARCHAR(20) 		NOT NULL,
    pin 	VARCHAR(6) 			NOT NULL,
    cvv 	VARCHAR(5) 			NOT NULL,
    expiring_date VARCHAR(8) 	NOT NULL
);
    