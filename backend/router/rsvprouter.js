const express = require('express');
const router = express.Router();
const rsvpController = require('../controller/rsvpcontroller');


router.post('/rsvps', rsvpController.createRsvp);
router.get('/rsvps', rsvpController.getAllRsvps);
router.get('/rsvps/:id', rsvpController.getRsvpById);
router.put('/rsvps/:id/status', rsvpController.updateRsvpStatus);
router.delete('/rsvps/:id', rsvpController.deleteRsvp);


router.get('/events/:eventId/rsvps', rsvpController.getRsvpsByEvent);
router.get('/users/:userId/rsvps', rsvpController.getRsvpsByUser);

module.exports = router;