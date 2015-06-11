INSERT INTO `got_product` (`id`, `description`, `image`, `name`, `price`, `quantity`) VALUES
	(1,'Dei deliziosi spaghetti di soia', 'spaghetti.png', 'Spaghetti di soia',3.00,10),
	(2,'Avocado per le tue salse guacamole.','avocado.png', 'Avocado',4.00,23),
	(3,'Tabacco delle migliori piantagioni.','tabacco.png', 'Tabacco',9.00,56),
	(4,'Casco di banane provenienti dalla Tanzania.','banane.png', 'Banane',23,2),
	(5,'Coltello dall\'ottima fattura','coltello.png', 'Coltello',44.50,45),
	(6,'La mela piu\' buona del reame.','mela.png', 'Mela',12.00,34);

INSERT INTO `got_supplier` (`id`, `email`, `iva`, `phone`) VALUES
	(1,'mele@mele.it','83100312828','3443433223'),
	(2,'banane@fornitore.it','28128281283','3423423332');


INSERT INTO `got_user` (`id`, `address_line`, `cap`, `city`, `email`, `firstName`, `lastName`, `password`, `role`, `username`) VALUES
	(1,'Via calvatone,47','00119','Roma','f.ginosa@gmail.com','Federico','Ginosa','password1234','ROLE_USER','federico'),
	(2,'Piazza la bomba e scappa,34','00119','Roma','a.martinelli@gmail.com','Antonio','Martinelli','password1234','ROLE_USER','antonio'),
	(3,'Via le mani dal naso,23','00119','Roma','l.goldoni@gmail.com','Lorenzo','Goldoni','password1234','ROLE_USER','lorenzo'),
	(4,'Via del bangladino,34','00119','Roma','mario.rossi@gmail.com','Mario','Rossi','customer','ROLE_USER','customer'),
	(5,'Via del bangladino,1','00119','Roma','a.mustafa@gmail.com','Ali','Mustafa','admin','ROLE_ADMIN','admin');