/*CREATION DE LA BASE DE DONNEES*/

CREATE DATABASE logiciel_de_reservation;

/*SELECTION DE LA BASE DE DONNEES*/

USE logiciel_de_reservation;

/*CREATION DES TABLES SQL*/

CREATE TABLE seances (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_de_seance VARCHAR(50) NOT NULL,
    heure_de_seance VARCHAR(30) NOT NULL,
    date_seance DATE NOT NULL
);

CREATE TABLE administrateurs (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE prix (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    type VARCHAR(50) NOT NULL,
    prix DECIMAL(10,2) NOT NULL
);

CREATE TABLE utilisateurs (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    obtenir_prix INT(11) NOT NULL,
    FOREIGN KEY (obtenir_prix) REFERENCES prix(id)
);

CREATE TABLE cinemas (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(200) NOT NULL,
    numero_de_telephone CHAR(10) NOT NULL
);

CREATE TABLE films (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titre VARCHAR(50) NOT NULL,
    synopsis VARCHAR(250) NULL,
    genre VARCHAR(50) NOT NULL,
    duree_du_film VARCHAR(30) NOT NULL
);

CREATE TABLE sessions (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    jour_heure DATETIME NOT NULL,
    projection INT(11) NOT NULL,
    FOREIGN KEY (projection) REFERENCES films(id)
);

CREATE TABLE reservations (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    date_de_reservation DATE NOT NULL,
    reservation_lien INT(11) NOT NULL,
    FOREIGN KEY (reservation_lien) REFERENCES utilisateurs(id),
    au INT(11) NOT NULL,
    FOREIGN KEY (au) REFERENCES cinemas(id),
    obtenir_session INT(11) NOT NULL,
    FOREIGN KEY (obtenir_session) REFERENCES sessions(id)
);

CREATE TABLE salles (
    id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_de_salle INT NOT NULL,
    numero_de_siege INT NOT NULL,
    contient INT(11) NOT NULL,
    FOREIGN KEY (contient) REFERENCES cinemas(id),
    possede INT(11) NOT NULL,
    FOREIGN KEY (possede) REFERENCES sessions(id)
);

/*ALIMENTATION DE NOS TABLES SQL*/

INSERT INTO prix (type, prix) VALUES ('Adulte', 9.20), ('Etudiant', 7.60), ('Enfant', 5.90), ('Etudiant', 7.60), ('Adulte', 9.20);

INSERT INTO utilisateurs (nom, prenom, age, obtenir_prix) VALUES ('Dupont', 'Robert', 47, 1), ('Williams', 'Elie', 17, 2), ('Starck', 'Tony', 10, 3), ('Miller', 'Joel', 16, 4), ('Sobeck', 'Aloy', 36, 5);

INSERT INTO cinemas (nom, adresse, numero_de_telephone) VALUES ('Gaumont', '7 rue Mahe', '0539297972'), ('Kinepolis', '70 boulevard David Da Silva', '0423016965'), ('UGC', '37 rue Collet', '0807320500'), ('Cameo', '69 place Boulay', '0798300281');

INSERT INTO films (titre, synopsis, genre, duree_du_film) VALUES ('Avatar', 'Découvrez Jake Sully et ses aventures sur la lune Pandora', 'SF/Aventure', '2h41'),
                                                                 ('Harry Potter et la coupe de feu', 'Découvrez Harry et ses aventures à Poudlard', 'Fantastique/Aventure', '2h37'),
                                                                 ('Alerte Rouge', 'Découvrez une petite fille géniale qui se transforme en panda rouge !', 'Animation/Comédie', '1h40'),
                                                                 ('Ça', 'Découvrez la ville éffrayante de Derry et ses mystères quelle renferme', 'Horreure/Épouvante', '2h15'),
                                                                 ('Inception', 'Retrouvez Leonardo DiCaprio dans un rôle totalement inédit !', 'SF/Action', '2h28');

INSERT INTO sessions (jour_heure, projection) VALUES ('2022-09-23 23:59:12', 1), ('2022-09-24 15:30:47', 2), ('2022-09-25 17:50:23', 3), ('2022-09-26 15:25:50', 4), ('2022-09-27 9:36:45', 5);

INSERT INTO salles (nombre_de_salle, numero_de_siege, contient, possede) VALUES (10, 23, 1, 1), (14, 65, 2, 2), (12, 48, 3, 3), (13, 12, 4, 4), (14, 101, 2, 5);

INSERT INTO reservations (date_de_reservation, reservation_lien, au, obtenir_session) VALUES ('2022-09-23', 1, 1, 1), ('2022-09-24', 2, 2, 2), ('2022-09-25', 3, 3, 3), ('2022-09-26', 4, 4, 4), ('2022-09-27', 5, 2, 5);

/*FIN DES COMMANDES SQL*/