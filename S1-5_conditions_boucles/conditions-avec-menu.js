const readlineSync = require('readline-sync');

// exercice 1 :
// Ecrire un algorithme qui demande un nombre à l’utilisateur, et l’informe ensuite si ce nombre est positif ou négatif (on laisse de côté le cas où le nombre vaut
// zéro).
// function exercice1() {
//     const nombre = readlineSync.question('Veuillez saisir un nombre');
//     if (nombre < 0) {
//         console.log(nombre, 'est NEGATIF');
//     } else {
//         console.log(nombre, 'est POSITIF');
//     }
// }

function exercice1() {
    const nombre = readlineSync.question('Veuillez saisir un nombre :');
    if (isNaN(nombre)) {
        console.log("vous n'avez pas saisi un nombre"); // isNaN(nombre) -> true
    }
    else {
        // isNaN(nombre) -> false
        if (nombre > 0) {
            console.log('le nombre est positif'); // isNaN(nombre) -> false && nombre > 0 -> true
        }
        else {
            console.log('le nombre est négatif'); // isNaN(nombre) -> false && nombre > 0 -> false 
        }
    }
}


function exercice2() {
    let firstNumber = readlineSync.question('Donner un premier nombre : ');
    let secondNumber = readlineSync.question('Donner un second nombre : ');

    exercice2a(firstNumber, secondNumber);
    exercice2a(5, 6);
    exercice2b(firstNumber, secondNumber);

}

function exercice2a(firstNumber, secondNumber) {

    if (firstNumber == 0 || secondNumber == 0) {
        console.log('Le produit des 2 nombres est nul');
    } else if ((firstNumber > 0 && secondNumber > 0) || (firstNumber < 0 && secondNumber < 0)) {
        console.log('Le produit des 2 nombres est positif');
    } else {
        console.log('Le produit des 2 nombres est négatif');
    }
}

function exercice2b(number1, number2) {

    const produit = number1 * number2;
    if (produit == 0) {
        console.log('Le produit des 2 nombres est nul');
    } else if (produit > 0) {
        console.log('Le produit des 2 nombres est positif');
    } else {
        console.log('Le produit des 2 nombres est négatif');
    }
}

// exercice 3 :
// Ecrire un algorithme qui demande trois noms à l’utilisateur et l’informe ensuite s’ils sont rangés ou non dans l’ordre alphabétique.
function exercice3_test() {

    let firstWord = readlineSync.question('Donner un premier mot : ');
    let secondWord = readlineSync.question('Donner un second mot : ');

    if (isNaN(firstWord) && isNaN(secondWord)) {
        if (firstWord.toUpperCase() > secondWord.toUpperCase()) {
            // if(firstWord > secondWord) {
            console.log(secondWord, 'est avant', firstWord)
        } else {
            console.log(firstWord, 'est avant', secondWord)
        }
    }
    console.log(firstWord.toUpperCase(), secondWord.toUpperCase())
    console.log(firstWord, secondWord)

}

function exercice3b() {

    let firstWord = readlineSync.question('Donner un premier mot : ');
    let secondWord = readlineSync.question('Donner un second mot : ');

    if (isNaN(firstWord) && isNaN(secondWord)) {
        if (firstWord.localeCompare(secondWord) < 0) {
            console.log(secondWord, 'est avant', firstWord)
        } else {
            console.log(firstWord, 'est avant', secondWord)
        }
    }
    console.log(firstWord.toUpperCase(), secondWord.toUpperCase())
    console.log(firstWord, secondWord)

}

function exercice3() {

    let firstWord = readlineSync.question('Donner un premier mot : ');
    let secondWord = readlineSync.question('Donner un second mot : ');
    let thirdWord = readlineSync.question('Donner un troisième mot : ');

    //if (firstWord.localeCompare(secondWord) < 0 && secondWord.localeCompare(thirdWord) < 0) {
    if (firstWord.toUpperCase() < secondWord.toUpperCase() && secondWord.toUpperCase() < thirdWord.toUpperCase()) {
        console.log('Bon ordre');

    } else {
        console.log('Mauvais ordre');

    }
}

// exercice 4 :
// Ecrire un algorithme qui demande un nombre à l’utilisateur, et l’informe ensuite si ce nombre est positif ou négatif (on inclut cette fois le traitement du cas où
// le nombre vaut zéro).
function exercice4() {

    const nombre = readlineSync.question('Veuillez saisir un nombre :');
    if (isNaN(nombre)) {
        console.log("vous n'avez pas saisi un nombre"); // isNaN(nombre) -> true
    }
    else {
        if (nombre == 0) {
            console.log('le nombre vaut zéro');
        }
        else if (nombre > 0) {
            console.log('le nombre est positif'); // isNaN(nombre) -> false && nombre > 0 -> true
        }
        else {
            console.log('le nombre est négatif'); // isNaN(nombre) -> false && nombre > 0 -> false 
        }
    }
}

function testString() {
    const qqch = "               Aurore,    hhhhhhhh, jeudis,e              ";//readlineSync.question('Veuillez saisir qqch :');
    console.log('ORIGINALE: ', qqch);
    console.log('LENGTH: ', qqch.length);
    console.log('LOWER: ', qqch.toLowerCase());
    console.log('UPPER: ', qqch.toUpperCase());
    console.log('REPLACE:', qqch.replace('e', 'é'));
    console.log('SPLIT: ', qqch.split(','));
    console.log('CHAR AT: ',qqch.charAt(5));
    console.log('TRIM: ',qqch.trim());


}

