const { NotFoundException } = require('../exception/NotFoundException')

const etiquettes = [
    {
        id: 1,
        nom: 'patron'
    },
    {
        id: 2,
        nom: 'boulot'
    }
]

let sequence = 3;

function getAll() {
    return etiquettes
}

function findById(id){
    const etiquette = [...etiquettes].find((etq) => isEtiquette(etq, id))
    if(!etiquette) {
        throw new NotFoundException(`Etiquette with id ${id} not exist`)
    }
    return etiquette;
}

function remove(id){
    const indexEtiquetteToDelete = etiquettes.findIndex((etq) => isEtiquette(etq, id));
    if(indexEtiquetteToDelete < 0){
        throw new NotFoundException(`Etiquette with id ${id} not exist`)
    }
    etiquettes.splice(indexEtiquetteToDelete, 1)
}

function isEtiquette(etiquette, id){
    return etiquette.id == id
}

function save(etiquette, id) {
    if(id) {
        const indexEtiquetteToUpdate = etiquettes.findIndex((etq) => isEtiquette(etq, id));
        if(indexEtiquetteToUpdate < 0){
            throw new NotFoundException(`Etiquette with id ${id} not exist`)
        } else {
            etiquettes[indexEtiquetteToUpdate] = {id, ...etiquette}
        }
    } else {
        etiquettes.push({ id: sequence++, ...etiquette })
    }

}

module.exports = {
    getAll,
    findById,
    save,
    remove,
    etiquettes
};