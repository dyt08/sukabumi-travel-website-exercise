'use strict';
var express = require('express');
var router = express.Router();

//passport
var passport = require('passport');

//multer upload image
const multer = require('multer');

const  storage = multer.diskStorage({
    destination: function (req,file,cb) {
        cb(null,'public/uploads/wisata');
    },
    filename: function (req,file,cb) {
        cb(null,new Date().getTime()+'-' + 'wisata' + '-'+ file.originalname);
    }

});
const uploadProduct = multer({ storage : storage});
// const upload = multer({storage:storage});
//
// // const filterFile = (req,file,cb) => {
// //
// //     if (file.mimetype ==='image/jpeg' || file.mimetype ==='image/png') {
// //         cb(null,true);
// //     }else {
// //         cb(null, false);
// //     }
// // };

/* variabel */
var totalRec        = 0;
var pageSize        = 8;
var pageCount       = 0;
var currentPage     = 1;

//-------------------------------------------------Admin --------------------------------------------------------
//
router.get('/',needLogin(),adminPage(), function(req, res, next) {
    res.render('admin/index', { title: 'Dashboard' });
});

router.get('/inbox',needLogin(),adminPage(), function (req, res,next) {
    req.getConnection(function (error, con) {
    if (error){
        console.log(error);
    }
    var countData = con.query("SELECT COUNT(*) as numrows FROM contact", function (err, countrows){
        if (err) throw err;
        totalRec = countrows[0].numrows;
        pageCount = Math.ceil(totalRec/ pageSize);

        if(typeof req.query.page !== 'undefined'){
            currentPage = req.query.page;
        }
    });

    var page = 1;

    if( req.query.page){
        page = req.query.page;
        console.log('Page',typeof page);
        console.log('Page ini error');
    }

    var offset = (page*pageSize) - pageSize ;
    console.log('offset',offset);

    var q = `SELECT *,DATE_FORMAT(idatetime, '%Y-%m-%d') idate,DATE_FORMAT(idatetime,'%H:%i:%s') itime FROM contact ORDER BY idatetime DESC LIMIT ${pageSize} OFFSET ${offset}`;
    console.log(q);

    var sql = con.query(q, function (err, result) {
        if(err){
            console.log(err);
        }
        res.render('admin/inbox', {
            title       : 'Inbox',
            All        : result,
            pageSize    : pageSize,
            pageCount   : pageCount,
            currentPage : currentPage
        });
    });
});


});

router.get('/addwisata',needLogin(),adminPage(), function(req, res, next) {
    res.render('admin/addwisata', { title: 'Tambah Data Wisata' });
});

router.get('/calendar',needLogin(),adminPage(), function (req, res, next) {
    res.render('admin/calendar', { title: 'Calendar' });
});

router.get('/profile',needLogin(),adminPage(), function(req, res, next) {
    res.render('admin/profile', { title: 'Profile' });
});

router.get('/inbox/:ticket',needLogin(),adminPage(), function(req, res, next) {
    req.getConnection(function (err, con) {
        con.query(`SELECT *FROM contact WHERE ticket = "`+req.params.ticket +`"`,
            function (err, result) {

            res.render('admin/inboxdetail',{
                pp : result,
                title : 'Inbox'
            });
        });
    });
});

router.post('/nstatus/:ticket',needLogin(),adminPage(), function(req, res, next) {
    req.getConnection(function (error,con) {
        con.query('UPDATE contact SET status="Closed" WHERE ticket = "'+req.params.ticket+'"',function (err, result,next) {
                if (err){
                    return next();
                } else if(result.affectedRows) {
                    res.redirect('/admin/inbox');
                }
            });
    });
});

//List, Edit, Add Wisata

router.get('/listwisata',needLogin(),adminPage(), function(req, res, next) {
    req.getConnection(function (err, con) {
        con.query('SELECT *FROM wisata WHERE category="alam" ORDER BY created_at DESC;SELECT *FROM wisata WHERE category="kuliner" ORDER BY created_at DESC',
            function (err, result) {

            res.render('admin/listwisata',{
                Alam : result[0],
                Kuliner : result[1],
                title : 'Daftar Wisata'
            });
        });
    });
});

