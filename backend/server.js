// server.js
const express = require('express');
const cookieParser = require('cookie-parser');
const mongoose = require('mongoose');
const authRoutes = require('./router/prorouter'); // Import auth routes
const cors=require('cors')
const app = express();
const eventrouter=require('./router/eventrouter')
require('dotenv').config()
// Middleware
app.use(express.json());      // Body parser middleware
app.use(cookieParser());      // Cookie parser middleware
app.use(cors({
  origin: "*",  // Allow all origins for testing
  methods: ["GET", "POST", "PUT", "DELETE"],
  credentials: true  // Allow cookies if needed
}));
// Routes
app.use('/api/auth', authRoutes);
app.use('/api/event',eventrouter)


mongoose.connect(process.env.MongoDBUrL, {

})
.then(() => console.log('MongoDB connected'))
.catch((err) => console.log('Database connection error:', err));

// Define the port and start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
