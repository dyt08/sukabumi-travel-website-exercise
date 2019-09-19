'use strict';
var createError = require('http-errors');
var debug = require('debug');
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var expresssValidator = require('express-validator');

var routes = require('./routes/index');
var users = require('./routes/users');
var admin = require('./routes/admin');

var app = express();

var mysql = require ('mysql');

//auth
var session = require('express-session');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var MySQLStore = require('express-mysql-session')(session);
var bcrypt = require('bcrypt');

//connected to express mysql
var myConnection = require('express-myconnection'), // express-myconnection module
    dbOptions = {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'sukabumi',
        multipleStatements: true
    };
app.use(myConnection(mysql, dbOptions, 'request'));

//connect to database
var connection = mysql.createConnection(dbOptions);
connection.connect();
var sessionStore = new MySQLStore(dbOptions);

 //session
app.use(session({
    secret: 'secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    //cookie: { secure: true }
	}));
app.use(passport.initialize());
app.use(passport.session());

passport.use(new LocalStrategy({
        usernameField: 'username_login',
        passwordField: 'password_login',
        session: false
    },
    function(username, password, done) {
        const db = connection;
        db.query('SELECT *FROM users WHERE username_login =?',[username],function (err,results,fields) {

            if(err){
                done(err);
            }
            if(!results){
                return done(null, false);
            }else if(results === 0){
                done(null, false);
            }
            return done(null, results[0]);

        });
    }));


    app.use(function (req,res,next) {

        res.locals.isAuthenticated = req.isAuthenticated();
        //res.locals.isAdmin = req.user.role='admin';

        if(req.isAuthenticated()) {
            res.locals.userLogin = req.user.username_login;
            res.locals.userEmail = req.user.Email;
            res.locals.userFirstName = req.user.FirstName;
            res.locals.userLastName = req.user.LastName;
            res.locals.userPhone = req.user.Phone;
            res.locals.userPhoto = req.user.Photo;
            res.locals.role = req.user.role;
        }
        next();
    });

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
app.use('/users', users);
app.use('/admin', admin);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

app.set('port', process.env.PORT || 2000);

var server = app.listen(app.get('port'), function () {
    debug('Express server listening on port ' + server.address().port);
});
