const readlineSync = require('readline-sync');

//demander un nombre à l'utilisateur et indique si il est pair ou impair en répondant "le nombre 3 impair" ou "le nombre 2 est pair".

function exercice0() {
    // demander un nombre à  lutilisateur
    const nombre = readlineSync.question('Veuillez saisir un nombre :');

    // regarder s'il est pair ou imair
    // const pair = nombre % 2;
    // if(pair === 0) {
    //     console.log('le nombre', nombre, 'est pair')
    // } else {
    //     console.log('le nombre', nombre, 'est impair')
    // }

    // const impair = nombre % 2;
    // if(impair) {
    //     console.log('le nombre', nombre, 'est impair')
    // } else {
    //     console.log('le nombre', nombre, 'est pair')
    // }

    const impair = nombre % 2;
    if(!impair) {
        console.log('le nombre', nombre, 'est pair')
    } else {
        console.log('le nombre', nombre, 'est impair')
    }
}

function estVrai(qqch) {
    qqch = !!qqch;
    if(qqch == true){
        console.log(qqch, 'est vrai')
    } else {
        console.log(qqch, 'est faux')
    }
}

function estVraiET(qqch, truc) {
    if(qqch && truc){ //qqch ET truc sont tous les 2 vrais
        console.log(qqch, 'est vrai')
    } else { // tru ou qcch ou les 2 sont faux
        console.log(qqch, 'est faux')
    }
}

function estVraiOU(qqch, truc) {
    if(qqch || truc){ //qqch OU truc, l'un des 2 est vrai ou les 2
        console.log(qqch, 'est vrai')
    } else {   // truc et qqch sont tous les 2 faux
        console.log(qqch, 'est faux')
    }
}

// if(qqch === true){ -> la valeur doit etre egale à true
// if(qqch == true){ -> la valeur doit etre booleen est vrai
// if(!!qqch == true){ -> le !! a transformé le paramètre en un booléen quelque soit son type.


function exerciceBoolean() {
    // demander à  lutilisateur un truc
    estVrai(0);
    estVrai(1);
    estVrai(10);
    estVrai(-10);
    estVrai(-10.5);
    estVrai('Bonjour');
    estVrai('');
    estVrai();
    estVrai(true);
    estVrai(false); 
}

// exerciceBoolean();