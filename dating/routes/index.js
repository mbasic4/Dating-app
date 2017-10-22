import express from 'express';
import mysql from 'mysql';
let router = express.Router();

let datingConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "justdoit2",
  database: "dating_site"
});

datingConnection.connect();

/* GET home page. */
router.get('/', (req, res) => {
    res.render('home');
});

router.get('/home', (req, res) => {
	datingConnection.query('SELECT * FROM users WHERE user_id=?', req.user, (err, result) => {
		console.log(req.user);
		//if(err) throw err;
		if(typeof req.user == "undefined") {
			res.render("home", {user:result});
		}
	});
	//res.render('home');
});

router.get('/about', (req, res) => {
	datingConnection.query('SELECT * FROM users WHERE user_id=?', req.user, (err, result) => {
		console.log(req.user);
		//if(err) throw err;
		if(typeof req.user == "undefined" || typeof req.user != "undefined") {
			res.render("about", {user:result});
		}
	});
});

module.exports = router;
