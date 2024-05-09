const firebase = require('../firebase.js');
const News = require('../models/News.js'); // Assuming you have a News model defined
const { getFirestore, collection, doc, addDoc, getDoc, getDocs, updateDoc, deleteDoc } = require('firebase/firestore');

const db = getFirestore(firebase);

exports.CreateNews = async (req, res, next) => {
  try {
    const data = req.body;
    await addDoc(collection(db, 'news'), data);
    res.status(200).send('News created successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetNews = async (req, res, next) => {
  try {
    const news = await getDocs(collection(db, 'news'));
    const newsArray = [];

    if(news.empty) {
      res.status(404).json({ message: 'No news found' });
    } else {
      news.forEach(item => {
        const newsData = item.data();
        const newNews = new News(item.id, newsData.title, newsData.photoUrl, newsData.mainText);
        newsArray.push(newNews);
      });

      res.status(200).json(newsArray);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetNewsById = async (req, res, next) => {
  try {
    const newsId = req.params.id;
    const newsRef = doc(db, 'news', newsId);
    const newsSnapshot = await getDoc(newsRef);

    if (newsSnapshot.exists()) {
      const newsData = newsSnapshot.data();
      const news = new News(newsSnapshot.id, newsData.title, newsData.photoUrl, newsData.mainText);
      res.status(200).json(news);
    } else {
      res.status(404).json({ message: 'News not found' });
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.UpdateNews = async (req, res, next) => {
  try {
    const newsId = req.params.id;
    const data = req.body;

    const newsRef = doc(db, 'news', newsId);

    await updateDoc(newsRef, data);

    res.status(200).send('News updated successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.DeleteNews = async (req, res, next) => {
  try {
    const newsId = req.params.id;

    await deleteDoc(doc(db, 'news', newsId));

    res.status(200).send('News deleted successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};
