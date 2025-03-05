const express = require('express');
const router = express.Router();
const eventController = require('../controller/eventcontroller');

//
router.post('/events', eventController.createEvent);
router.get('/events', eventController.getAllEvents);
router.get('/events/:id', eventController.getEventById);
router.put('/events/:id', eventController.updateEvent);
router.delete('/events/:id', eventController.deleteEvent);


router.get('/events/search', eventController.searchEvents);

module.exports = router;