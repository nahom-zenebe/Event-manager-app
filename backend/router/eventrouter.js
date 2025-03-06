const express = require('express');
const router = express.Router();
const eventController = require('../controller/eventcontroller');

//
router.post('/event/createevent', eventController.createEvent);
router.get('/event/getallevents', eventController.getAllEvents);
router.get('/events/:id', eventController.getEventById);
router.put('/event/updateevent/:id', eventController.updateEvent);
router.delete('/event/deleteevent/:id', eventController.deleteEvent);


router.get('/events/searchevent', eventController.searchEvents);

module.exports = router;