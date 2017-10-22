import express from 'express';
import logger from 'morgan';
import cookieParser from 'cookie-parser';
import bodyParser from 'body-parser';
import path from 'path';
import bcrypt from 'bcrypt-nodejs';
import passport from 'passport';
import expressSession from 'express-session';
import passportLocal from 'passport-local';
import mysql from 'mysql';
import multer from 'multer';
import mime from 'mime';
import shortId from 'shortid';

import {Strategy} from 'passport-local';

import index from './routes/index';
import users from './routes/users';

let connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "justdoit2",
  database: "dating_site"
});

connection.connect();

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    req.image_url = './public/profile_photos';
    cb(null, req.image_url)
  },
  filename: function (req, file, cb) {
    var filename = shortId.generate()//+"."+ mime.extension(file.mimetype);
    req.image_url = '../profile_photos/' +filename;
    cb(null, filename);
  }
});

var upload = multer({ storage: storage });

let app = express();
var server = require('http').createServer(app);
var socketIo = require('socket.io')(server);
//var socketIo = require('socket.io').listen(server);
var chat_users = {};

server.listen(8080);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(expressSession({secret:"marina secret key", resave:true, saveUninitialized:false}));
app.use(express.static(path.join(__dirname, 'public')));

//Passport
app.use(passport.initialize()); 
app.use(passport.session());
passport.use("local-signin", new Strategy(function(username, password, done) {
	connection.query('SELECT user_id, username, password FROM users WHERE username = ?', username, function(err, rows, columns) {
	if (err) throw err;
	bcrypt.compare(password, rows[0].password, function(err, same) {
	if(same) return done(null, {id:rows[0].user_id});
	else return done(null, false);
	});
	})
	
})); 
passport.use("local-signup",new Strategy({passReqToCallback:true}, function(req, username, password, done){
    connection.query('SELECT * FROM users WHERE username = ?', username, function(err,result){
        if(err) throw err;
        if(result){ console.log("Username taken");return};
    });
    connection.query('SELECT * FROM users WHERE email = ?', req.body.email, function(err,result){
        if(err) throw err;
        if(result) {console.log("This email is already in use!");return;}
    });
	bcrypt.hash(password, null, null, function(err, hash) {
		var q = req.body;
		if(err) throw err;
		else connection.query('INSERT INTO users(name, surname, country, gender, age, email, username, password, description, image_url) VALUES (?,?,?,?,?,?,?,?,?,?)', [q.name, q.surname, q.country, q.gender, q.age, q.email, username, hash, q.description, req.image_url], function(err, result){
		if (err) throw err;
		return done(null, {id:result.insertId});
		});    
    });   
})); 

passport.serializeUser(function( user, done ) {
    //odredujemo sto spremamo u sesiju
    done(null, user.id);
}); 

passport.deserializeUser(function( user , done ) {
    //rehidracija, pomoci id retreiveamo informacije iz sesije
   done( null, user); // user ce bit zakvacen za req.user req.logout() za logout
}); 

app.post('/signup', upload.any(), passport.authenticate('local-signup', {
    successRedirect: '/users/profile', 
    failureRedirect: '/users/create', 
}));

app.post('/signin', passport.authenticate('local-signin', {
	successRedirect: '/users/profile',
	failureRedirect: '/home/#sign_in',
}));

app.post('/edit_profile', upload.any(), (req, res) => {
	var q = req.body;
	if(req.image_url) {
		connection.query('UPDATE users SET image_url=? WHERE user_id=?', [req.image_url, q.user_id], (err, result) => {
		if(err) throw err;
	});
	}
	connection.query('UPDATE users SET age=?, country=?, description=? WHERE user_id=?', [q.age, q.country, q.description, q.user_id], (err, result) => {
		if(err) throw err;
		res.redirect('/users/profile');
	});
});

app.get('/logout', function(req, res) {
    req.logout();
	res.cookie('connect.sid', {path: '/'}, {maxAge: 0, expires: 0}).redirect('/home');
});



socketIo.sockets.on('connection', function(socket) {
	socket.on('new user', function(data, callback) {
		callback(true);
		
		socket.username = data;
		chat_users[socket.username] = socket;
		updateUsernames();
	});
	
	function updateUsernames() {
		socketIo.sockets.emit('usernames', Object.keys(chat_users));
	}
	
	socket.on('send message', function(data, callback) {
		var msg = data.trim();
		if(msg.substr(0,1) !== ' ') {
			var indx = msg.indexOf(' ');
			if(indx !== -1) {
				var receiver_id = msg.substring(0, indx);
				var msg = msg.substring(indx + 1);
				connection.query('SELECT username FROM users WHERE user_id=?', receiver_id, (err, result) => {
					if(err) throw err;
					var receiver_name = result[0].username;
					if(receiver_name in chat_users) {
						connection.query('SELECT user_id, name, surname FROM users WHERE username=?', socket.username, (err, row) => {
							if(err) throw err;
							var sender_id = row[0].user_id;
							var sender_n = row[0].name;
							var sender_s = row[0].surname;
							socketIo.to(chat_users[receiver_name].id).emit('new message', {msg: msg, user: socket.username, sender: sender_id, sender_name: sender_n, sender_surname: sender_s});
							chat_users[socket.username].emit('new message', {msg: msg, user: "Me", sender: receiver_id});
						});
					}
					else {
						callback('User is offline!');
					}
				});
			}
			else {
				callback('Please enter a message');
			}
		}
	});
	
	socket.on('disconnect', function(data) {
		if(!socket.username) return;
		delete chat_users[socket.username];
		updateUsernames();
	});

});


app.use('/', index);
app.use('/users', users);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;



