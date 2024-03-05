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
