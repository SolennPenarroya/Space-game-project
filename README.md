# Space-game-project

Ce projet est une simulation de combat spatial inspirée du jeu *Civilization*, adaptée pour un univers de science-fiction où des flottes de vaisseaux spatiaux s'affrontent pour le contrôle de régions de l'univers. Le projet met en œuvre une série de règles et de modèles spécifiques pour simuler des combats entre flottes composées de différents types de vaisseaux avec des caractéristiques distinctes.

## Modèle de Jeu

### Structure de l'Univers
L'univers est constitué de régions, chacune formant un plateau de jeu en grille. Chaque case de la grille peut contenir une région, éventuellement occupée par une flotte de vaisseaux.

### Vaisseaux et Flottes
Les unités sont des vaisseaux spatiaux regroupés en flottes :
- Une flotte contient un ou plusieurs vaisseaux.
- Les types de vaisseaux incluent : chasseurs, croiseurs, destroyers et croiseurs de bataille.
- Les vaisseaux possèdent des caractéristiques de **coque**, **boucliers** et **puissance d'attaque**.

### Règles de Combat
Les combats entre flottes suivent ces principes :
1. Une flotte peut attaquer une région occupée pour initier une bataille.
2. Le combat se déroule en trois rounds.
3. Les flottes attaquantes et défendantes échangent des tirs, et les dégâts sont calculés et appliqués en fonction des boucliers et de la coque des vaisseaux.

**Dégâts** :
- Les dégâts sont appliqués séquentiellement aux vaisseaux ennemis (triés aléatoirement), en soustrayant d'abord les points des boucliers, puis ceux de la coque si les boucliers sont épuisés.
- Les vaisseaux détruits sont retirés de la flotte.

### Types de Vaisseaux

| Type         | Boucliers | Coque | Dégâts |
|--------------|-----------|-------|--------|
| **Chasseur**      | 100       | 400   | 50     |
| **Croiseur**      | 1000      | 8000  | 400    |
| **Destroyer**     | 5000      | 10000 | 2000   |
| **Croiseur de Bataille** | 12000 | 6000 | 1000 |

Chaque type de vaisseau possède des capacités et des faiblesses uniques en fonction de la région où ils se trouvent.

### Types de Régions de l'Univers

1. **Système Solaire Habité** : Espace standard, aucun effet spécial.
2. **Champ d'Astéroïdes** : Les chasseurs sont avantagés, croiseurs subissent plus de dégâts, les autres vaisseaux sont peu efficaces.
3. **Nébuleuse** : Réduit la précision des tirs, certains vaisseaux sont moins affectés.
4. **Espace Profond** : Affecte l'efficacité des boucliers, chaque type de vaisseau est impacté différemment.

## Résultats des Batailles

À la fin de chaque bataille, un rapport résume :
- Les pertes de chaque flotte.
- Les vaisseaux restants de chaque côté.
---

Technologie : Pharo

Ce projet est développé en Pharo, un environnement de développement Smalltalk open-source orienté objet. Ce projet exploite les capacités de Pharo pour créer et tester dynamiquement des modèles de jeu, des règles de combat et des interactions spatiales en temps réel.

Installation de Pharo

Pour exécuter le projet :

    Téléchargez et installez Pharo depuis pharo.org.
    Ouvrez Pharo, puis chargez le code du projet dans l'image Pharo.
    Lancez la simulation et explorez différents scénarios de combat en utilisant les classes et méthodes définies.
