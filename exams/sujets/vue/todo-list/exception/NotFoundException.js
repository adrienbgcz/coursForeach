class NotFoundException extends Error {

    constructor(message) {
        super(message);
        this.name = this.constructor.name;
        this.error = "Not found";
        this.statusCode = 404;
    }
}

module.exports = {
    NotFoundException
}