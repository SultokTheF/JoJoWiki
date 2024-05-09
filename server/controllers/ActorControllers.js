const firebase = require('../firebase.js');
const Actor = require('../models/Actor.js');
const { getFirestore, collection, doc, addDoc, getDoc, getDocs, updateDoc, deleteDoc } = require('firebase/firestore');

const db = getFirestore(firebase);

exports.CreateActor = async (req, res, next) => {
  try {
    const data = req.body;
    await addDoc(collection(db, 'actors'), data);
    res.status(200).send('Actor created successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetActors = async (req, res, next) => {
  try {
    const actors = await getDocs(collection(db, 'actors'));
    const actorsArray = [];

    if(actors.empty()) {
      res.status(404).json({ message: 'No actors found' });
    } else {
      actors.forEach(actor => {
        actor = new Actor(
          actor.id,
          actor.data().name,
          actor.data().season,
          actor.data().age,
          actor.data().description,
          actor.data().slogan
        );

        actorsArray.push(actor);
      });

      res.status(200).json(actorsArray);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetActor = async (req, res, next) => {
  try {
    const actorId = req.params.id;
    const actor = await getDoc(doc(db, 'actors', actorId));

    const data = await getDoc(actor);

    if(data.exists()) {
      res.status(200).json(data.data());
    } else {
      res.status(404).json({ message: 'Actor not found' });
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.UpdateActor = async (req, res, next) => {
  try {
    const actorId = req.params.id;
    const data = req.body;

    const Actor = doc(db, 'actors', actorId);

    await updateDoc(Actor, data);

    res.status(200).send('Actor updated successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.DeleteActor = async (req, res, next) => {
  try {
    const actorId = req.params.id;

    await deleteDoc(doc(db, 'actors', actorId));

    res.status(200).send('Actor deleted successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}
