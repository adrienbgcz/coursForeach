const readlineSync = require('readline-sync');

function afficheMenu() {
    console.log('Bonjour, Veuillez choisir un nombre:')
    console.log('1 - exercice 1: inversion condition ')
    console.log('2 - exercice 2: heure + 1 minute')
    console.log('3 - exercice 3 - heure + 1 seconde')
    console.log('4 - exercice 4 - prix des photocopies')
    console.log('5 - exercice 5 - impots')
    console.log('6 - exercice 6 - election')
    console.log('7 - exercice 7 - assurance')
    console.log('8 - exercice 8 -  date valide')
    console.log('0 - quitter')
    console.log('\n')
}

let quitter = false;
do {

    afficheMenu();
    const elementMenu = readlineSync.question('?');

    switch (elementMenu) {
        case '1': {
            exercice1();
            break;
        }
        case '2': {
            exercice2();
            break;
        }
        case '3': {
            exercice3();
            break;
        }
        case '4': {
            exercice4();
            break;
        }
        case '5': {
            exercice5();
            break;
        }
        case '6': {
            exercice6();
            break;
        }
        case '7': {
            exercice7();
            break;
        }
        case '8': {
            exercice8();
            break;
        }
        case '0': {
            quitter = true;
            break;
        }
        default: {
            console.log("votre saisie ne correspond pas au menu");
            break;
        }
    }
}
while (!quitter);


function algo1(tutu, tata, toto){
    if(tutu > toto + 4 || tata === "OK"){
        tutu += 1;
    } 
    else {
        tutu -= 1
    }
    console.log(tutu)
}

// IF equivalent avec inversion de condition
// if(i == 1){
//     //condition vrai
//     console.log('HAHAH')
// }
// else {
//     //condition fausse
//     console.log('OHOH')
// }

// if(i != 1){
//     //condition vrai
//     console.log('OHOH')
// }
// else {
//     //condition fausse
//     console.log('HAHAH')
// }
function algo2(tutu, tata, toto){

    // A || B
    //!(A || B) 
    // A && B -> faux
    // !A && !B -> ok, loi de Morgan
    
    if(tutu <= toto + 4 && tata !== "OK"){
        tutu -= 1;
    } 
    else {
        tutu += 1
    }
    console.log(tutu)


}

function exercice1(){
let tutu, tata, toto;
    tutu = readlineSync.questionInt("Veuillez saisir tutu (nombre): ");
    toto = readlineSync.questionInt("Veuillez saisir toto (nombre): ");
    tata = readlineSync.question("Veuillez saisir tata: ");

    algo1(tutu, tata, toto);
    algo2(tutu, tata, toto);
    
}


function exercice2() {
    let heures = readlineSync.questionInt("Veuillez saisir les heures: ");
    let minutes = readlineSync.questionInt("Veuillez saisir les minutes: ");

    minutes += 1;
    if(minutes == 60){
        minutes = 0;
        heures += 1;
        if(heures == 24){
            heures = 0
        }
    }
    console.log(`Dans une minute, il sera ${heures} heures et ${minutes} minutes`);
}

function exercice2b() {
    let heures = readlineSync.questionInt("Veuillez saisir les heures: ");
    let minutes = readlineSync.questionInt("Veuillez saisir les minutes: ");

    if(minutes == 59){
        minutes = 0;
        if(heures == 23){
            heures = 0;
        }else{
            heures += 1;
        }
    } else {
        minutes += 1;
    }
    console.log(`Dans une minute, il sera ${heures} heures et ${minutes} minutes`);
}

function exercice4() {
    const nbPhotocopie = readlineSync.questionInt("Veuillez saisir le nombre de photocopie: ");
    let facture;

    if(nbPhotocopie <= 10){
        facture = nbPhotocopie * 0.1;
    }else if (nbPhotocopie <=30){
        facture = (10 * 0.1) + ((nbPhotocopie - 10) * 0.09);
    } else {
        facture = (10 * 0.1) + (20 * 0.09) + ((nbPhotocopie - 30) * 0.08)
    }
    console.log(`Votre facture est de ${Math.round(facture * 100)/100} euros`);
}