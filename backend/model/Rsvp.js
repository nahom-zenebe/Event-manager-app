

const mongoose = require('mongoose');


const  RsvpSchema = new mongoose.Schema({
  event: { type:mongoose.Schema.Types.ObjectId,required:true,ref:"Event" },
  user: { type:mongoose.Schema.Types.ObjectId, required: true,ref:"User" },
  category: { type:mongoose.Schema.Types.ObjectId, required: true,ref:"Category" },
  status: { type: String, default: 'pending', enum: ['pending', 'attending','Rejected'] }, 


},{timestamps:true});



const Rsvp = mongoose.model('Rsvp',  RsvpSchema);
module.exports =  Rsvp;
