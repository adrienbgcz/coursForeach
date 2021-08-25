const { celebrate, Joi, Segments } = require('celebrate');

const bodyCreate = {
    [Segments.BODY]: Joi.object().keys({
        nom: Joi.string().required(),
        description: Joi.string().required(),
        termine: Joi.boolean().default(false),
        date_fin: Joi.date().iso(),
        etiquettes: Joi.array().items(
            Joi.object().keys({
                nom: Joi.string().required(),
                id: Joi.number().integer().required()
            })
        ).default([])
    })
}

const bodyUpdate = {
    [Segments.BODY]: Joi.object().keys({
        nom: Joi.string(),
        description: Joi.string(),
        termine: Joi.boolean(),
        date_fin: Joi.date().iso(),
        etiquettes: Joi.array().items(
            Joi.object().keys({
                nom: Joi.string().required(),
                id: Joi.number().integer().required()
            })
        )
    })
}

const params = {
    [Segments.PARAMS]: Joi.object().keys({
        id: Joi.number().integer()
    }),
}

const query = {
    [Segments.QUERY]: Joi.object().keys({
        termine: Joi.boolean(),
        etiquettes: Joi.alternatives().try(Joi.number().integer(), Joi.array().items(Joi.number().integer()))
    })
}

const validateTodoBodyCreate = celebrate(bodyCreate)
const validateTodoParams = celebrate(params)
const validateTodoBodyCreateAndParams = celebrate({...bodyCreate, ...params})
const validateTodoBodyUpdateAndParams = celebrate({...bodyUpdate, ...params})
const validateTodoQuery = celebrate(query)


module.exports = {
    validateTodoBodyCreate,
    validateTodoParams,
    validateTodoBodyUpdateAndParams,
    validateTodoBodyCreateAndParams,
    validateTodoQuery,
}