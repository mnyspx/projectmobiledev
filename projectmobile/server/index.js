const express = require('express');
const bcrypt = require('bcrypt');
const config = require('./config.js');
const mysql = require('mysql');
const con = mysql.createConnection(config);

const app = express();
//======================= middleware =================
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//======================= Other routes ===============

//--login--
app.post('/login', function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const sql = "SELECT password FROM user WHERE username =?";
    con.query(sql, [username], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('DB server error');
        } else {
            //find user found?
            if (result.length != 1) {
                res.status(400).send('username is wrong');
            } else {
                //check password
                bcrypt.compare(password, result[0].password, function (err, same) {
                    if (err) {
                        console.log(err);
                        res.status(500).send('authen server error');
                    } else {
                        if (same) {
                            const sql_id = "SELECT `UserID`, `username`, `image`, `Email`, `FullName`, `Phone` FROM user WHERE username =? AND password = ?"
                            con.query(sql_id, [username, result[0].password], function (err, result) {
                                if (err) {
                                    console.log(err)
                                } else {
                                    console.log(result)
                                    res.status(200).send(result);
                                }
                            })
                            // res.send('Login ok');
                        } else {
                            res.status(400).send('wrong password');
                        }
                    }
                });
            }
        }
    });
});

//register
app.post('/register', function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const email = req.body.email;
    const fullname = req.body.fullname;
    const phone = req.body.phone;
    bcrypt.hash(password, 10, function (err, hash) {
        if (err) {
            console.log(err)
            res.status(500).send('Hashing error');
        } else {
            const sql = "INSERT INTO `user`( `username`, `password`, `Email`, `FullName`, `Phone`) VALUES (?,?,?,?,?)";
            con.query(sql, [username, hash, email, fullname, phone], function (err, result) {
                if (err) {
                    console.log(err)
                    res.status(500).send('db error');
                } else {
                    const rows = result.affectedRows;
                    if (rows != 1) {
                        console.log(err)
                        res.status(503).send("Insertion error");
                    } else {
                        console.log(result)
                        res.status(200).send("register success");
                    }
                }
            });
        }
    });
});

//edit profile
app.put('/editProf', function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const email = req.body.email;
    const fullname = req.body.fullname;
    const phone = req.body.phone;
    const uid = req.body.uid;
    bcrypt.hash(password, 10, function (err, hash) {
        if (err) {
            console.log(err)
            res.status(500).send('Hashing error');
        } else {
            const sql = "UPDATE `user` SET `username`=?,`password`=?,`Email`=?,`FullName`=?,`Phone`=? WHERE UserID = ?";
            con.query(sql, [username, hash, email, fullname, phone,uid], function (err, result) {
                if (err) {
                    console.log(err)
                    res.status(500).send('db error');
                } else {
                    const rows = result.affectedRows;
                    if (rows != 1) {
                        console.log(err)
                        res.status(503).send("Update error");
                    } else {
                        console.log(result)
                        res.status(200).send("Update success");
                    }
                }
            });
        }
    });
});

//add tent
app.post('/addTent', function (req, res) {
    const name = req.body.name;
    const img = req.body.img;
    const desc = req.body.desc;
    const contact = req.body.contact;
    const price = req.body.price;
    const uid = req.body.uid;
    const sql = "INSERT INTO `tent` (`Name`, `image`, `Description`, `contact`, `price`, `UserID`) VALUES (?, ?, ?, ?, ?, ?)"
    con.query(sql, [name, img, desc, contact, price, uid], function (err, result) {
        if (err) {
            console.log(err)
            res.status(500).send('server error');
        } else {
            // console.log(result)
            res.status(200).send("register tent success");
        }
    })
})

//add camp
app.post('/addServ', function (req, res) {
    const name = req.body.name;
    const img = req.body.img;
    const desc = req.body.desc;
    const contact = req.body.contact;
    const price = req.body.price;
    const location = req.body.location;
    const statusService = req.body.statusService;
    const uid = req.body.uid;
    const sql_normal = "INSERT INTO `campsite` (`Name`, `image`, `Description`, `contact`, `price`, `location`, `statusService`, `UserID`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    // const sql_zone = "INSERT INTO `zone` (`ID`, `zoneName`, `CampID`) VALUES (?, ?, ?)"
    con.query(sql_normal, [name, img, desc, contact, price, location, statusService, uid], function (err, result) {
        if (err) {
            console.log(err)
            res.status(500).send('server error');
        } else {
            console.log(result)
            res.status(200).send("register camp success");
        }
    })
})

//query camp list
app.get('/campList', function (req, res) {
    const sql = "SELECT * FROM `campsite`";
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err)
            res.status(500).send('server error');
        } else {
            // console.log(result)
            res.status(200).send(result);
        }
    })
})


//query camp info
app.post('/campInfo', function (req, res) {
    const campID = req.body.campID;
    const sql = "SELECT * FROM `campsite` WHERE `CampID` = ?";
    con.query(sql, [campID], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('server error');
        } else {
            // console.log(result);
            res.status(200).send(result);
        }
    });
});

