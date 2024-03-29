
//Initialisierung des Webservers
const express = require("express");
const app = express();

//Body Parser
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended:true}));

// EJS Template Engine
app.engine('.ejs', require('ejs').__express);
app.set('view engine', 'ejs');

//Initialisierung des Cookie Parsers
const cookieParser = require('cookie-parser');
app.use(cookieParser());

//Initialisierung von express-sessions
const session = require('express-session');
app.use(session({
    secret: 'example',
    resave: false,
    saveUninitialized: true
}));

// Ordner wo die Prudukt Bilder liegen
app.use(express.static(__dirname+'/public'));

// Initialisierung des Passwort Hashings
const passwordHash = require('password-hash');

//DB access
const sqlite3 = require(`sqlite3`).verbose();
let db = new sqlite3.Database('stickers.db');

// Webserver starten. Server startet auf Port 3000
app.listen(3000, function(){
    console.log('listening on Port 3000')
});

app.get('/kontoerstellen', function (req, res){
    res.render('konto_erstellen');
});

app.get('/', function (req, res){
    res.render('index', {login: isLoggedIn(req)});
});

app.post("/doerstellen", function(req,res)
{
    const email =  req.body["email"];
    const passwort =  req.body["passwort"];
    const passwort_bestaetigung =  req.body["passwort_bestaetigung"];
    const name =  req.body["name"];
    const adresse =  req.body["adresse"];

    let errorMessage = '';
    // konsistenzprüfungen
    // Mit vorhandenen User 
    if (email){
        if (name) {
            if (adresse) {
            // Mit vorhandenen Passwort
                if (passwort){
                    // Mit Passwort und Wiederholung gleich
                    if (passwort == passwort_bestaetigung){
                        //SQL Befehl um einen neuen Eintrag der Tabelle kunde hinzuzufügen
                        const hash = passwordHash.generate(passwort);
                        let sql = `INSERT INTO kunde (email, passwort, name, adresse) VALUES ("${email}", "${hash}", "${name}", "${adresse}");`
                        db.run(sql);
                        req.session['sessionUser'] = email;      
                    } else {
                        errorMessage = "Passwort und Wiederholung sind nicht gleich!";
                    }
                } else {
                    errorMessage = "Passwort nicht eingetragen!";
                }
            } else {
                errorMessage = "Adresse nicht eingetragen!"            }
        } else {
            errorMessage = "Name nicht eingetragen!";
        }
    } else {
        errorMessage = "Email nicht eingetragen!";
    }
    
    res.render('konto_erstellen_antwort', {email:email, errorMessage:errorMessage, login:isLoggedIn(req)});

});

app.get('/abmelden', function (req, res) {
    // Entfernen session Info
    delete req.session['sessionUser'];

    res.render('abmelden');
});

app.get('/anmelden', function (req, res) {
    res.render('anmelden');
});

app.post("/doanmelden", function(req,res)
{
    const email =  req.body["email"];
    const passwort =  req.body["passwort"];

    let sql = `SELECT * FROM kunde WHERE email = '${email}';`
    db.all(sql, function(err, rows) {
        if (rows.length !== 0 && passwordHash.verify(passwort, rows[0].passwort)) {
            req.session['sessionUser'] = email;
        }
        res.render('anmelden_antwort', {email:email, login:isLoggedIn(req)});
    });
});

app.get('/produktlist', function (req, res){
    let sql = `SELECT * FROM produkt;`
    db.all(sql, function(err, rows) {
        res.render('produkte_listen', {produkte:rows, login: isLoggedIn(req)});
    });
});

app.post('/suche', function (req, res) {
    const begriff = req.body["suche"];
    let sql = `SELECT * FROM produkt WHERE beschreibung LIKE '%${begriff}%';`
    db.all(sql, function(err, rows) {
        res.render('produkte_listen', {produkte:rows, login: isLoggedIn(req)});
    });
});

app.get('/produkt', function (req, res){
    const produktId = req.query.id
    let sql = `SELECT * FROM produkt WHERE id = ${produktId};`
    db.all(sql, function(err, rows) {
        if (rows.length !== 0) {
            res.render('produkt_anzeigen', {produkt:rows[0], login: isLoggedIn(req)});
        } else {
            res.sendFile(__dirname + '/seite_nicht_gefunden.html');
        }
    });
});

app.get('/warenkorb', function (req, res) {
    if (!req.session['warenkorb'] || req.session['warenkorb'].length === 0) {
        res.render('warenkorb', {produkte:[], login: isLoggedIn(req)});
    } else {
        let sql = `SELECT * FROM produkt WHERE id in (${req.session['warenkorb']});`
        db.all(sql, function(err, rows) {
            if (rows.length !== 0) {
                res.render('warenkorb', {produkte:rows, login: isLoggedIn(req)});
            } else {
                res.sendFile(__dirname + '/seite_nicht_gefunden.html');
            }
        });
    }
});

app.post('/inwarenkorb', function (req, res) {
    const produktId = req.body["produktId"];
    addToWarenkorb(req, produktId);

    let sql = `SELECT * FROM produkt WHERE id = ${produktId};`
    db.all(sql, function(err, rows) {
        if (rows.length !== 0) {
            res.render('inwarenkorb', {produkt:rows[0], login: isLoggedIn(req)});
        } else {
            res.sendFile(__dirname + '/seite_nicht_gefunden.html');
        }
    });
});

app.get('/bestellen', function (req, res) {
    if (isLoggedIn(req)) {
        let rechnungsnummer = Math.floor(Math.random() * 8999999) + 1000000;
        for (let i = 0; i < req.session['warenkorb'].length; i++) {
            let sql = `INSERT INTO bestellung(rechnungsnummer, kunde_id, produkt_id, anzahl) `
                + ` SELECT '${rechnungsnummer}', id, ${req.session['warenkorb'][i]}, 1 FROM kunde WHERE email = '${req.session['sessionUser']}';`
            db.run(sql);
        }
        
        // Leere Warenkorb nach Bestelung
        req.session['warenkorb'] = [];

        // Zeige die Rechnung
        let sql = `SELECT k.name AS kunden_name, k.adresse, p.name AS produkt_name, p.beschreibung, p.bild_datei, p.preis, b.anzahl ` +
            `FROM bestellung b, kunde k, produkt p `
            + `WHERE b.rechnungsnummer = '${rechnungsnummer}' `
            + `AND b.kunde_id = k.id `
            + `AND b.produkt_id = p.id; `;
        db.all(sql, function(err, rows) {
            if (rows.length !== 0) {
                res.render('bestellung_anzeigen', {bestellung:rows, rechnungsnummer:rechnungsnummer});
            } else {
                res.sendFile(__dirname + '/seite_nicht_gefunden.html');
            }
        });
    } else {
        res.sendFile(__dirname + '/seite_nicht_gefunden.html');
    }
});

function isLoggedIn(req) {
    let login;
    if (!req.session['sessionUser']) {
        login = false;
    } else {
        login = true;
    }
    return login;
}

function addToWarenkorb(req, produktId) {
    if (!req.session['warenkorb']) {
        req.session['warenkorb'] = [];
    }
    req.session['warenkorb'].push(produktId);
}
