const express = require('express');
const ActorControllers = require('../controllers/ActorControllers');

const router = express.Router();

router.get('/', ActorControllers.GetActors);
router.get('/:id', ActorControllers.GetActor);
router.post('/', ActorControllers.CreateActor);
router.put('/:id', ActorControllers.UpdateActor);
router.delete('/:id', ActorControllers.DeleteActor);

module.exports = router;