//new query service list
// app.get('/serviceList', function (req, res) {
//     const sql = "SELECT * FROM `service`";
//     con.query(sql, function (err, result) {
//         if (err) {
//             console.log(err)
//             res.status(500).send('server error');
//         } else {
//             // console.log(result)
//             res.status(200).send(result);
//         }
//     })
// })

//new service info
// app.post('/campi', function (req, res) {
//     const serid = req.body.serid;
//     const sql = "SELECT * FROM `service` WHERE ID = ?";
//     con.query(sql, [serid], function (err, result) {
//         if (err) {
//             console.log(err)
//             res.status(500).send('server error');
//         } else {
//             // console.log(result)
//             res.status(200).send(result);
//         }
//     })
// })

//reserve camp
app.post('/reserveCamp', function (req, res) {
    const uid = req.body.uid;
    const cid = req.body.cid;
    const firstDate = req.body.firstDate;
    const lastDate = req.body.lastDate;
    const day = req.body.day;
    const sql = "INSERT INTO `campreserve` (`UserID`, `CampID`, `firstDate`, `lastDate`, `Day`) VALUES (?, ?, ?, ?, ?)";
    con.query(sql, [uid, cid, firstDate, lastDate, day], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('server error');
        } else {
            console.log(result);
            res.status(200).send('result is OK');
        }
    });
});

//camp tent transaction
app.post('/transac', function (req, res) {
    const uid = req.body.uid;
    const sqlc = "SELECT campreserve.reserveTime,campreserve.Camp_res_ID,campsite.CampID,campreserve.UserID , campsite.Name, campsite.price, campreserve.firstDate, campreserve.lastDate, campreserve.Day, campreserve.status, campsite.statusService, campsite.contact FROM campreserve,campsite WHERE campreserve.CampID = campsite.CampID AND campreserve.UserID = ? ORDER BY `campreserve`.`reserveTime` DESC";
    const sqlt = "SELECT tentreserve.reserveTime,tent.TentID,tentreserve.UserID , tent.Name, tent.price, tentreserve.firstDate, tentreserve.lastDate, tentreserve.Day, tentreserve.status FROM tentreserve,tent WHERE tentreserve.TentID = tent.TentID AND tentreserve.UserID = ? ORDER BY `tentreserve`.`reserveTime` DESC";
    con.query(sqlc, [uid], function (err, camp) {
        if (err) {
            console.log(err);
            res.status(500).send('server error (database)');
        } else {
            // console.log(camp);
            con.query(sqlt, [uid], function (err, tent) {
                if (err) {
                    console.log(err);
                    res.status(500).send('server error (database)');
                } else {
                    // console.log(tent);
                    res.status(200).send({ camp, tent });
                }
            });
        }
    });
});

//search
app.post('/search', function (req, res) {
    const keyword = req.body.keyword;
    const word = "%" + keyword + "%";
    const sqlc = "SELECT * FROM `campsite` WHERE Name LIKE ?";
    // const sqlt = "SELECT * FROM `tent` WHERE Name LIKE '%?%'";
    con.query(sqlc, [word], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('db error');
        } else {
            // console.log(result);
            res.status(200).send(result);
        }
    });
});

//edit page
app.post('/viewService', function (req, res) {
    const uid = req.body.uid;
    const sql = "SELECT * FROM `campsite` WHERE userID = ?";
    con.query(sql, [uid], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('db error');
        } else {
            // console.log(result);
            res.status(200).send(result);
        }
    });
});

//update service info
app.put('/updatService', function (req, res) {
    const name = req.body.name;
    const desc = req.body.desc;
    const contact = req.body.contact;
    const price = req.body.price;
    const location = req.body.location;
    const cid = req.body.cid;
    const sql = "UPDATE `campsite` SET `Name`=?,`Description`=?,`contact`=?,`price`=?,`location`=? WHERE CampID = ?";
    con.query(sql, [name, desc, contact, price, location, cid], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('db error');
        } else {
            console.log(result);
            res.status(200).send('edit complete');
        }
    });
});

//reserve status change
app.put('/updateResStatus', function (req, res) {
    const resID = req.body.resID;
    const status = req.body.status;
    const sql = "UPDATE `campreserve` SET `status` = ? WHERE `campreserve`.`Camp_res_ID` = ?";
    con.query(sql, [status, resID], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('db error');
        } else {
            console.log(result);
            res.status(200).send('edit complete');
        }
    });
});

//reserve request
app.post('/reserveReq', function (req, res) {
    const uid = req.body.uid;
    const sql = "SELECT campreserve.reserveTime,campreserve.Camp_res_ID,campsite.CampID,campreserve.UserID,user.username , campsite.Name, campsite.price, campreserve.firstDate, campreserve.lastDate, campreserve.Day, campreserve.status, campsite.statusService, campsite.contact FROM campreserve,campsite,user WHERE campreserve.CampID = campsite.CampID AND campreserve.UserID = user.UserID AND campsite.UserID = ? ORDER BY `campreserve`.`reserveTime` DESC";
    con.query(sql, [uid], function (err, result) {
        if (err) {
            console.log(err);
            res.status(500).send('server error (database)');
        } else {
            // console.log(result);
            res.status(200).send(result);
        }
    });
});


//======================= Page routes ================


///====================== starting ===================
const port = 3000;
app.listen(port, function () {
    console.log('Server is running at ' + port);
});