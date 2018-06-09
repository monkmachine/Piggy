var express = require('express');
var router = express.Router();
var getConnection = require('../db/mysql');
var app = express();



/* GET users listing. */
router.get('/',  getConnection(function (err, con) {
            que = 'SELECT * from users';
            con.query(que, function (err, result) {
                if (err) throw err;
                con.release();
                res.json(result);
            });


}));

module.exports = router;
