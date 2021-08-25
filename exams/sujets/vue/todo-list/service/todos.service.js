const { getAll, findById, save, remove } = require("../data/todos.data")

function getAllTodos(termine, etiquettes) {
    return getAll(termine, etiquettes)
}

function getTodoById(id) {
    return findById(id)
}

function saveTodo(etiquette, id, replace){
    return save(etiquette, id, replace)
}

function deleteTodo(id){
    return remove(id)
}

module.exports = {
    getAllTodos,
    getTodoById,
    saveTodo,
    deleteTodo,
}