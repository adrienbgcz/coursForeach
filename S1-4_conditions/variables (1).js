
function exercice1() {

    console.log("EXERCICE 1")
    let a = 1;
    const b = a + 3;
    a = 3;

    console.log("A =", a);
    console.log("B =", b);
    
    console.log("****************\n")

}

function exercice2() {
    console.log("EXERCICE 2")

    let a = 5, b = 3, c;
    c = a + b;
    a = 2;
    c = b - a;

    console.log("A =", a);
    console.log("B =", b);
    console.log("C =", c);

    console.log("****************\n")
}

function exercice3() {
    console.log("EXERCICE 3")

    let a = 5, b;
    b = a + 4;
    a = a + 1;
    b = a - 4; 

    console.log("A =", a);
    console.log("B =", b);

    console.log("****************\n")
}

// console.log("EXERCICE 4")

// let a = 3;
// let b = 10;
// let c = a + b;
// b = a + b;
// a = c;

// console.log("A =", a);
// console.log("B =", b);
// console.log("C =", c);

// console.log("****************\n")

// console.log("EXERCICE 5")

// let a = 5;
// let b = 2;
// a = b;
// b = a;

// console.log("A =", a);
// console.log("B =", b);

// console.log("****************\n")

// console.log("EXERCICE 5b")

// let a = 5;
// let b = 2;
// b = a;
// a = b;

// console.log("A =", a);
// console.log("B =", b);

// console.log("****************\n")


// console.log("EXERCICE 6")

// let a = 5;
// let b = 10;
// // let temp = a;
// // a = b;
// // b = temp;

// let temp = b;
// b = a;
// a = temp;


// console.log("A =", a); // A = 10
// console.log("B =", b); // B = 5

// console.log("****************\n")

function exercice7() {
    console.log("EXERCICE 7")

    let a = 5;
    let b = 10;
    let c = 15;
    // let temp = a;
    // a = b;
    // b = temp;

    let temp = b;
    b = a;
    a = c
    c = temp;


    console.log("A =", a); // A = 15
    console.log("B =", b); // B = 5
    console.log("C =", c); // C = 10


    console.log("****************\n")

}

// exercice1();
// exercice2();
// exercice3();

// console.log(a)



//version 1
function testAddition() {
    const a = 3;
    const b = 4;
    
    const somme = a + b;
    console.log(somme);
    
    const c = "8";
    const d = "2";
    
    const somme2 = c + d;
    console.log(somme2);
    
    const e = false;
    const f = true;
    
    const somme3 = e + f;
    console.log(somme3);
}

testAddition();

//version 2
function testAddition2(a, b) {   
    const somme = a + b;
    console.log(somme);
}

testAddition2(3, 4);
testAddition2("8", "2");
testAddition2(false, true);


function exempleDeclaration() {
    const toto = 3;
    console.log(toto);
    let titi;
    console.log(titi);
    titi = 5;
    console.log(titi);
    titi = 6;
    console.log(titi);
    
}
