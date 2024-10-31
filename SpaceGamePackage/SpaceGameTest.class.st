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
SpaceGameTest >> testBattleCruiseVSBattleCruiserInhabitedSolarSystem [

	| fleet1 fleet2 bc1 bc2 region1 region2 |
	"Initialisation des vaisseaux et des flottes"
	bc1 := BattleCruiser new.
	bc2 := BattleCruiser new.
	"Définition de la région de combat"
	region1 := InhabitedSolarSystem new.
	region2 := InhabitedSolarSystem new.

	fleet1 := Fleet new initializeWith: bc1 numberOfShips: 1 in: region1.
	fleet2 := Fleet new initializeWith: bc2 numberOfShips: 1 in: region2.



	fleet1 ships first
		attackedByBattleCruiser: fleet2 ships first
		in: region1.

	self assert: fleet1 ships first shield equals: 1200
]

{ #category : 'tests' }
SpaceGameTest >> testBattleCruiserVs2FighterInInhabitedSolarSystem [

	| bc fleet1 fg fleet2 region battle |
	bc := BattleCruiser new.
	region := InhabitedSolarSystem new.
	fleet1 := Fleet new initializeWith: bc in: region.
	Transcript
		show: fleet1 printString;
		cr.
	Transcript
		show: '-----------------------';
		cr.
	fg := Fighter new.
	fleet2 := Fleet new initializeWith: fg numberOfShips: 2 in: region.
	Transcript
		show: fleet2 printString;
		cr.
	battle := Battle new initializeWith: fleet1 versus: fleet2.
	Transcript
		show: '--------RESULT----------';
		cr.
	Transcript
		show: fleet1 printString;
		cr.
	Transcript
		show: '-----------------------';
		cr.
	Transcript
		show: fleet2 printString;
		cr.

	self assert: fleet1 ships size = 1.
	self assert: fleet1 ships first shield = 900.
	self assert: fleet1 ships first hull = 6000.
]

{ #category : 'tests' }
SpaceGameTest >> testDeepSpaceHasDeepSpaceName [

	| d |
	d := DeepSpace new.
	self assert: d name equals: 'Deep Space'
]

{ #category : 'tests' }
SpaceGameTest >> testFighterVsFighterInInhabitedSolarSystem [

	| fg fleet1 fleet2 region battle|
	fg := Fighter new.
	region := InhabitedSolarSystem new.
	fleet1 := Fleet new initializeWith: fg numberOfShips: 3 in: region.
	fleet2 := Fleet new initializeWith: fg numberOfShips: 5 in: region.
	battle := Battle new initializeWith: fleet1 versus: fleet2.
	Transcript show: '--------RESULT----------';cr.
	Transcript show: fleet1 printString; cr.
	Transcript show: '-----------------------';cr.
	Transcript show: fleet2 printString; cr.
	Transcript show: '-----------------------';cr.
	
]

{ #category : 'tests' }
SpaceGameTest >> testFleetInitializeWith1Fighter [

	| fleet fighter region|
	fighter := Fighter new.
	region := InhabitedSolarSystem new.
	fleet := Fleet new initializeWith: fighter in: region .

	self assert: fleet ships size equals: 1
]

{ #category : 'tests' }
SpaceGameTest >> testFleetInitializeWith5Fighter [

	| fleet fighter region |
	fighter := Fighter new.
	region := InhabitedSolarSystem new.
	fleet := Fleet new initializeWith: fighter numberOfShips: 5 in: region.

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

{ #category : 'tests' }
SpaceGameTest >> testTakingDamage [

	| bc bc2 region fleet fleet2 |
	bc := BattleCruiser new.
	region := InhabitedSolarSystem new.
	fleet := Fleet new initializeWith: bc in: region.
	bc takingDamages: 100.
	self assert: bc shield equals: 1100.
	self assert: bc hull equals: 6000.
	bc takingDamages: 1500.
	self assert: bc shield equals: 0.
	self assert: bc hull equals: 5600.
	bc takingDamages: 10000.
	self assert: bc shield equals: 0.
	self assert: bc hull equals: 0.
	
	bc2 := BattleCruiser new.
	fleet2 := Fleet new initializeWith: bc2 in: region.
	bc2 takingDamages: 10000.
	self assert: bc2 shield equals: 0.
	self assert: bc2 hull equals: 0
]

{ #category : 'tests' }
SpaceGameTest >> testTakingDamagesFleet [

    | bc bc2 fleet region |
    bc := BattleCruiser new.
    bc2 := BattleCruiser new.
    region := InhabitedSolarSystem new.
    fleet := Fleet new initializeWith: bc in: region.
    fleet addShip: bc2.
    bc takingDamages: 100.
    self assert: bc shield equals: 1100.
    self assert: bc hull equals: 6000.
    bc takingDamages: 1500.
    self assert: bc shield equals: 0.
    self assert: bc hull equals: 5600.
    bc takingDamages: 5700.
    self assert: bc shield equals: 0.
    self assert: bc hull equals: 0.
    self assert: bc2 shield equals: 1100.
    self assert: bc2 hull equals: 6000.
    
    bc := BattleCruiser new.
    bc2 := BattleCruiser new.
    fleet := Fleet new initializeWith: bc in: region.
    fleet addShip: bc2.
    bc takingDamages: 1200+6000+1200+100.
    self assert: bc shield equals: 0.
    self assert: bc hull equals: 0.
    self assert: bc2 shield equals: 0.
    self assert: bc2 hull equals: 5900
]
