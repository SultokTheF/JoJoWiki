const firebase = require('../firebase.js');
const Stuff = require('../models/Stuff.js');
const { getFirestore, collection, doc, addDoc, getDoc, getDocs, updateDoc, deleteDoc } = require('firebase/firestore');

const db = getFirestore(firebase);

exports.GetStuffs = async (req, res, next) => {
  try {
    const stuffs = await getDocs(collection(db, 'stuffs'));
    const stuffsArray = [];

    if(stuffs.empty) {
      res.status(404).json({ message: 'No stuffs found' });
    } else {
      stuffs.forEach(item => {
        const stuffData = item.data();
        const newStuff = new Stuff(item.id, stuffData.name, stuffData.age, stuffData.role, stuffData.description, stuffData.imageUrl);
        stuffsArray.push(newStuff);
      });

      res.status(200).json(stuffsArray);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetStuffById = async (req, res, next) => {
  try {
    const stuffId = req.params.id;
    const stuffRef = doc(db, 'stuffs', stuffId);
    const stuffSnapshot = await getDoc(stuffRef);

    if (stuffSnapshot.exists()) {
      const stuffData = stuffSnapshot.data();
      const stuff = new Stuff(stuffSnapshot.id, stuffData.name, stuffData.age, stuffData.role, stuffData.description, stuffData.imageUrl);
      res.status(200).json(stuff);
    } else {
      res.status(404).json({ message: 'Stuff not found' });
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.CreateStuff = async (req, res, next) => {
  try {
    const data = req.body;
    await addDoc(collection(db, 'stuffs'), data);
    res.status(200).json({ message: 'Stuff created successfully' });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.UpdateStuff = async (req, res, next) => {
  try {
    const stuffId = req.params.id;
    const data = req.body;

    const stuffRef = doc(db, 'stuffs', stuffId);

    await updateDoc(stuffRef, data);

    res.status(200).json({ message: 'Stuff updated successfully' });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.DeleteStuff = async (req, res, next) => {
  try {
    const stuffId = req.params.id;

    await deleteDoc(doc(db, 'stuffs', stuffId));

    res.status(200).send('News deleted successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};
