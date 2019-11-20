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
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("Bienen Sticker", "Cooler Bienen Sticker als Geschenkidee", "QUEEN BEE.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "SIGN-SHARK.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "doght indek w.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "dogmom hund ejje.png", 2.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "fische nagelrn.png", 4.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "girl who loves horses spruch.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "hell bee whiser.png", 2.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "hell bride to bee 423.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "helll pferd horse horse.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "hund spie hallwe.png", 1.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "kinde einschuldun.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "kühehrkphebrk4.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "kürbis katze3.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "nope cat.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "ofen wasser tauch.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "pferd 6.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "pferde design 44.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "pferde jkkliebe.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "pferde pferd.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "pferded 42.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "reiten pferd 84939.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "save bees s.png", 3.99);
INSERT INTO produkt(name, beschreibung, bild_datei, preis)
VALUES("", "", "walking looser pfer d3.png", 3.99);




-- dummy Bestellung
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 2, 1);
INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) values("R00001", 5, 1, 3);
