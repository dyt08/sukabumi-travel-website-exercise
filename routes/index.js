'use strict';
let express = require('express');
let router = express.Router();

//passport
let passport = require('passport');

/* variabel */
let totalRec = 0;
let pageSize = 8;
let pageCount = 0;
let currentPage = 1;

/* GET home page. */
router.get('/', function (req, res) {
    req.getConnection(function (err, con) {
        con.query('SELECT *FROM wisata WHERE category="alam" ORDER BY created_at DESC LIMIT 4;SELECT *FROM wisata WHERE category="kuliner" ORDER BY created_at DESC LIMIT 4;SELECT *FROM wisata ORDER BY RAND() LIMIT 8',
            function (err, result) {
                // console.log(result[0]);
                res.render('index', {
                    Alam: result[0],
                    Kuliner: result[1],
                    Rand: result[2],
                    title: 'home'
                });
            });
    });
});

router.get('/about', function (req, res) {
    res.render('about', { title: 'about' });
});

router.get('/alam', function (req, res, next) {
    req.getConnection(function (error, con) {
        if (error) {
            console.log(error);
            throw err;
        }
        let countData = con.query("SELECT COUNT(*) as numrows FROM wisata WHERE category='alam'", function (err, countrows) {
            if (err) throw err;
            totalRec = countrows[0].numrows;
            pageCount = Math.ceil(totalRec / pageSize);

            if (typeof req.query.page !== 'undefined') {
                currentPage = req.query.page;
            }
        });

        let page = 1;

        if (req.query.page) {
            page = req.query.page;
            console.log('Page', typeof page);
            console.log('Page ini error');
        }

        let offset = (page * pageSize) - pageSize;
        console.log('offset', offset);

        let q = `SELECT *FROM wisata WHERE category='alam' ORDER BY created_at DESC LIMIT ${pageSize} OFFSET ${offset} `;
        console.log(q);

        let sql = con.query(q, function (err, result) {
            if (err) {
                console.log(err);
            }
            res.render('wisata', {
                title: 'Alam',
                Wisata: result,
                pageSize: pageSize,
                pageCount: pageCount,
                currentPage: currentPage
            });
        });
    });
});

router.get('/kuliner', function (req, res, next) {
    req.getConnection(function (error, con) {
        if (error) {
            console.log(error);
        }
        let countData = con.query("SELECT COUNT(*) as numrows FROM wisata WHERE category='kuliner'", function (err, countrows) {
            if (err) throw err;
            totalRec = countrows[0].numrows;
            pageCount = Math.ceil(totalRec / pageSize);

            if (typeof req.query.page !== 'undefined') {
                currentPage = req.query.page;
            }
        });

        let page = 1;

        if (req.query.page) {
            page = req.query.page;
            console.log('Page', typeof page);
            console.log('Page ini error');
        }

        let offset = (page * pageSize) - pageSize;
        console.log('offset', offset);

        let q = `SELECT *FROM wisata WHERE category='kuliner' ORDER BY created_at DESC LIMIT ${pageSize} OFFSET ${offset} `;
        console.log(q);

        let sql = con.query(q, function (err, result) {
            if (err) {
                console.log(err);
            }
            res.render('wisata', {
                title: 'Kuliner',
                Wisata: result,
                pageSize: pageSize,
                pageCount: pageCount,
                currentPage: currentPage
            });
        });
    });
});

router.get('/alam/:wisata_id', function (req, res, next) {
    req.getConnection(function (error, con) {
        con.query('SELECT *FROM wisata WHERE wisata_id = "' + req.params.wisata_id + '";SELECT *FROM wisata WHERE category="alam" ORDER by RAND() LIMIT 8',
            function (err, result) {

                res.render('detailwisata', {
                    items: result[0],
                    Wisata: result[1],
                    title: 'alam'
                });
            });
    });
});

router.get('/kuliner/:wisata_id', function (req, res, next) {
    req.getConnection(function (error, con) {
        con.query('SELECT *FROM wisata WHERE wisata_id = "' + req.params.wisata_id + '";SELECT *FROM wisata WHERE category="kuliner" ORDER by RAND() LIMIT 8',
            function (err, result) {

                res.render('detailwisata', {
                    items: result[0],
                    Wisata: result[1],
                    title: 'kuliner'
                });
            });
    });

});


//contact
router.get('/contact', function (req, res, next) {
    res.render('contact', { title: 'contact' });
});

router.post('/ncontact', function (req, res, next) {

    const name = req.body.nama;
    const email = req.body.email;
    const telephone = req.body.telephone;
    const message = req.body.message;
    req.getConnection(function (error, con) {
        let q = con.query(`INSERT INTO contact (nama,email,telephone,pesan,status) VALUES (?,?,?,?,"Open")`,
            [name, email, telephone, message], function (err, result) {
                console.log('Terdapat pesan baru');
                if (err) {
                    console.log(err);
                } else {
                    res.redirect('/contact');
                }
            });
        console.log(q);
    });
});

//search
router.get('/search', function (req, res, next) {
    req.getConnection(function (error, con) {
        if (error) {
            console.log(error);
        }
        let countData = con.query(`SELECT COUNT(*) as numrows FROM wisata WHERE name LIKE '%` + req.query.q + `%'`, function (err, countrows) {
            if (err) throw err;
            totalRec = countrows[0].numrows;
            pageCount = Math.ceil(totalRec / pageSize);

            if (totalRec === 0) {
                res.redirect('/');
            }

            if (typeof req.query.page !== 'undefined') {
                currentPage = req.query.page;
            }
        });

        let page = 1;

        if (req.query.q === null || req.query.q === '') {
            res.redirect('/');
        }

        if (req.query.page) {
            page = req.query.page;
            console.log('Page', typeof page);
            console.log('Page ini error');
        }

        let offset = (page * pageSize) - pageSize;
        console.log('offset', offset);

        let q = `SELECT *FROM wisata WHERE name LIKE '%` + req.query.q + `%' ORDER BY created_at DESC LIMIT 8 OFFSET ${offset}`;
        console.log(q);

        let sql = con.query(q, function (err, result) {
            if (err) {
                console.log(err);
            }
            res.render('search', {
                title: 'search',
                search: result,
                q: req.query.q,
                pageSize: pageSize,
                pageCount: pageCount,
                currentPage: currentPage
            });
        });
    });
});

//Login
router.get('/login', alreadyLogin(), function (req, res, next) {
    res.render('admin/login', { title: 'Login' });
});
router.post('/login',
    passport.authenticate('local', {
        successRedirect: '/admin',
        failureRedirect: '/login'
    }));

//logout
router.get('/logout', function (req, res, next) {
    req.logout();
    req.session.destroy();
    res.redirect('/login');
});


passport.serializeUser(function (user_id, done) {
    done(null, user_id);
});

passport.deserializeUser(function (user_id, done) {
    done(null, user_id);
});

function alreadyLogin() {
    return (req, res, next) => {
        if (req.isAuthenticated()) {
            res.redirect('/admin');

        } else {
            return next();
        }
    }
}

module.exports = router;