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
VALUES("Beekeeper", "You can't scare me. I am a beekeeper", "beeker3.png", 10.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Unicorn", "A nice unicorn with a rainbow for a tail.", "unicorn-01.png", 22.45);

-- dummy Bestellung
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 2, 1);
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 1, 3);
