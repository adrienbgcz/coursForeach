const { NotFoundException } = require('../exception/NotFoundException')

const todos = [
    {
        id: 1,
        nom: 'cirer les pompes',
        description: 'faire des compliments au boss',
        date_fin: '2021-07-17T00:00:00.000Z',
        termine: false,
        etiquettes: [
            {
                id: 1,
                nom: 'patron'
            },
            {
                id: 2,
                nom: 'boulot'
            }
        ]
    },
    {
        id: 2,
        nom: 'reu importante',
        description: 'preparer la reunion du 12',
        date_fin: '2021-07-11T00:00:00.000Z',
        termine: true,
        etiquettes: [
            {
                id: 2,
                nom: 'boulot'
            }
        ]
    }
]

let sequence = 3;

function getAll(termine, etiquettes) {
    let todosToReturn = [...todos]
    if(termine != undefined){
         todosToReturn = todosToReturn.filter(td => (td.termine == termine))
    }
    if(etiquettes && etiquettes.length > 0){
        todosToReturn = todosToReturn.filter(td => {
            const tdEtiquettes = td.etiquettes.map(etq => etq.id)
            return etiquettes.some(etq => {
                return tdEtiquettes.includes(etq)
            })
        })
    }
    return todosToReturn
}

function findById(id){
    const todo = [...todos].find((etq) => isTodo(etq, id))
    if(!todo) {
        throw new NotFoundException(`Todo with id ${id} not exist`)
    }
    return todo;
}

function remove(id){
    const indexTodoToDelete = todos.findIndex((td) => isTodo(td, id));
    if(indexTodoToDelete < 0){
        throw new NotFoundException(`Etiquette with id ${id} not exist`)
    }
    todos.splice(indexTodoToDelete, 1)
}

function isTodo(todo, id){
    return todo.id == id
}

function save(todo, id, replace) {
    if(id) {
        const indexTodoToUpdate = todos.findIndex((etq) => isTodo(etq, id));
        if(indexTodoToUpdate < 0){
            throw new NotFoundException(`Etiquette with id ${id} not exist`)
        } else {
            if(replace) {
                todos[indexTodoToUpdate] = { id, ...todo}
            }
            else {
                todos[indexTodoToUpdate] = { ...todos[indexTodoToUpdate], ...todo}
            }

        }
    } else {
        todos.push({ id: sequence++, ...todo })
    }

}

module.exports = {
    getAll,
    findById,
    save,
    remove
};