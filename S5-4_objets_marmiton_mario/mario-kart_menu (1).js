const readlineSync = require('readline-sync');

const courses = [
    {
        id: 1,
        nom: 'course A'
    },
    {
        id: 2,
        nom: 'course B'
    },
];

const participants = [
    {
        id: 1,
        nom: 'Yoshi'
    },
    {
        id: 2,
        nom: 'Peach'
    },
    {
        id: 3,
        nom: 'Mario'
    },
    {
        id: 4,
        nom: 'Luigi'
    }, {
        id: 5,
        nom: 'Toas'
    },
    {
        id: 6,
        nom: 'Bowser'
    },
];

const pointsClassement = [
    {
        id: 1,
        position: 1,
        points: 6
    },
    {
        id: 2,
        position: 2,
        points: 4
    },
    {
        id: 3,
        position: 3,
        points: 3
    },
    {
        id: 4,
        position: 4,
        points: 2
    },
    {
        id: 5,
        position: 5,
        points: 1
    },
    {
        id: 6,
        position: 6,
        points: 0
    },
];


function afficheMenu() {
    console.log("\n\nQue souhaitez-vous faire ? \n\n" +
        "\t1 - Afficher le tournoi\n" +
        "\t2 - Afficher la liste des courses \n" +
        "\t3 - Afficher les participants\n" +
        "\t4 - Lister les points des participants\n" +
        "\t5 - Renseigner les resultats d'une courses\n" +
        "\t6 - Afficher le classement\n" +
        "\t7 - Afficher le détail des résultats d'un participant choisi\n" +
        "\t0 - Quitter\n")
}

console.log("\n\nBienvenu sur l'application de gestion de notre tournoi de mario kart \n\n");

let quitter = false;

const tournoi = {
    date: new Date(),
    courses: []
};
       
while (!quitter) {

    afficheMenu()

    const reponse = readlineSync.questionInt();
    console.log('\n');

    switch (reponse) {
        case 1: {
            afficherTournoi(tournoi, courses, participants);
            break;
        }
        case 2: {
            afficherCourses(courses);
            break
        }
        case 3: {
            afficherParticipants(participants);
            break
        }
        case 4: {
            listerPointsParticipants(tournoi);
            // Yoshi: 15 points
            break
        }
        case 5: {
            ajouterResultatCourse(tournoi, participants, pointsClassement, courses);
            //Demander quel courses, demander pour chaque participant sa position
            break
        }
        case 6: {
            listerClassementGeneral();
            //lister point mais ordonné !
            //parcourir nos courses et calculer les scores
            break
        }
        case 7: {
            afficherDetailParticipant();
        }
        case 0: {
            quitter = true;
            break;
        }
        default: {
            console.log('Ce menu n\'existe pas')
            break;
        }
    }
}

function ajouterResultatCourse(tournoi, participants, pointsClassement, courses){
    //Demander quelle course
    afficherCourses(courses);
    const numCourse = readlineSync.questionInt('Les résultat de quelle course ?');

    const courseChoisie = courses.find((courseCourante) => courseCourante.id == numCourse);

    const resultatTournoi = {
        course: courseChoisie,
        resultats: [

        ]
    }

    //Pour chaque participant, demander son classement
    participants.forEach((participant) => {
        const classementParticipant = readlineSync.questionInt(`Quelle est la position de ${participant.nom}?   `);
        const resultatParticipant = {
            participant: participant,
            classement: classementParticipant
        }
        console.log(resultatParticipant)
        resultatTournoi.resultats.push(resultatParticipant)
    });

    //ajouer les resultat au tournoi.
    tournoi.courses.push(resultatTournoi);
    console.log(tournoi)
}

function afficherTournoi(tournoi, courses, participants) {
    console.log(`Tournoi du ${tournoi.date}`);
    console.log('\nCourses prévues:');
    afficherCourses(courses);
    console.log('\nParticipants:');
    afficherParticipants(participants);
}

function afficherCourses(courses) {
    courses.forEach((course) => {
        console.log(`${course.id} - ${course.nom}`);
    });
}

function afficherParticipants(participants) {
    participants.forEach((participant) => {
        console.log(`${participant.id} - ${participant.nom}`);
    });
}

function listerPointsParticipants(tournoi){

    //calculer les points par participant
    const resultatTournoi = calculerPointParParticipant(tournoi.courses);

    //Afficher les points par participant
    afficherResultatTournoi(resultatTournoi);

}

function calculerPointParParticipant(courses) {

}



 // {
        //     course: {
        //         id: 1,
        //         nom: 'course A'
        //     },
        //     resultats: [
        //         {
        //             participant: {
        //                 id: 1, 
        //                 nom: 'Yoshi'
        //             },
        //             classement: {
        //                 id: 2,
        //                 position: 2,
        //                 points: 4
        //             }
        //         },

        //     ]
        // }
    

// const pointsParticipants = [
//     {
//         participant : {
//             id: 1,
//             nom: 'Yoshi'
//         },
//         points: 0
//     },
//     ...
// ]
