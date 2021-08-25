const readlineSync = require('readline-sync');

function exDoWhile() {

    let nombre;
    let somme = 0;

    do {
    
        nombre = readlineSync.question("Veuillez saisir un nombre");
        if(isNaN(nombre)){
            console.log("Ce n'est pas un nombre")
        } 
        else {
            somme = somme + Number.parseInt(nombre);
        }

    }
    while(nombre != 0)

    console.log("c'est fini, vous avez saisi zéro, en tout vous avez saisi", somme)
}




function exWhile() {

    let nombre = -1;
    let somme = 0;

    while(nombre != 0) {

        nombre = readlineSync.question("Veuillez saisir un nombre");

        if(isNaN(nombre)){
            console.log("Ce n'est pas un nombre")
        } 
        else {
            somme = somme + Number.parseInt(nombre);
        }

    }

    console.log("c'est fini, vous avez saisi zéro, en tout vous avez saisi", somme)
}

// i++ -> i = i + 1





function exFor() {

    let nombre;
    let somme = 0;

    for(let i = 0; i<2; i++){

        nombre = readlineSync.question("Veuillez saisir un nombre");

        if(isNaN(nombre)){
            console.log("Ce n'est pas un nombre")
        } 
        else {
            somme = somme + Number.parseInt(nombre);
        }
    }

    console.log("c'est fini, vous avez saisi vos", i, "chiffres, en tout vous avez saisi", somme)

}

// exDoWhile();
// exWhile();
exFor();


