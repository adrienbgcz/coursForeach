const readlineSync = require('readline-sync');

function afficheMenu() {
    console.log('Bonjour, Veuillez choisir un nombre:')
    console.log('1 - exercice 1: chiffre entre 1 et 3 ')
    console.log('2 - exercice 2: nombre entre 10 et 20')
    console.log('3 - exercice 3 - les 10 suivants avec while')
    console.log('4 - exercice 4 - les 10 suivants avec for')
    console.log('5 - exercice 5 - table de multiplication')
    console.log('6 - exercice 6 - somme')
    console.log('7 - exercice 7 - factorielle')
    console.log('8 - exercice 8 -  plus grand (5 valeurs)')
    console.log('9 - exercice 9 - plus grand tant que pas 0')
    console.log('10 - exercice 10 - monnaie')
    console.log('3 - exercice 11 - Aux courses')
    console.log('4 - exercice 12 - fizzbuzz')
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
            exercice8b();
            break;
        }
        case '9': {
            exercice9();
            break;
        }
        case '10': {
            exercice10c();
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

// exercice 1 :Ecrire un algorithme qui demande ?? l???utilisateur un nombre compris entre 1 et 3 jusqu????? ce que la r??ponse convienne.
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
// exercice 2 :Ecrire un algorithme qui demande un nombre compris entre 10 et 20, jusqu????? ce que la r??ponse convienne. En cas de r??ponse sup??rieure ?? 20, on feraappara??tre un message : ?? Plus petit ! ??, et inversement, ?? Plus grand ! ?? si le nombre est inf??rieur ?? 10.
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

// exercice 3 :Ecrire un algorithme qui demande un nombre de d??part, et qui ensuite affiche les dix nombres suivants. 
// Par exemple, si l'utilisateur entre le nombre 17, leprogramme affichera les nombres de 18 ?? 27.
function exercice3() { 

    let number = readlineSync.questionInt("Saisissez un nombre :");
    let i = 0;
    while( i < 10) {
                
        console.log(number + i + 1);

        i = i + 1; //i++;  i += 1;
    }
    console.log("le nombre etait", number);
};

// exercice 4 :R????crire l'algorithme pr??c??dent, en utilisant cette fois l'instruction Pour
function exercice4() { 
    let number = readlineSync.questionInt("Saisissez un nombre :");
    for(let i = 1; i <= 10; i++) {
        
        console.log(number + i);
    }
    console.log("le nombre etait", number);
};

// exercice 5 :Ecrire un algorithme qui demande un nombre de d??part, et qui ensuite ??crit la table de multiplication de ce nombre, pr??sent??e comme suit (cas o?? l'utilisateur entre le nombre 7) :
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

// exercice 6 :Ecrire un algorithme qui demande un nombre de d??part, et qui calcule la somme des entiers jusqu????? ce nombre. 
// Par exemple, si l???on entre 5, le programmedoit calculer :1 + 2 + 3 + 4 + 5 = 15
// NB : on souhaite afficher uniquement le r??sultat, pas la d??composition du calcul.
function exercice6() { 
    let number = readlineSync.questionInt("Saisissez un nombre :");
    let addition = 0;

    for(let i = 1; i<=number ; i++){
        addition += i;
    }
    console.log(addition)
 };

// exercice 7 :Ecrire un algorithme qui demande un nombre de d??part, et qui calcule sa factorielle. NB : la factorielle de 8, not??e 8 !, vaut 1 x 2 x 3 x 4 x 5 x 6 x 7 x 8
function exercice7() { 
    let number = readlineSync.questionInt("Saisissez un nombre :");
    let factorielle = factorielle(number);
    console.log(factorielle)
};

function factorielle(number) {
    let multiplication = 1;

    for (let i = 1; i <= number; i++) {
        multiplication *= i;
    }
    return multiplication;
}

// exercice 8 :Ecrire un algorithme qui demande successivement 20 nombres ?? l???utilisateur, et qui lui dise ensuite quel ??tait le plus grand parmi ces 20 nombres :
// Entrez le nombre num??ro 1 : 12
// Entrez le nombre num??ro 2 : 14
// etc.
// Entrez le nombre num??ro 20 : 6
// Le plus grand de ces nombres est  : 14
function exercice8() { 
    let plusGrand = -1;
    for(let i = 1; i <= 5 ; i++){
        let number = readlineSync.questionInt(`Saisissez le nombre ${i}: `);
        if(number > plusGrand) {
            plusGrand = number;
        }
    }
    console.log(`le plus grand etait ${plusGrand}`);
};

// Modifiez ensuite l???algorithme pour que le programme affiche de surcro??t en quelle position avait ??t?? saisie ce nombre :C?????tait le nombre num??ro 2
function exercice8b() { 
    let plusGrand = -1, position = -1;
    for(let i = 1; i <= 5 ; i++){
        let number = readlineSync.questionInt(`Saisissez le nombre ${i}: `);
        if(number > plusGrand) {
            plusGrand = number;
            position = i
        }
    }
    console.log(`le plus grand etait le nombre ${position} avec la valeur ${plusGrand}`);
};

// exercice 9 :R????crire l???algorithme pr??c??dent, mais cette fois-ci on ne conna??t pas d???avance combien l???utilisateur souhaite saisir de nombres. 
// La saisie des nombres s???arr??te lorsque l???utilisateur entre un z??ro.
function exercice9() { 
    let plusGrand = -1, position = -1;
    let i = 0;
    let number;
    do {
        i ++;
        number = readlineSync.questionInt(`Saisissez le nombre ${i}: `);
        if(number > plusGrand) {
            plusGrand = number;
            position = i
        }
    }
    while(number != 0)
    
    console.log(`le plus grand etait le nombre ${position} avec la valeur ${plusGrand}`);
};

// exercice 10 :Lire la suite des prix (en euros entiers et termin??e par z??ro) des achats d???un client. 
// Calculer la somme qu???il doit, lire la somme qu???il paye, et simuler la remisede la monnaie en affichant les textes "10 Euros", "5 Euros" et "1 Euro" autant de fois qu???il y a de coupures de chaque sorte ?? rendre.
function exercice10() { 
    let prixTotal = 0;
    let prix;
    do {
        prix = readlineSync.questionInt('Saisissez le prix');
        prixTotal += prix;
    }
    while(prix != 0)
    console.log('Total:', prixTotal)
    let sommePaye = readlineSync.questionInt('Combien donnez-vous ?');
    let reste = sommePaye - prixTotal;
    while(reste >= 10){
        console.log('10E');
        reste -= 10;
    }
    while(reste >= 5){
        console.log('5E');
        reste -= 5;
    }
    while(reste >= 1){
        console.log('1E');
        reste -= 1;
    }
};

function exercice10b() { 
    let prixTotal = 0;
    let monnaie10 = 0, monnaie5 = 0, monnaie1 = 0;
    let prix;
    do {
        prix = readlineSync.questionInt('Saisissez le prix');
        prixTotal += prix;
    }
    while(prix != 0)
    console.log('Total:', prixTotal)
    let sommePaye = readlineSync.questionInt('Combien donnez-vous ?');
    let reste = sommePaye - prixTotal;
    while(reste >= 10){
        monnaie10++;
        reste -= 10;
    }
    while(reste >= 5){
        monnaie5++
        reste -= 5;
    }
    monnaie1 = reste;
    console.log('Billets de 10:', monnaie10);
    console.log('Billets de 5:', monnaie5);
    console.log('Pi??ces de 1:', monnaie1);
};

function exercice10c() { 
    let prixTotal = 0;
    let monnaie10 = 0, monnaie5 = 0, monnaie1 = 0;
    let prix;
    do {
        prix = readlineSync.questionInt('Saisissez le prix');
        prixTotal += prix;
    }
    while(prix != 0)
    console.log('Total:', prixTotal)
    let sommePaye = readlineSync.questionInt('Combien donnez-vous ?');
    let reste = sommePaye - prixTotal;
    while(reste >= 10){
        monnaie10++;
        reste -= 10;
    }
    while(reste >= 5){
        monnaie5++
        reste -= 5;
    }
    monnaie1 = reste;
    console.log('Billets de 10:', monnaie10);
    console.log('Billets de 5:', monnaie5);
    console.log('Pi??ces de 1:', monnaie1);

};

function exercice10c() { 
    let prixTotal = 0;
    let monnaie10 = 0, monnaie5 = 0, monnaie1 = 0;
    let prix;
    do {
        prix = readlineSync.questionInt('Saisissez le prix');
        prixTotal += prix;
    }
    while(prix != 0)
    console.log('Total:', prixTotal)
    let sommePaye = readlineSync.questionInt('Combien donnez-vous ?');
    let reste = sommePaye - prixTotal;
    while(reste >= 10){
        monnaie10++;
        reste -= 10;
    }
    if(reste >= 5){
        monnaie5++
        reste -= 5;
    }
    monnaie1 = reste;
    console.log('Billets de 10:', monnaie10);
    console.log('Billets de 5:', monnaie5);
    console.log('Pi??ces de 1:', monnaie1);


};



// exercice 11 :??crire un algorithme qui permette de conna??tre ses chances de gagner au tierc??, quart??, quint?? et autres imp??ts volontaires. 
// On demande ?? l???utilisateur le nombre de chevaux partants, et le nombre de chevaux jou??s. Les deux messages affich??s devront ??tre :
// Dans l???ordre : une chance sur X de gagner
// Dans le d??sordre : une chance sur Y de gagner
// X et Y nous sont donn??s par la formule suivante, 
// si n est le nombre de chevaux partants et p le nombre de chevaux jou??s (on rappelle que le signe ! signifie"factorielle", comme dans l'exercice 7 ci-dessus) :
// X = n ! / (n - p) !
// Y = n ! / (p ! * (n ??? p) !)
function exercice11() {
    const partant = readlineSync.questionInt('Quel est le nombre de chevaux partants ?')
    const joue = readlineSync.questionInt('Quel est le nombre de chevaux jou??s ?')

    const factPartant = factorielle(partant);
    const factPartantJoue = factorielle(partant - joue);

    const x = factPartant/factPartantJoue;
    const y = factPartant / (factorielle(joue) * factPartantJoue);

    console.log(`Dans l'ordre: une chance sur ${x} de gagner`)
    console.log(`Dans le d??sordre: une chance sur ${y} de gagner`)
 };

// exercice 12 : FizzBuzzCr??er en ligne de commande, un programme qui permet de cr??er une liste ?? partir d'un nombre minimal et d'un nombre maximal et de l'afficher. 
// Petite subtilit?? :
// Si le nombre est un multiple de 3, le nombre doit ??tre remplac?? par ?? Fizz??,
// Si le nombre est un multiple de 5, le nombre doit ??tre remplac?? par ?? Buzz??.
// Si le nombre est un multiple de 3 et de 5, le nombre doit ??tre remplac?? par ?? FizzBuzz ??.
// Exemple:
// Bonjour! Veuillez saisir la borne inf??rieur de votre intervalle:1
// Veuillez afficher la borne sup??rieur de votre intervalle :20
// [1, 2, Fizz,  4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11 , Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, Buzz]
function exercice12() { 
    const inf = readlineSync.questionInt('Veuillez saisir la borne inf??rieure de votre intervalle:');
    const sup = readlineSync.questionInt('Veuillez saisir la borne superieure de votre intervalle:');

    let resultat = '['
    for(let i = inf; i <= sup; i++) {
        let affichage = ''
        if(i % 3 == 0){
            affichage += 'Fizz'
        }
        if(i % 5 == 0){
            affichage += 'Buzz'
        }
        resultat += affichage || i;
        
        if(i != sup){
            resultat += ', '
        }
    }
    resultat += ']'
    console.log(resultat);
};