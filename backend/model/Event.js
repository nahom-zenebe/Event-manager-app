
const mongoose = require('mongoose');


const  EventSchema = new mongoose.Schema({
  title: { type: String, required: true },
  location: { type: String, required: true, unique: true },
  Category: { type: mongoose.Schema.Types.ObjectId, required: true,ref:'Category' },
  image:{type:String},
  orgnaizer:{type: mongoose.Schema.Types.ObjectId, required: true,ref:'User'},
  Startdate:{type:Date,default:Date.now },
  Enddate:{type:Date,default:Date.now }



  
},{timestamps:true});



const Event = mongoose.model(' Rsvp',  EventSchema);
module.exports =  Event;
