const express = require('express');
const router = express.Router();

const { validateEtiquetteBody, validateEtiquetteBodyAndParams, validateEtiquetteParams } = require('../validation/etiquettes.validation')

const { saveEtiquette, getEtiquetteById, getAllEtiquettes, deleteEtiquette } = require('../service/etiquettes.service')

router.get('/', (req, res) => {
    res.status(200).json(getAllEtiquettes())
});

router.get('/:id', (req, res) => {
    res.status(200).json(getEtiquetteById(parseInt(req.params.id)))
});

router.post('/',
    validateEtiquetteBody,
    (req, res) => {
    const newEtiquette = req.body
    res.status(201).json(saveEtiquette(newEtiquette))
});

router.put('/:id',
    validateEtiquetteBodyAndParams,
    (req, res) => {
    const updatedEtiquette = req.body
    res.status(204).json(saveEtiquette(updatedEtiquette, parseInt(req.params.id)))
})

router.delete('/:id',
    validateEtiquetteParams,
    (req, res) => {
    res.status(204).json(deleteEtiquette(parseInt(req.params.id)))
})

module.exports = router;