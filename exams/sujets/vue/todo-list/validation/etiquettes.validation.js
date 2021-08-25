const { celebrate, Joi, Segments } = require('celebrate');

const body = {
    [Segments.BODY]: Joi.object().keys({
        nom: Joi.string().required()
    })
}

const params = {
    [Segments.PARAMS]: Joi.object().keys({
        id: Joi.number().integer()
    }),
}

const validateEtiquetteBody = celebrate(body)
const validateEtiquetteParams = celebrate(params)
const validateEtiquetteBodyAndParams = celebrate({...body, ...params})


module.exports = {
    validateEtiquetteBody, validateEtiquetteParams, validateEtiquetteBodyAndParams
}