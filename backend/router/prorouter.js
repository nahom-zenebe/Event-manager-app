// routes/authRoutes.js
const express = require('express');
const router = express.Router();
const { register, login, logout } = require('../controller/authcontroller');
const verifyToken = require('../middleware/Authmiddleware');


router.post('/register', register);  
router.post('/login', login);        

router.post('/logout', verifyToken, logout);

module.exports = router;
