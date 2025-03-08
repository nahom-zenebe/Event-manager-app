// server.js
const express = require('express');
const cookieParser = require('cookie-parser');
const mongoose = require('mongoose');
const authRoutes = require('./router/prorouter');
const cors=require('cors')
const app = express();
const eventrouter=require('./router/eventrouter')
const categoryrouter=require('./router/eventrouter')
const rsvprouter=require("./router/rsvprouter")
require('dotenv').config()

app.use(express.json());    
app.use(cookieParser());      
app.use(cors({
  origin: "*",  
  methods: ["GET", "POST", "PUT", "DELETE"],
  credentials: true  
}));
//67cb5d6806d0b3f33cc3ea4d-org
//cate

app.use('/api/auth', authRoutes);
app.use('/api/event',eventrouter)
app.use('/api/category', categoryrouter)
app.use('/api/rsvp',rsvprouter)

mongoose.connect(process.env.MongoDBUrL, {

})
.then(() => console.log('MongoDB connected'))
.catch((err) => console.log('Database connection error:', err));


const PORT = process.env.PORT || 5002;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