// exercice 5 :
// Ecrire un algorithme qui demande deux nombres à l’utilisateur et l’informe ensuite si le produit est négatif ou positif (on inclut cette fois le traitement du cas
// où le produit peut être nul). Attention toutefois, on ne doit pas calculer le produit !

// exercice 6 :
// Ecrire un algorithme qui demande l’âge d’un enfant à l’utilisateur. Ensuite, il l’informe de sa catégorie : "Poussin" de 6 à 7 ans "Pupille" de 8 à 9 ans
// "Minime" de 10 à 11 ans "Cadet" après 12 ans Peut-on concevoir plusieurs algorithmes équivalents menant à ce résultat ?
function exercice6(){
    const age = readlineSync.question('Veuillez saisir l\'âge de votre enfant :');

    if (isNaN(age)) {
        console.log("vous n'avez pas saisi un nombre"); // isNaN(nombre) -> true
    }
    else {
        if(age>=12){
            console.log('CADET')
        } else if(age>=10){
            console.log('MINIME')
        } else if(age>=8){
            console.log('PUPILLE')
        } else if(age>=6){
            console.log('POUSSIN')
        } else {
            console.log('TROP JEUNE')
        }

        // if(age<6){
        //     console.log('TROP JEUNE')
        // } else if(age<8){
        //     console.log('POUSSIN')
        // } else if(age<10){
        //     console.log('PUPILLE')
        // } else if(age<12){
        //     console.log('MINIME')
        // } else {
        //     console.log('CADET')
        // }
    }
}


function isBissextile(annee) {
    return annee % 400 == 0 || (annee % 4 == 0 && annee % 100 !=0);
}

// exercice 7 :
// Ecrire un algorithme qui demande un mois (nombre entre 1 et 12), une année et affiche le nombre de jour de ce mois.
// indication: L’année est bissextile si elle est divisible par quatre. Toutefois, les années divisibles par 100 ne sont pas bissextiles, mais les années divisibles
// par 400 le sont.

function exercice7 () {
    const mois = readlineSync.question('Veuillez saisir un mois :');
    
    if(mois > 12) {
        console.log('compris entre 1 et 12 !');
    }
    else {
        const annee = readlineSync.question('Veuillez saisir une annee :');

        if(mois == 2){
            if(isBissextile(annee)){
                console.log(29);
            }
            else{
                console.log(28);
            }
            
        } else {
            if(mois == 4 && mois == 6 && mois == 9 && mois == 11){
                console.log(30);
            } 
            else {
                console.log(31);
            }
        }
    }

    // const mois = readlineSync.question('Veuillez saisir un mois :');
    
    // if(mois > 12) {
    //     console.log('compris entre 1 et 12 !');
    // }
    // else {
    //     const annee = readlineSync.question('Veuillez saisir une annee :');

    //     switch(mois) {
    //         case "2": {
    //             if(isBissextile(annee)){
    //                 console.log(29);
    //             }else{
    //                 console.log(28);
    //             }
    //             break;
    //         }
    //         case "4":
    //         case "6":
    //         case "9":
    //         case "11": {
    //             console.log(30);
    //             break;
    //         }
    //         case "1":
    //         case "3":
    //         case "5":
    //         case "7":
    //         case "8":
    //         case "10":
    //         case "12": {
    //             console.log(31);
    //             break;
    //         }
    //         default: {
    //             console.log("ce n'est pas un numéro valide");
    //         }
    // }
    
}


// exercice 8 :
// Écrire un algorithme qui simule le jeu de pile ou face.
// Déroulement du jeu : l'utilisateur saisit la lettre P pour pile, et F pour face, puis valide sa saisie . Le programme, lui, choisit aléatoirement un nombre entre 0
// et 1 (0 pour pile, 1 pour face).
// Le programme affiche un message : gagné ou perdu.
// indication: regarder la documentation mdn de Math.random()
// exercice 9 :
// L'utilisateur saisit la date au format jj/mm/aaaa, et le programme affiche la date avec le mois en lettres.
// Exemple : si l'utilisateur saisit 15/10/2020, alors le programme affiche : Aujourd'hui, nous sommes le 15 Octobre 2020.
// exercice 10 :
// Écrire un algorithme qui propose un menu affiché à l'écran, et qui, en fonction du choix fait par l'utilisateur, effectue soit la somme, soit le produit, soit la
// moyenne de 2 nombres saisis.



function afficheMenu() {
    console.log('Bonjour, Veuillez choisir un nombre:')
    console.log('1 - exercice 1: affichage positif / negatif')
    console.log('2 - exercice 2')
    console.log('3 - exercice 3')
    console.log('4 - exercice 4')
    console.log('0 - quitter')
    console.log('\n')
}

let quitter = false;
let nombreExercice = 0;
do {

    afficheMenu();
    const elementMenu = readlineSync.question('?');

    switch(elementMenu) {
        case '1': {
            exercice1();
            nombreExercice++;
            break;
        }
        case '2': {
            exercice2();
            nombreExercice++;
            break;
        }
        case '3': {
            exercice3();
            nombreExercice++;
            break;
        }
        case '4': {
            exercice4();
            nombreExercice++;
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
while(!quitter);

console.log("Au revoir, vous avez executer", nombreExercice, "exercices");

// exercice1();
// exercice2();
// exercice3();
// exercice4();
// testString();
//exercice7();