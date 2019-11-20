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
VALUES("Lustiger Imker Spruch", "Lustiger Imker Bienen Sticker. You can't scare me. I am a beekeeper als Geschenkidee für Imkerin oder Bienenliebhaber", "beeker3.png", 3,99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Süßes Einhhorn", "Lustiger Cooler Einhörner Sticker für Freunde oder Familie.", "unicorn-01.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Save the Bees Bienen Geschenkidee", "Lustiger Imker Bienen Sticker als Geschenkidee für Imkerin oder Bienenliebhaber", "116960484_159888568_nothing works without bees Imker Spruch Geschenk.png", 4,99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Berge Wandern Bären Sticker", "Cooles Design für Wanderer und Tier/ Bärenliebhaber. ", "bergeebär berge e.png", 3,99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Kaffe Hunde Hund Geschenk", "Für alle die Kaffee und Hunde lieben. Zum Geburtstag oder Weihnachten ", "coffe pet dogd eiwhund 4ik3mo.png", 2,99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Verrückte Hunde Lady Sticker", "An alle Crazy Dog Ladys hier ist der perfekte Sticker. ", "dog lady hunde.png", 4,99);

-- dummy Bestellung
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 2, 1);
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 1, 3);
