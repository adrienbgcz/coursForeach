const readlineSync = require('readline-sync');

function afficheMenu() {
    console.log('Bonjour, Veuillez choisir un nombre:')
    console.log('1 - exercice 1: chiffre entre 1 et 3 ')
    console.log('2 - exercice 2: nombre entre 10 et 20')
    console.log('3 - exercice 3 - les 10 suivants avec while')
    console.log('4 - exercice 4 - les 10 suivants avec for')
    console.log('5 - exercice 5 - table de multiplication')
    // console.log('4 - exercice 6')
    // console.log('3 - exercice 7')
    // console.log('4 - exercice 8')
    // console.log('3 - exercice 9')
    // console.log('4 - exercice 10')
    // console.log('3 - exercice 11')
    // console.log('4 - exercice 12')
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
        case '9': {
            exercice9();
            break;
        }
        case '10': {
            exercice10();
            break;
        }
        case '11': {
            exercice11();
            break;
        }
        case '12': {
            exercice12();
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

// exercice 1 :Ecrire un algorithme qui demande à l’utilisateur un nombre compris entre 1 et 3 jusqu’à ce que la réponse convienne.
function exercice1() {

    let number;
    do {
        number = readlineSync.question('Saisir un nombre entre 1 et 3 : ');
        if (isNaN(number)) {
            console.log('Vous devez saisir un nombre');
        }
    } while (isNaN(number) || number < 1 || number > 3);

    // } while (isNaN(number) || number < 1 || number > 3); // A || ( !A && (B || C) )

    console.log('OK');
};
// exercice 2 :Ecrire un algorithme qui demande un nombre compris entre 10 et 20, jusqu’à ce que la réponse convienne. En cas de réponse supérieure à 20, on feraapparaître un message : « Plus petit ! », et inversement, « Plus grand ! » si le nombre est inférieur à 10.
function exercice2() { 
    let number;
    do {
        number = readlineSync.questionInt("Saisissez un nombre entre 10 et 20 :", {limitMessage: "Ce n'est pas un nombre..."});
        if(number < 10){
            console.log('Plus grand !')
        }
        else if(number > 20){
            console.log('Plus petit !')
        }
    }
    while(number < 10 || number > 20 );
    
}

// exercice 3 :Ecrire un algorithme qui demande un nombre de départ, et qui ensuite affiche les dix nombres suivants. 
// Par exemple, si l'utilisateur entre le nombre 17, leprogramme affichera les nombres de 18 à 27.
function exercice3() { 

    let number = readlineSync.questionInt("Saisissez un nombre :");
    let i = 0;
    while( i < 10) {
        
        number = number + 1; // number += 1;
        console.log(number);
        
        //console.log(number + i + 1);

        i = i + 1; //i++;  i += 1;
    }
    console.log("le nombre etait", number);
};

// exercice 4 :Réécrire l'algorithme précédent, en utilisant cette fois l'instruction Pour
function exercice4() { 
    let number = readlineSync.questionInt("Saisissez un nombre :");
    for(let i = 0; i < 10; i++) {
        
        number = number + 1; // number += 1;
        console.log(number);
        
        //console.log(number + i + 1);
    }
    console.log("le nombre etait", number);
};

// exercice 5 :Ecrire un algorithme qui demande un nombre de départ, et qui ensuite écrit la table de multiplication de ce nombre, présentée comme suit (cas où l'utilisateur entre le nombre 7) :
// Table de 7 :
// 7 x 1 = 7
// 7 x 2 = 14
// 7 x 3 = 21
// ...
// 7 x 10 = 70
function exercice5() { 
    let number = readlineSync.questionInt("Saisissez un nombre :");
    console.log(`Table de ${number}:`) //console.log("Table de " + number + ":") 
    for(let i = 1; i <= 10; i++) {
        console.log(number, 'x', i, '=', number * i);
    }
};

// exercice 6 :Ecrire un algorithme qui demande un nombre de départ, et qui calcule la somme des entiers jusqu’à ce nombre. Par exemple, si l’on entre 5, le programmedoit calculer :1 + 2 + 3 + 4 + 5 = 15NB : on souhaite afficher uniquement le résultat, pas la décomposition du calcul.
function exercice6() { };

// exercice 7 :Ecrire un algorithme qui demande un nombre de départ, et qui calcule sa factorielle. NB : la factorielle de 8, notée 8 !, vaut 1 x 2 x 3 x 4 x 5 x 6 x 7 x 8
function exercice7() { };

// exercice 8 :Ecrire un algorithme qui demande successivement 20 nombres à l’utilisateur, et qui lui dise ensuite quel était le plus grand parmi ces 20 nombres :
//Entrez le nombre numéro 1 : 12
//Entrez le nombre numéro 2 : 14
//etc.Entrez le nombre numéro 20 : 6
//Le plus grand de ces nombres est  : 14
//Modifiez ensuite l’algorithme pour que le programme affiche de surcroît en quelle position avait été saisie ce nombre :C’était le nombre numéro 2
function exercice8() { };

// exercice 9 :Réécrire l’algorithme précédent, mais cette fois-ci on ne connaît pas d’avance combien l’utilisateur souhaite saisir de nombres. La saisie des nombress’arrête lorsque l’utilisateur entre un zéro.
function exercice9() { };

// exercice 10 :Lire la suite des prix (en euros entiers et terminée par zéro) des achats d’un client. Calculer la somme qu’il doit, lire la somme qu’il paye, et simuler la remisede la monnaie en affichant les textes "10 Euros", "5 Euros" et "1 Euro" autant de fois qu’il y a de coupures de chaque sorte à rendre.exercice 11 :Écrire un algorithme qui permette de connaître ses chances de gagner au tiercé, quarté, quinté et autres impôts volontaires. On demande à l’utilisateur lenombre de chevaux partants, et le nombre de chevaux joués. Les deux messages affichés devront être :Dans l’ordre : une chance sur X de gagnerDans le désordre : une chance sur Y de gagner
// X et Y nous sont donnés par la formule suivante, si n est le nombre de chevaux partants et p le nombre de chevaux joués (on rappelle que le signe ! signifie"factorielle", comme dans l'exercice 7 ci-dessus) :X = n ! / (n - p) !Y = n ! / (p ! * (n – p) !)NB : cet algorithme peut être écrit d’une manière simple, mais relativement peu performante. Ses performances peuvent être singulièrement augmentéespar une petite astuce. Vous commencerez par écrire la manière la plus simple, puis vous identifierez le problème, et écrirez une deuxième versionpermettant de le résoudre.
//exercice 12 : FizzBuzzCréer en ligne de commande, un programme qui permet de créer une liste à partir d'un nombre minimal et d'un nombre maximal et de l'afficher. Petitesubtilité :Si le nombre est un multiple de 3, le nombre doit être remplacé par « Fizz»,Si le nombre est un multiple de 5, le nombre doit être remplacé par « Buzz».Si le nombre est un multiple de 3 et de 5, le nombre doit être remplacé par « FizzBuzz ».Exemple:Bonjour! Veuillez saisir la borne inférieur de votre intervalle:1Veuillez afficher la borne supérieur de votre intervalle :20[1, 2, Fizz,  4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11 , Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, Buzz]

function exercice10() { };
function exercice11() { };
function exercice12() { };