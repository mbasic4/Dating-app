import express from 'express';
import mysql from 'mysql';
import bcrypt from 'bcrypt-nodejs';

let router = express.Router();

let datingConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "justdoit2",
  database: "dating_site"
});

datingConnection.connect();


/* GET users listing. */
/*router.get('/', (req, res) => {
    datingConnection.query('SELECT * FROM users', function(err, records) {
		if (err) {
			throw err;
		}
		res.render("users", {users:records});
	});
});*/


router.get('/create', (req, res) => {
	res.render('user_form');
});

router.get('/isusernametaken/:username', (req, res) => {
	datingConnection.query('SELECT username FROM users WHERE username=?', req.params.username, function(err, istaken) {
		if(err) { 
			throw err;
		}
		if(istaken.length) {
			console.log(istaken);
			res.send(true);
		}
		else {
			res.send(false);
		}
	});
});


router.post('/checkuser', (req, res) => {
	datingConnection.query('SELECT username, password FROM users WHERE username=?', req.body.username, (err, result) => {
		if(err) throw err;
		else if(result.length) {			
			res.end("exist");
		}
		else {
			res.end("true");
		}
	});
});


router.get('/profile', (req, res) => {
	datingConnection.query('SELECT * FROM users JOIN countries ON users.country=countries.abbrev_id WHERE user_id=?', req.user, (err, result) => {
		if(err) throw err;
		res.render("profile", {user:result});
	});
});


router.get('/search/:search_input?', (req, res) => {
	var search = req.params.search_input;
	var sql = mysql.format("SELECT country_name FROM users JOIN countries ON users.country=countries.abbrev_id WHERE country_name LIKE ? GROUP BY country_name", [search+"%"]);
	datingConnection.query(sql, req.params.country_name, (err, result) => {
		if(err) throw err;
		if(result) {
			res.send(result);
		}
	});
});

	
router.get('/all', (req, res) => {
	datingConnection.query('SELECT user_id, username FROM users WHERE user_id=?', req.user, (err, result) => {
	if(typeof req.user != "undefined") {
		var sql = mysql.format('SELECT user_id, name, surname, gender, age, country_name, description, image_url FROM users JOIN countries ON users.country=countries.abbrev_id WHERE user_id NOT LIKE ?', [req.user]);
		datingConnection.query(sql, req.user, (err, records) => {
			if (err) throw err;
			res.render("all", {user:result, users:records});
		});
	}
	});	
});


router.get('/filter', (req, res) => {
	var country = req.query.country;
	var gender = req.query.gender;
	var baseQuery = 'SELECT user_id, name, surname, gender, age, country_name, description, image_url FROM users JOIN countries ON users.country=countries.abbrev_id WHERE user_id NOT LIKE ?';
	
	datingConnection.query('SELECT user_id, username FROM users WHERE user_id=?', req.user, (err, result) => {
	if(typeof req.user != "undefined") {
		if(country == "" && gender == "Gender") {
			var sql = mysql.format(baseQuery, [req.user]);
			datingConnection.query(sql, req.user, (err, records) => {
				if(err) throw err;
				res.send(records);
			});
		}
		else if(country == "") {
			var sql = mysql.format(baseQuery + ' ' + 'AND gender LIKE ?', [req.user, gender]);
			datingConnection.query(sql, req.user, (err, records) => {
				if(err) throw err;
				res.send(records);
			});
		}
		else if(gender == "Gender") {
			var sql = mysql.format(baseQuery + ' ' + 'AND country_name LIKE ?', [req.user, country+"%"]);
			datingConnection.query(sql, req.user, (err, records) => {
				if(err) throw err;
				res.send(records);
			});
		}
		
		else {
			var sql = mysql.format(baseQuery + ' ' + 'AND country_name LIKE ? AND gender LIKE ?', [req.user, country+"%", gender]);
			datingConnection.query(sql, req.user, (err, records) => {
				if(err) throw err;
				res.send(records);
			});
		}
	}
	});
});


router.get('/profile/edit', (req, res) => {
	datingConnection.query('SELECT user_id, username, name, surname, gender, age, country, country_name, description, image_url FROM users JOIN countries ON users.country=countries.abbrev_id WHERE user_id=?', req.user, (err, result) => {
		if(err) throw err;
		if(typeof req.user != "undefined") {
			res.render("edit_profile", {user:result});
		}
	});
});


router.get('/profile/delete', (req, res) => {
	var user = req.user;
	datingConnection.query('DELETE FROM users WHERE user_id=?', req.user, (err, result) => {
		res.redirect('/logout');
	});
});


export default router;
