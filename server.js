
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
        console.log()
        res.render('produkte_listen', {produkte:rows, login: isLoggedIn(req)});
    });
});

app.post('/suche', function (req, res) {
    const begriff = req.body["suche"];
    let sql = `SELECT * FROM produkt WHERE beschreibung LIKE '%${begriff}%';`
    db.all(sql, function(err, rows) {
        console.log()
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
    res.render('warenkorb', {login: isLoggedIn(req)});
});

app.get('/rechnung', function (req, res){
    const rechnungsnummer = req.query.nummer

    let sql = `SELECT k.name AS kunden_name, k.adresse, p.name AS produkt_name, p.beschreibung, p.bild_datei, p.preis, b.anzahl ` +
        `FROM bestellung b, kunde k, produkt p `
        + `WHERE b.rechnungsnummer = '${rechnungsnummer}' `
        + `AND b.kunde_id = k.id `
        + `AND b.produkt_id = p.id; `;
    db.all(sql, function(err, rows) {
        if (rows.length !== 0) {
            res.render('bestellung_anzeigen', {bestellung:rows});
        } else {
            res.sendFile(__dirname + '/seite_nicht_gefunden.html');
        }
    });
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
