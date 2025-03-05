const Event = require('../models/event');  // Import the Event model


module.exports.createEvent = async (req, res) => {
  try {
    const { title, location, Category, image, orgnaizer, Startdate, Enddate } = req.body;

   
    if (!title || !location || !Category || !orgnaizer || !Startdate || !Enddate) {
      return res.status(400).json({ message: 'All fields are required' });
    }

    const event = new Event(req.body);
    await event.save();
    res.status(201).json({
      message: 'Event created successfully',
      event,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error creating event', error });
  }
};

module.exports.getAllEvents = async (req, res) => {
  try {
    const events = await Event.find().populate('Category').populate('orgnaizer');
    res.status(200).json(events);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving events', error });
  }
};


module.exports.getEventById = async (req, res) => {
  try {
    const event = await Event.findById(req.params.id).populate('Category').populate('orgnaizer');
    if (!event) {
      return res.status(404).json({ message: 'Event not found' });
    }
    res.status(200).json(event);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving event', error });
  }
};


module.exports.updateEvent = async (req, res) => {
  try {
    const event = await Event.findByIdAndUpdate(req.params.id, req.body, { new: true, runValidators: true }).populate('Category').populate('orgnaizer');
    if (!event) {
      return res.status(404).json({ message: 'Event not found' });
    }
    res.status(200).json({
      message: 'Event updated successfully',
      event,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error updating event', error });
  }
};

// DELETE an event by ID
module.exports.deleteEvent = async (req, res) => {
  try {
    const event = await Event.findByIdAndDelete(req.params.id);
    if (!event) {
      return res.status(404).json({ message: 'Event not found' });
    }
    res.status(200).json({ message: 'Event deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting event', error });
  }
};

// SEARCH events by criteria (title, location, category, etc.)
module.exports.searchEvents = async (req, res) => {
  try {
    const { title, location, Category, orgnaizer, Startdate, Enddate } = req.query;

    // Build the search query dynamically based on provided criteria
    const query = {};
    if (title) query.title = { $regex: title, $options: 'i' }; // Case-insensitive search
    if (location) query.location = { $regex: location, $options: 'i' };
    if (Category) query.Category = Category;
    if (orgnaizer) query.orgnaizer = orgnaizer;
    if (Startdate) query.Startdate = { $gte: new Date(Startdate) };
    if (Enddate) query.Enddate = { $lte: new Date(Enddate) };

    const events = await Event.find(query).populate('Category').populate('orgnaizer');
    res.status(200).json(events);
  } catch (error) {
    res.status(500).json({ message: 'Error searching events', error });
  }
};