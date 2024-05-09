const firebase = require('../firebase.js');
const Events = require('../models/Event.js');
const { getFirestore, collection, doc, addDoc, getDoc, getDocs, updateDoc, deleteDoc } = require('firebase/firestore');

const db = getFirestore(firebase);

exports.CreateEvent = async (req, res, next) => {
  try {
    const data = req.body;
    await addDoc(collection(db, 'events'), data);
    res.status(200).json({ message: 'Event created successfully' });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.GetEvents = async (req, res, next) => {
  try {
    const events = await getDocs(collection(db, 'events'));
    const eventsArray = [];

    if (events.empty) {
      res.status(404).json({ message: 'No events found' });
    } else {
      events.forEach(event => {
        const eventData = event.data();
        const newEvent = new Events(
          event.id,
          eventData.name,
          eventData.location,
          eventData.date,
          eventData.description
        );
        eventsArray.push(newEvent);
      });

      res.status(200).json(eventsArray);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.GetEvent = async (req, res, next) => {
  try {
    const eventId = req.params.id;
    const eventRef = doc(db, 'events', eventId);
    const eventSnapshot = await getDoc(eventRef);

    if (eventSnapshot.exists()) {
      res.status(200).json(eventSnapshot.data());
    } else {
      res.status(404).json({ message: 'Event not found' });
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.UpdateEvent = async (req, res, next) => {
  try {
    const eventId = req.params.id;
    const data = req.body;

    const eventRef = doc(db, 'events', eventId);

    await updateDoc(eventRef, data);

    res.status(200).json({ message: 'Event updated successfully' });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.DeleteEvent = async (req, res, next) => {
  try {
    const eventId = req.params.id;

    await deleteDoc(doc(db, 'events', eventId));

    res.status(200).send('Event deleted successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.GetRandomEvent = async (req, res, next) => {
  try {
    const events = await getDocs(collection(db, 'events'));
    const eventsArray = [];

    if (events.empty) {
      res.status(404).json({ message: 'No events found' });
    } else {
      events.forEach(event => {
        const eventData = event.data();
        eventsArray.push({
          id: event.id,
          name: eventData.name,
          location: eventData.location,
          date: eventData.date,
          description: eventData.description
        });
      });

      // Get a random index within the events array length
      const randomIndex = Math.floor(Math.random() * eventsArray.length);
      const randomEvent = eventsArray[randomIndex]; // Select the event at the random index
      res.status(200).json(randomEvent);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};