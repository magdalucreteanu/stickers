CREATE TABLE kunde ( id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL,
    passwort TEXT NOT NULL,
    name TEXT NOT NULL,
    adresse TEXT NOT NULL );

CREATE TABLE produkt (id iNTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    beschreibung TEXT NOT NULL,
    bild_datei TEXT NOT NULL,
    preis NUMERIC NOT NULL);

CREATE TABLE bestellung(id iNTEGER PRIMARY KEY AUTOINCREMENT,
    rechnungsnummer TEXT NOT NULL,
    kunde_id NUMERIC NOT NULL,
    produkt_id NUMERIC NOT NULL,
    anzahl NUMERIC NOT NULL);

INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Lustiger Imker Spruch", "Lustiger Imker Bienen Sticker. You can't scare me. I am a beekeeper als Geschenkidee für Imkerin oder Bienenliebhaber", "beeker3.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Save the Bees Bienen Geschenkidee", "Lustiger Imker Bienen Sticker als Geschenkidee für Imkerin oder Bienenliebhaber", "116960484_159888568_nothing works without bees Imker Spruch Geschenk.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Berge Wandern Bären Sticker", "Cooles Design für Wanderer und Tier/ Bärenliebhaber. ", "bergeebär berge e.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Kaffe Hunde Hund Geschenk", "Für alle die Kaffee und Hunde lieben. Zum Geburtstag oder Weihnachten ", "coffe pet dogd eiwhund 4ik3mo.png", 2.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Verrückte Hunde Lady Sticker", "An alle Crazy Dog Ladys hier ist der perfekte Sticker. ", "dog lady hunde.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Bienen Sticker", "Cooler Bienen Sticker als Geschenkidee", "QUEEN BEE.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Hai Haie Taucher", "Lustiges Taucher Design zu Weihnachten oder Geburtstag", "SIGN-SHARK.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Hunde Hund Geschenk", "Cooles Hunde Hundehalter Geschenk zur Weihnachtszeit", "doght indek w.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Hunde Sticker", "Dieser Hunde Sticker ist perfekt für Hundeliebhaber und Hunde Fans", "dogmom hund ejje.png", 2.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Angeln Fische", "Cooles Angler Geschenk Design zum Geburtstag für Angler", "fische nagelrn.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Spruch Sticker", "Dieses Coole Pferde Motiv ist perfekt für Reiterinen und Reiter", "girl who loves horses spruch.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Biene Bienen Imker Sticker", "Hier ein cooler Imker Bienen Biene Sticker für Honig Liebhaber", "hell bee whiser.png", 2.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Bienen Braut Hochzeit", "Ein Cooler Braut Bienen Imker Sticker. Perfekt für Frisch Verheiratete", "hell bride to bee 423.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Pferd Spruch Lustig", "Pferde sind doch des Menschen beste Freunde. Für alle Tierliebhaber", "helll pferd horse horse.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Hunde Halloween Hund Sticker", "Hier ein süßer Halloween Sticker für alle Hundeliebhaber", "hund spie hallwe.png", 1.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Kinder Einschulung Geschenkidee", "Als Geschenkidee zur Einschulung ein Cooler Sticker für den Rucksack", "kinde einschuldun.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Kühe Farmer Kuh", "An alle Farmer, Bauer und Kuhliebhaber! Hier ist ein richtig cooler Sticker für euch!", "kühehrkphebrk4.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Katze Halloween Kürbis", "Hier sehen sie das perfekte Halloween Geschenk für Katzenliebhaber", "kürbis katze3.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Nope Katze", "Für Faulenzer und Katzen Liebhaber. Hier ein Sticker der zum Ausdruck bringt was die Katze denkt", "nope cat.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Taucher Tauchen Sticker", "Ein cooler lustiger Sticker für Taucher und Meer Liebhaber", "ofen wasser tauch.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Pferd Sticker", "Mach deiner Freundin oder deiner Tochter mit diesem Kleinen Sticker eine Riesen Freude.", "pferd 6.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Design Pferd", "Hier ein cooler Pferde Sticker für Reiter und Mädchen die Prinzessin spielen.", "pferde design 44.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Liebe Geschenk", "Pferde sind die besten Freunde des Menschen. Zeige deine Pferde Liebe mit diesem Sticker.", "pferde jkkliebe.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Pferd Sticker", "Pferde Sticker werden niemals aus dem Trend fallen, diese Tiere sind einfach fantastisch oder?", "pferde pferd.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Pferd", "Cooles Pferde Geschenk Motiv als Sticker für Freunde und Familie", "pferded 42.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Reiten Pferde Reiter", "Ein Cooler Pferde Sticker als Geschenkidee für Weihnachten oder Geburtstag", "reiten pferd 84939.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Save the Bees Bienen", "Rettet die Bienen oder tragt zumindest diesen Coolen Sticker um es auf die anderen zu schieben!", "save bees s.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Pferde Lustiger Spruch", "Lustiger Pferde Spruch als Geschenkidee zu Weihnachten oder Geburtstag", "walking looser pfer d3.png", 3.99);




-- dummy Bestellung
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 2, 1);
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 1, 3);
