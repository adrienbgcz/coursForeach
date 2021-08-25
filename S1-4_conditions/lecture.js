const readlineSync = require('readline-sync');

// exemple
// let nom = readlineSync.question('qui es-tu ?');
// console.log('je suis', nom);

function exercice1() {
    console.log("EXERCICE 1")
    // declaration des variables utiles
    let val;
    let double;

    // traitement
    val = 231;
    double = val * 2;

    // resultat
    console.log('val:', val);
    console.log('double: ', double);
}

function carre(toto) {
    let carreNombre = toto * toto;
    console.log(carreNombre);
}

function exercice2() {
    console.log("EXERCICE 2")
    let nombre = readlineSync.question('Donnez un nombre: ');

    // traitement
    carre(nombre);
}

function exercice3() {
    const prenom = readlineSync.question('Quel est votre prénom');
    console.log('Bonjour,', prenom, '!')
}

exercice1();
exercice2();
exercice3();



// function carre(toto) {
//     let carreNombre = toto * toto;
//     console.log(carreNombre);
//     return carreNombre;
// }

// function exercice2() {
//     console.log("EXERCICE 2")
//     let nombre = readlineSync.question('Donnez un nombre: ');

//     // traitement
//     return carre(nombre);

// }

// function exercice2b(nombre) {
//     console.log("EXERCICE 2b")
//     let double = nombre * 2;
//     console.log(double)
// }


// const carreUtilisateur = exercice2();
// exercice2b(carreUtilisateur);