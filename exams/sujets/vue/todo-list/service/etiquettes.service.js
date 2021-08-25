const { getAll, findById, save, remove } = require("../data/etiquettes.data")

function getAllEtiquettes() {
    return getAll()
}

function getEtiquetteById(id) {
    return findById(id)
}

function saveEtiquette(etiquette, id){
    return save(etiquette, id)
}

function deleteEtiquette(id){
    return remove(id)
}

module.exports = {
    getAllEtiquettes,
    getEtiquetteById,
    saveEtiquette,
    deleteEtiquette
}