//End List, Edit, Add Wisata
/* --------------------------------------------------------------------------------------------------------- */

/*------------------------------------------------- Admin Action --------------------------------------------------------------*/


//add Wisata
router.post('/naddwisata',uploadProduct.single('images') ,needLogin(),adminPage(), function(req, res, next) {
    const wisata_id = req.body.wisata_id;
    const name = req.body.name;
    const category = req.body.category;
    const desc = req.body.desc;
    const maps =req.body.maps;
    const images = req.file.filename;
    // res.send(req.files);
    //connection.query('your mysql query', next);
    req.getConnection(function (error,con) {
       let q= con.query('INSERT INTO wisata (wisata_id,name,category,descr,maps,images) VALUES (?,?,?,?,?,?)',
            [wisata_id,name,category,desc,maps,images], function (err, result) {
                if (err){
                    console.log(err);
                } else {
                    res.redirect('/admin/listwisata');
                }

            });
         console.log(q);
    });

});


//update Wisata
router.post('/neditwisata/:wisata_id',uploadProduct.single('images'),needLogin(),adminPage(), function(req, res, next) {
    const wisata_id = req.body.wisata_id;
    const name = req.body.name;
    const category = req.body.category;
    const desc = req.body.desc;
    const maps =req.body.maps;
    // const images = req.file.filename;
    // res.send(req.files);
    //connection.query('your mysql query', next);
  req.getConnection(function (error,con) {
    if (typeof req.file !== 'undefined'){
        con.query('UPDATE wisata SET name="'+name+'",category="'+category+'",descr="'+desc+'",maps="'+maps+'",' +
            'images="'+req.file.filename+'" WHERE wisata_id="'+wisata_id+'"',
            function (err, result,next) {
                if (err){
                    console.log(err); 
                } 
                if(result.affectedRows) {
                    res.redirect('/admin/listwisata');
                }
            });
    } else {
        con.query('UPDATE wisata SET name="'+name+'",category="'+category+'",descr="'+desc+'",maps="'+maps+'"' +
            'WHERE wisata_id="'+wisata_id+'"',
            function (err, result,next) {
                if (err){
                    console.log(err);
                }
                if(result.affectedRows) {
                    res.redirect('/admin/listwisata');
                }
            });
    }
    });
});

//Delete Wisata
router.get('/delwisata/:wisata_id',needLogin(),adminPage(), function(req, res, next) {
    req.getConnection(function (error, con) {
        con.query("DELETE FROM wisata WHERE wisata_id = '"+req.params.wisata_id +"'",function (err, result,next) {
            if (err){
                throw err;
            }else if(result.affectedRows) {
                    res.redirect('/admin/listwisata');
                }
        });
    });
});

router.get('/editwisata/:wisata_id',needLogin(),adminPage(), function(req, res, next) {
    req.getConnection(function (error, con) {
        con.query("SELECT *FROM wisata WHERE wisata_id = '"+req.params.wisata_id +"'",function (err, result,next) {
            if (err){
                throw err;
            }else {
                res.render('admin/editwisata', {
                    Wisata : result,
                    title: 'Ubah Data Wisata'
                });
            }
        });
    });
});

// router.get('/editprofile',needLogin(),adminPage(), function(req, res, next) {
//     req.getConnection(function (error, con) {
//         con.query("SELECT *FROM users WHERE username_login = '"+req.params.wisata_id +"'",function (err, result,next) {
//             if (err){
//                 throw err;
//             }else {
//                 res.render('admin/editwisata', {
//                     Wisata : result,
//                     title: 'Ubah Data Wisata'
//                 });
//             }
//         });
//     });
// });

/*--------------------------------------------------------------------------------------------------------------------------*/


function needLogin () {
    return (req, res, next) => {
        if (req.isAuthenticated()) return next();
        res.redirect('/login')
    }
}


function adminPage(){
    return (req, res, next) => {
        if (req.user.role==="admin") {
            return next();

        } else {
            res.redirect('/');
        }
    }
}

module.exports = router;