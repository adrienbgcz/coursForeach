const readlineSync = require('readline-sync');

const utilisateurs = [
    {
        id: 1,
        nom: 'Isa'
    },
    {
        id: 2,
        nom: 'hannah_14141987'
    },
    {
        id: 15,
        nom: 'max3202'
    },
    {
        id: 25,
        nom: 'cricri1359'
    },
    {
        id: 49,
        nom: 'Melloki'
    },
    {
        id: 55,
        nom: 'leprincedelanuit'
    },
    {
        id: 56,
        nom: 'EmelineL31'
    },
    {
        id: 65,
        nom: 'lyliemoi'
    },
    {
        id: 86,
        nom: 'Emlimi13'
    },
    {
        id: 111,
        nom: 'lina_13929293'
    },
    {
        id: 222,
        nom: 'Oscar_16503641'
    }

]

const recettes = [
    {
        id: 1,
        nom: 'Pate a crepes',
        niveau: {
            id: 1,
            libelle: 'Facile'
        },
        cout: {
            id: 1,
            libelle: 'Bon Marche'
        },
        nombre_part: 15,
        unite_part: 'crepes',
        temps_preparation: 10,
        temps_repos: 0,
        temps_cuisson: 20,
        auteur: {
            utilisateur: {
                id: 1,
                nom: 'Isa'
            },
            commentaire: 'Astuce Veggie Cool de GoodPlanet: remplacez le lait de vache par du lait végétal: le lait d\'avoine est l\'un des laits végétaux les plus responsables qui soient, et local: à privilégier sans hésiter ! Voici par exemple une recette de pâte à crêpes avec du lait d\'avoine, à tester.'
        },
        etapes: [
            {
                id: 1000,
                numero: 1,
                description: 'Mettre la farine dans une terrine et former un puits.'
            },
            {
                id: 1001,
                numero: 2,
                description: 'Y déposer les oeufs entiers, le sucre, l\'huile et le beurre.'
            },
            {
                id: 1002,
                numero: 3,
                description: 'Mélanger délicatement avec un fouet en ajoutant au fur et à mesure le lait. La pâte ainsi obtenue doit avoir une consistance d\'un liquide légèrement épais.'
            },
            {
                id: 1003,
                numero: 4,
                description: 'Parfumer de rhum.'
            },
            {
                id: 1004,
                numero: 5,
                description: 'Faire chauffer une poêle antiadhésive et la huiler très légèrement. Y verser une louche de pâte, la répartir dans la poêle puis attendre qu\'elle soit cuite d\'un côté avant de la retourner. Cuire ainsi toutes les crêpes à feu doux. de rhum.'
            }
        ],
        commentaires: [
            {
                note: 5,
                description: 'Parfait',
                date: new Date(),
                utilisateur: {
                    id: 55,
                    nom: 'leprincedelanuit'
                }
            },
            {
                note: 2,
                description: 'Pâte trop grumeuse à cause du beurre, elles sont bonnes mais à cause de ça sont trop épaisses',
                date: new Date(),
                utilisateur: {
                    id: 15,
                    nom: 'max3202'
                }
            }

        ],
        ingredients: [
            {
                ingredient: {
                    id: 1,
                    nom: 'rhum'
                },
                quantite: 5,
                unite: {
                    id: 1,
                    libelle: 'cl',
                    description: 'centilitre'
                }
            },
            {
                ingredient: {
                    id: 2,
                    nom: 'farine'
                },
                quantite: 300,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
            {
                ingredient: {
                    id: 3,
                    nom: 'oeufs entiers'
                },
                quantite: 3,
                unite: {
                    id: 3,
                    libelle: '',
                    description: 'unite'
                }
            },
            {
                ingredient: {
                    id: 4,
                    nom: 'sucre'
                },
                quantite: 3,
                unite: {
                    id: 4,
                    libelle: 'càs',
                    description: 'cuillère à soupe'
                }
            },
            {
                ingredient: {
                    id: 5,
                    nom: 'huile'
                },
                quantite: 2,
                unite: {
                    id: 4,
                    libelle: 'càs',
                    description: 'cuillère à soupe'
                }
            }, {
                ingredient: {
                    id: 6,
                    nom: 'beurre fondu'
                },
                quantite: 50,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            }
            , {
                ingredient: {
                    id: 7,
                    nom: 'lait'
                },
                quantite: 60,
                unite: {
                    id: 1,
                    libelle: 'cl',
                    description: 'centilitre'
                }
            }
        ]
    },
    {
        id: 2,
        nom: 'Gateau au chocolat fondant',
        niveau: {
            id: 1,
            libelle: 'Facile'
        },
        cout: {
            id: 1,
            libelle: 'Bon Marche'
        },
        nombre_part: 6,
        unite_part: "personnes",
        temps_preparation: 10,
        temps_repos: 0,
        temps_cuisson: 30,
        auteur: {
            utilisateur: {
                id: 2,
                nom: 'hannah_14141987'
            },
            commentaire: 'Pour aller plus vite, pour faire fondre le chocolat et le beurre, je mets le tout dans un bol coupé en carrés au micro-ondes.'
        },
        etapes: [
            {
                id: 1020,
                numero: 1,
                description: 'Préchauffez votre four à 180°C (thermostat 6). Dans une casserole, faites fondre le chocolat et le beurre coupé en morceaux à feu très doux..',
            },
            {
                id: 1021,
                numero: 2,
                description: 'Dans un saladier, ajoutez le sucre, les oeufs, la farine. Mélangez',
            },
            {
                id: 1022,
                numero: 3,
                description: 'Ajoutez le mélange chocolat/beurre. Mélangez bien.',
            },
            {
                id: 1023,
                numero: 4,
                description: 'Beurrez et farinez votre moule puis y versez la pâte à gâteau.',
            },
            {
                id: 1024,
                numero: 5,
                description: 'Faites cuire au four environ 20 minutes.',
            },
            {
                id: 1025,
                numero: 6,
                description: 'A la sortie du four le gâteau ne paraît pas assez cuit. C\'est normal, laissez-le refroidir puis démoulez- le.',
            }
        ],
        commentaires: [
            {
                note: 5,
                description: 'Facile, rapide, et bon! Juste parfait !',
                date: new Date(),
                utilisateur: {
                    id: 49,
                    nom: 'Melloki'
                }
            },
            {
                note: 4,
                description: 'Pâte trop grumeuse à cause du beurre, elles sont bonnes mais à cause de ça sont trop épaisses',
                date: new Date(),
                utilisateur: {
                    id: 86,
                    nom: 'Emlimi13'
                }
            }
        ],
        ingredients: [
            {
                ingredient: {
                    id: 2,
                    nom: 'farine'
                },
                quantite: 50,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
            {
                ingredient: {
                    id: 3,
                    nom: 'oeufs entiers'
                },
                quantite: 3,
                unite: {
                    id: 3,
                    libelle: '',
                    description: 'unite'
                }
            },
            {
                ingredient: {
                    id: 4,
                    nom: 'sucre'
                },
                quantite: 100,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
            {
                ingredient: {
                    id: 9,
                    nom: 'chocolat patissier'
                },
                quantite: 200,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            }, {
                ingredient: {
                    id: 15,
                    nom: 'beurre'
                },
                quantite: 100,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
        ]
    },
    {
        id: 3,
        nom: 'Welsh Rarebit',
        niveau: {
            id: 4,
            libelle: 'Très facile'
        },
        cout: {
            id: 2,
            libelle: 'Moyen'
        },
        nombre_part: 2,
        unite_part: "personnes",
        temps_preparation: 15,
        temps_repos: 0,
        temps_cuisson: 10,
        auteur: {
            utilisateur: {
                id: 222,
                nom: 'Oscar_16503641'
            },
            commentaire: 'Le pain complet a plus de goût, et tient mieux dans l\'assiette. Le fromage ne doit surtout pas bouillir... S\'il fait des petits grains, c\'est qu\'il a été chauffé trop fort. - Je déconseille de faire cette recette dans un plat à gratin : quand vous servirez dans les assiettes le fromage durcira d\'un seul coup et l\'ensemble ne sera pas très agréable.'
        },
        etapes: [
            {
                id: 2000,
                numero: 1,
                description: 'Préchauffez le four à 180°C (thermostat 6).'
            },
            {
                id: 2001,
                numero: 2,
                description: 'Disposez les tartines dans les assiettes qui vont au four, avec une tranche de jambon sur chaque tartine.'
            },
            {
                id: 2002,
                numero: 3,
                description: 'Coupez le cheddar en petit cubes.'
            },
            {
                id: 2003,
                numero: 4,
                description: 'Faire fondre le cheddar dans une casserole sur feu très doux, sans cesser de remuer avec une cuillère en bois.'
            },
            {
                id: 2004,
                numero: 5,
                description: 'Le fromage va d\'abord faire des fils, c\'est normal, continuez de remuer et de pétrir.'
            },
            {
                id: 2005,
                numero: 6,
                description: 'Quand la consistance est nappante sur la cuillère, ajoutez la bière.'
            },
        ],
        commentaires: [
            {
                note: 5,
                description: 'Parfait',
                date: new Date(),
                utilisateur: {
                    id: 65,
                    nom: 'lyliemoi'
                }
            },
            {
                note: 2,
                description: 'Ce plat servi individuellement permet de satisfaire tous les goûts : sans jambon pour les végétariens, sans oeuf pour alléger ou avec tout pour les gourmands.',
                date: new Date(),
                utilisateur: {
                    id: 25,
                    nom: 'cricri1359'
                }
            }
        ],
        ingredients: [
            {
                ingredient: {
                    id: 11,
                    nom: 'cheddar'
                },
                quantite: 400,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
            {
                ingredient: {
                    id: 12,
                    nom: 'pain complet'
                },
                quantite: 2,
                unite: {
                    id: 15,
                    libelle: 'tranches',
                    description: 'tranches'
                }
            },
            {
                ingredient: {
                    id: 13,
                    nom: 'jambon blanc'
                },
                quantite: 2,
                unite: {
                    id: 13,
                    libelle: 'tranches',
                    description: 'tranches'
                }
            },
            {
                ingredient: {
                    id: 14,
                    nom: 'bière blonde'
                },
                quantite: 8,
                unite: {
                    id: 1,
                    libelle: 'cl',
                    description: 'centilitres'
                }
            },
            {
                ingredient: {
                    id: 3,
                    nom: 'oeufs'
                },
                quantite: 2,
                unite: {
                    id: 3,
                    libelle: '',
                    description: 'unité'
                }
            }
        ]
    },
    {
        id: 4,
        nom: 'Tiramisu aux speculos',
        niveau: {
            id: 1,
            libelle: 'Facile'
        },
        cout: {
            id: 1,
            libelle: 'Bon Marche'
        },
        nombre_part: 6,
        temps_preparation: 25,
        temps_repos: 0,
        temps_cuisson: 0,
        auteur: {
            utilisateur: {
                id: 111,
                nom: 'lina_13929293'
            },
            commentaire: 'L\'astuce Vegan pas banal de GoodPlanet : Profitez de cette recette pour cuisiner vos spéculoos maison : mille fois meilleur, et si facile'
        },
        etapes: [
            {
                id: 3000,
                numero: 1,
                description: 'Faire un ruban avec les jaunes d\'oeufs, le sucre et le sucre vanillé.'
            },
            {
                id: 3001,
                numero: 2,
                description: 'Y ajouter le mascarpone.'
            },
            {
                id: 3002,
                numero: 3,
                description: 'Battre les blancs en neige, les incorporer délicatement au mélange.'
            },
            {
                id: 3003,
                numero: 4,
                description: 'Ajouter l\'amaretto au café noir.'
            },
            {
                id: 3004,
                numero: 5,
                description: 'Monter le gâteau: tremper, au fur et à mesure, les speculoos dans le café (attention à ne pas les "détremper").'
            },
            {
                id: 3005,
                numero: 6,
                description: 'Dans un plat, mettre une couche de biscuits, ensuite une couche de crème au mascarpone. Ensuite une autre couche de biscuits, et terminer par une couche de crème.'
            }
        ],
        commentaires: [
            {
                note: 5,
                description: 'Sans faute, je le réussi à chaque fois et tout le monde adore!',
                date: new Date(),
                utilisateur: {
                    id: 56,
                    nom: 'EmelineL31',
                }
            },
            {
                note: 5,
                description: 'Excellente recette elle fait son effet à tous les coup !! Je remplace l’amarreto par du rhum :parfait::couleur_de_peau-3:',
                date: new Date(),
                utilisateur: {
                    id: 15,
                    nom: 'max3202'
                }
            }
        ],
        ingredients: [
            {
                ingredient: {
                    id: 1,
                    nom: 'Amaretto'
                },
                quantité: 1,
                unite: {
                    id: 4,
                    libelle: 'càs',
                    description: 'cuillère à soupe'
                }
            },
            {
                ingredient: {
                    id: 2,
                    nom: 'mascarpone'
                },
                quantite: 250,
                unite: {
                    id: 2,
                    libelle: 'g',
                    description: 'gramme'
                }
            },
            {
                ingredient: {
                    id: 3,
                    nom: 'sucre roux'
                },
                quantite: 80,
                unite: {
                    id: 3,
                    libelle: 'g',
                    description: 'gramme'
                }
            },

        ]
    }
]
/*

Bonjour et bienvenue dans notre livre de cuisne interactif !

Que souhaitez-vous faire ?

1 - Lister les noms des recettes de cuisine
2 - Afficher la liste des ingredients d'une recette
3 - Afficher la liste des etapes d'une recette
4 - Afficher les commentaires d'une recette
5 - Ajouter un commentaire à une recette
6 - Afficher la note moyenne d'une recette, le nombre de commentaire et la liste des commentaires d'une recette.
7 - Afficher la liste des recettes : nom - note motenne / 5
8 - Afficher la liste des recettes qui utilise un ingredient particulier
0 - Quitter

*/

function afficheMenu() {
    console.log("\n\nQue souhaitez-vous faire ? \n\n" +
        "\t1 - Lister les noms des recettes de cuisine\n" +
        "\t2 - Afficher la liste des ingredients d'une recette\n" +
        "\t3 - Afficher la liste des etapes d'une recette\n" +
        "\t4 - Afficher les commentaires d'une recette\n" +
        "\t5 - Ajouter un commentaire à une recette\n" +
        "\t6 - Afficher la note moyenne d'une recette, le nombre de commentaire et la liste des commentaires d'une recette\n" +
        "\t7 - Afficher la liste des recettes : nom - note motenne / 5\n" +
        "\t8 - Afficher la liste des recettes qui utilise un ingredient particulier\n" +
        "\t0 - Quitter\n")
}

const quitter = false;

while (!quitter) {
    afficheMenu()

    const reponse = readlineSync.questionInt();
    console.log('\n');

    switch (reponse) {
        case 1: {
            listerNom(recettes);
            break;
        }
        case 2: {
            afficherIngredients(recettes);
            break
        }
        case 3: {
            afficherEtapes(recettes);
            break
        }
        case 4: {
            afficherCommentaires(recettes);
            break
        }
        case 5: {
            ajouterCommentaire(recettes, utilisateurs);
            break
        }
        case 6: {
            listerDetailsCommentaires(recettes);
            break
        }
        case 7: {
            listerRecetteAvecNote(recettes);
            break
        }
        case 8: {
            listerRecettePourIngredient(recettes);
            break
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

/*
    on souhaite lister les (id - nom) des recettes.
    Pour ça on parcourcourt la liste des recettes données en parametre et pour chaque recette, on affiche dans la console son id et son nom. 
*/
function listerNoms(mesRecettes) {

    // for(let i = 0; i < mesRecettes.length ; i++) {
    //     const laRecetteCourante = mesRecettes[i];
    //     console.log(`${laRecetteCourante.id} - ${laRecetteCourante.nom}`)
    // }
    mesRecettes.forEach((laRecetteCourante) => console.log(`${laRecetteCourante.id} - ${laRecetteCourante.nom}`));

}



function rechercherRecettesPlusieursCommentaires(mesRecettes) {
    // a la difference du find qui renvoie uniquement le premier element, le filter renvoie un tableau contenant tous les elelements répondant à la condition
    return mesRecettes.filter((laRecetteCourante) => laRecetteCourante.commentaires.length > 1);
}

function listerIngredientsRecette(maRecette) {
    maRecette.ingredients.forEach((ingredientCourant) => {
        console.log(`${ingredientCourant.quantite} ${ingredientCourant.unite.libelle} ${ingredientCourant.ingredient.nom}`)
    })    
}

function rechercherRecetteParId(mesRecettes, idRecette) {

    // on parcours mesRecettes pour retrouver celle qui repond a cette condition ( laRecetteCourante.id == idRecette )
    return mesRecettes.find((laRecetteCourante) => laRecetteCourante.id == idRecette);

    //let recetteRecherche;
    //parcours mes recette et je renvoie celle qui possède l'identifiant demandée
    // for(let i = 0 ; i < mesRecettes.length && !recetteRecherche; i++) {
    //     const laRecetteCourante = mesRecettes[i];
    //     if(laRecetteCourante.id == idRecette){
    //         recetteRecherche = laRecetteCourante;
    //     }
    // }

    // plus beau mais pas de condition de sortie anticipée comme pour le for quand recetteRecherche prend une valeur
    // mesRecettes.forEach((laRecetteCourante) => {
    //     if (laRecetteCourante.id == idRecette) {
    //         recetteRecherche = laRecetteCourante;
    //     }
    // })

    //return recetteRecherche;

    //le find permet de rechercher dans un tableau le premier element qui répond vrai à la condition de la function, ici laRecetteCourante.id == idRecette.
    // comme pour le foreach il parcours le tableau et s'arrete quand un elelent repond à la condition et retourne cet element
    // return mesRecettes.find((laRecetteCourante) => {
    //     return laRecetteCourante.id == idRecette;
    // });

}

/*
    on souhaite lister les ingredients d'une recette particuliere.
    On va lister les recettes pour que l'utilisateur puisse saisir le numéro de la recette dont il souhaite obtenir la liste des ingrédient.
    on va rechercher la recette dans dans notre liste
    on va afficher les ingredient de la recette si on l'a trouvé.
*/
function afficherIngredients(mesRecettes) {

    listerNoms(mesRecettes);

    const numeroRecette = readlineSync.questionInt('De quel numéro de recette souhaitez-vous obtenir la liste des ingredients ?');

    const recetteChoisie = rechercherRecetteParId(mesRecettes, numeroRecette);

    //test recetteChoisie ?
    if (!recetteChoisie) {
        console.log(`\nDésolée, je n'ai pas trouvé la recette ${numeroRecette}`)
    } else {
        listerIngredientsRecette(recetteChoisie);
    }

}


/*
On souhaite ajouter un commentaire sur une recette
On va lister les recettes pour que l'utilisateur puisse saisir le numéro de la recette dont il souhaite obtenir la liste des ingrédient.
On va determiner l'utilisateur qui souhaite ajouter le commentaire
On va creer le commentaire
On ajouter le nouveau commentaire à la recette
*/
function ajouterCommentaire(mesRecettes, mesUtilisateurs) {

    listerNoms(mesRecettes);

    const numeroRecette = readlineSync.questionInt('Sur quel numéro de recette souhaitez-vous ajouter un commentaire ?');
    
    const recetteChoisie = rechercherRecetteParId(mesRecettes, numeroRecette);

    if (!recetteChoisie) {
        console.log(`\nDésolée, je n'ai pas trouvé la recette ${numeroRecette}`)
    } else {
        mesUtilisateurs.forEach((utilisateurCourant) => console.log(`${utilisateurCourant.id} - ${utilisateurCourant.nom}`))
        const numeroUtilisateur = readlineSync.questionInt('Quel numéro d\'utilisateur es-tu ?');

        const utilisateurChoisi = rechercherUtilisateurParId(mesUtilisateurs, numeroUtilisateur);

        if(!utilisateurChoisi){
            console.log(`\nDésolée, je n'ai pas trouvé l'utilisateur ${numeroUtilisateur}`)
        } else {
            const note = readlineSync.questionInt('Quelle note désirez-vous mettre ? (1 - 2 - 3 - 4 - 5)');
            const commentaire = readlineSync.question('Quel commentaire ?');

            

        }
    }
}

















