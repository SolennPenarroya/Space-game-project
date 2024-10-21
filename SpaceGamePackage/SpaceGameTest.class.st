Class {
	#name : 'SpaceGameTest',
	#superclass : 'TestCase',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'tests' }
SpaceGameTest >> testAsteroidFieldHasAsteroidFieldName [

	| a |
	a := AsteroidField new.
	self assert: a name equals: 'Asteroid Field'
]

{ #category : 'tests' }
SpaceGameTest >> testDeepSpaceHasDeepSpaceName [

	| d |
	d := DeepSpace new.
	self assert: d name equals: 'Deep Space'
]

{ #category : 'tests' }
SpaceGameTest >> testFighterVsFighterInInhabitedSolarSystem [

	| battle1 fleet1 fleet2 fighter1 fighter2 region1 region2 damageToFleet1 damageToFleet2 battleResult |
	"Initialisation des vaisseaux et des flottes"
	fighter1 := Fighter new.
	fighter2 := Fighter new.
	fleet1 := Fleet new initializeWith: fighter1 numberOfShips: 5.
	fleet2 := Fleet new initializeWith: fighter2 numberOfShips: 3.

	"Définition de la région de combat"
	region1 := InhabitedSolarSystem new.
	region2 := InhabitedSolarSystem new.

	battle1 := Battle new.
	battle1
		fleetA: fleet1
		fleetB: fleet2
		regionA: region1
		regionB: region2.

	"Vérification des résultats"
	self assert: battleResult attackerLost = fleet1 isDestroyed.
	self assert: battleResult defenderLost = fleet2 isDestroyed
]

{ #category : 'tests' }
SpaceGameTest >> testFleetInitializeWith5Fighter [

	| fleet fighter |
	fighter := Fighter new.
	fleet := Fleet new initializeWith: fighter numberOfShips: 5.

	self assert: fleet ships size equals: 5
]

{ #category : 'tests' }
SpaceGameTest >> testInhabitedSolarSystemHasInhabitedSolarSystemName [

	| i |
	i := InhabitedSolarSystem new.
	self assert: i name equals: 'Inhabited Solar System'
]

{ #category : 'tests' }
SpaceGameTest >> testNebulaHasNebulaName [

	| n |
	n := Nebula new.
	self assert: n name equals: 'Nebula'
]
