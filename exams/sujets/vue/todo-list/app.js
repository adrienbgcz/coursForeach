const express = require('express')
const app = express()
const port = 3000
const cors = require("cors")

const { errors } = require('celebrate');

const etiquettes = require('./router/etiquettes.router')
const todos = require('./router/todos.router')

// middleware
app.use(express.json())
app.use(cors()); 


app.get("/", (req, res) => {
    res.send("BIENVENUE SUR L'API TODO-LIST!!\n\n\n" +
        "ROUTES DISPONIBLES: " +
        "\n\n - GET /etiquettes" +
        "\n - GET /etiquettes/{id}" +
        "\n - POST /etiquettes" +
        "\n - PUT /etiquettes/{id}" +
        "\n - DELETE /etiquettes/{id}" +
        "\n\n - GET /todos    | Paramètres possibles : termine -> true/false et etiquettes -> id de l'etiquette" +
        "\n - GET /todos/{id}" +
        "\n - POST /todos | creation d\'un nouveau todo" +
        "\n - PUT /todos/{id} | remplace un todo avec le todo du body" +
        "\n - PATCH /todos/{id} | modifie un todo avec le todo du body"
);
});

app.use('/etiquettes', etiquettes)
app.use('/todos', todos)

app.use(errors());
app.use((err, req, res, next) => {
    if(err.name == 'NotFoundException'){
        res.status(404).json({ statusCode: err.statusCode, error: err.error, message: `${err.name}: ${err.message}` })
    }
    else {
        res.status(500).json({ statusCode: 500, error: err.name, message: err.message || 'Internal server error'})
    }
})
app.listen(port, () => {
    console.log(`Todo-list app listening at http://localhost:${port}`)
})