const Rsvp = require('../model/Rsvp'); 
const Event = require('../model/Event');
const User = require('../model/user'); 
const Category = require('../model/Category');


module.exports.createRsvp = async (req, res) => {
  try {
    const { event, user, category } = req.body;


    if (!event || !user || !category) {
      return res.status(400).json({ message: 'Event, user, and category are required' });
    }

   
    const eventExists = await Event.findById(event);
    const userExists = await User.findById(user);
    const categoryExists = await Category.findById(category);

    if (!eventExists || !userExists || !categoryExists) {
      return res.status(404).json({ message: 'Event, user, or category not found' });
    }

    
    const existingRsvp = await Rsvp.findOne({ event, user });
    if (existingRsvp) {
      return res.status(400).json({ message: 'User has already RSVP\'d for this event' });
    }


    const rsvp = new Rsvp({ event, user, category });
    await rsvp.save();

    res.status(201).json({
      message: 'RSVP created successfully',
      rsvp,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error creating RSVP', error });
  }
};


module.exports.getAllRsvps = async (req, res) => {
  try {
    const rsvps = await Rsvp.find().populate('event').populate('user').populate('category');
    res.status(200).json(rsvps);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving RSVPs', error });
  }
};


module.exports.getRsvpById = async (req, res) => {
  try {
    const rsvp = await Rsvp.findById(req.params.id).populate('event').populate('user').populate('category');
    if (!rsvp) {
      return res.status(404).json({ message: 'RSVP not found' });
    }
    res.status(200).json(rsvp);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving RSVP', error });
  }
};


module.exports.updateRsvpStatus = async (req, res) => {
  try {
    const { status } = req.body;


    if (!status || !['pending', 'attending', 'Rejected'].includes(status)) {
      return res.status(400).json({ message: 'Invalid status value' });
    }

    const rsvp = await Rsvp.findByIdAndUpdate(
      req.params.id,
      { status },
      { new: true, runValidators: true }
    ).populate('event').populate('user').populate('category');

    if (!rsvp) {
      return res.status(404).json({ message: 'RSVP not found' });
    }

    res.status(200).json({
      message: 'RSVP status updated successfully',
      rsvp,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error updating RSVP status', error });
  }
};


module.exports.deleteRsvp = async (req, res) => {
  try {
    const rsvp = await Rsvp.findByIdAndDelete(req.params.id);
    if (!rsvp) {
      return res.status(404).json({ message: 'RSVP not found' });
    }
    res.status(200).json({ message: 'RSVP deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting RSVP', error });
  }
};


module.exports.getRsvpsByEvent = async (req, res) => {
  try {
    const { eventId } = req.params;

  
    const eventExists = await Event.findById(eventId);
    if (!eventExists) {
      return res.status(404).json({ message: 'Event not found' });
    }


    const rsvps = await Rsvp.find({ event: eventId }).populate('user').populate('category');
    res.status(200).json(rsvps);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving RSVPs for the event', error });
  }
};


module.exports.getRsvpsByUser = async (req, res) => {
  try {
    const { userId } = req.params;


    const userExists = await User.findById(userId);
    if (!userExists) {
      return res.status(404).json({ message: 'User not found' });
    }

  
    const rsvps = await Rsvp.find({ user: userId }).populate('event').populate('category');
    res.status(200).json(rsvps);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving RSVPs for the user', error });
  }
};