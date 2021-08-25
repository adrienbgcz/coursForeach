const express = require('express');
const router = express.Router();

const { validateTodoBodyCreate,  validateTodoBodyUpdateAndParams, validateTodoBodyCreateAndParams, validateTodoParams, validateTodoQuery } = require('../validation/todos.validation')

const { getAllTodos, deleteTodo, saveTodo, getTodoById } = require('../service/todos.service')

router.get('/',
    validateTodoQuery,
    (req, res) => {
    const { termine, etiquettes } = req.query
    res.status(200).json(getAllTodos(termine, (etiquettes && !Array.isArray(etiquettes))?[etiquettes]:(etiquettes || [])))
});

router.get('/:id',
    validateTodoParams,
    (req, res) => {
    res.status(200).json(getTodoById(parseInt(req.params.id)))
});

router.post('/',
    validateTodoBodyCreate,
    (req, res) => {
    const newTodo = req.body
    res.status(201).json(saveTodo(newTodo))
});

router.put('/:id',
    validateTodoBodyCreateAndParams,
    (req, res) => {
    res.status(204).json(saveTodo(req.body, parseInt(req.params.id), true))
})

router.patch('/:id',
    validateTodoBodyUpdateAndParams,
    (req, res) => {
    res.status(204).json(saveTodo(req.body, parseInt(req.params.id), false))
})

router.delete('/:id',
    validateTodoParams,
    (req, res) => {
    res.status(204).json(deleteTodo(parseInt(req.params.id)))
})


module.exports = router;