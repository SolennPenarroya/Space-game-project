Class {
	#name : 'SpaceGameTest',
	#superclass : 'TestCase',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'tests' }
SpaceGameTest >> testBattle10CruisersInAsteroidFieldAttack3BattlecruiserInDeepSpace [

	| cruiser fleet1 battleCruiser fleet2 region1 region2 battle |
	cruiser := Cruiser new.
	battleCruiser := BattleCruiser new.
	region1 := AsteroidField new.
	region2 := DeepSpace new.
	fleet1 := Fleet new initializeWith: cruiser numberOfShips: 10 in: region1.
	fleet2 := Fleet new initializeWith: battleCruiser numberOfShips: 3 in: region2.
	battle := Battle new initializeWith: fleet1 versus: fleet2.

	self assert: fleet1 ships size equals: 10.
	self assert: fleet2 ships size equals: 3.
	self assert: fleet1 ships first shield equals: 0.
	self assert: fleet1 ships first hull equals: 7425.
	self assert: fleet2 ships first shield equals: 6000.
	self assert: fleet2 ships first hull equals: 6000.
]

{ #category : 'tests' }
SpaceGameTest >> testBattle1FighterAttack1FighterInInhabitedSolarSystem [

	| fg fleet1 fleet2 region battle|
	fg := Fighter new.
	region := InhabitedSolarSystem new.
	fleet1 := Fleet new initializeWith: fg numberOfShips: 1 in: region.
	fleet2 := Fleet new initializeWith: fg numberOfShips: 1 in: region.
	battle := Battle new initializeWith: fleet1 versus: fleet2.
	
	self assert: fleet1 ships size equals: 1.
	self assert: fleet1 ships first shield equals: 0.
	self assert: fleet1 ships first hull equals: 350.
	self assert: fleet2 ships first shield equals: 0.
	self assert: fleet2 ships first hull equals: 350.
]

{ #category : 'tests' }
SpaceGameTest >> testBattle20FighterAttack1BattlecruiserInInhabitedSolarSystem [

	| bc fleet1 fg fleet2 region battle |
	bc := BattleCruiser new.
	fg := Fighter new.
	region := InhabitedSolarSystem new.
	fleet1 := Fleet new initializeWith: fg numberOfShips: 20 in: region.
	fleet2 := Fleet new initializeWith: bc in: region.
	battle := Battle new initializeWith: fleet1 versus: fleet2.

	
	self assert: fleet1 ships size equals: 14.
	self assert: fleet1 ships first shield equals: 100.
	self assert: fleet2 ships first shield equals: 12000.
]

{ #category : 'tests' }
SpaceGameTest >> testBattle2FighterAttack1BattlecruiserInInhabitedSolarSystem [

	| bc fleet1 fg fleet2 region battle |
	bc := BattleCruiser new.
	fg := Fighter new.
	region := InhabitedSolarSystem new.
	fleet1 := Fleet new initializeWith: fg numberOfShips: 2 in: region.
	fleet2 := Fleet new initializeWith: bc in: region.
	battle := Battle new initializeWith: fleet1 versus: fleet2.

	self assert: fleet1 isDestroyed equals: true.
	self assert: fleet2 ships first shield equals: 11900.
	self assert: fleet2 ships first hull equals: 6000.
]

{ #category : 'tests' }
SpaceGameTest >> testBattle5DestroyerInDeepSpaceAttack3BattlecruiserInNebula [

	| destroyer fleet1 battleCruiser fleet2 region1 region2 battle |
	destroyer := Destroyer new.
	battleCruiser := BattleCruiser new.
	region1 := DeepSpace new.
	region2 := Nebula new.
	fleet1 := Fleet new initializeWith: destroyer numberOfShips: 5 in: region1.
	fleet2 := Fleet new initializeWith: battleCruiser numberOfShips: 3 in: region2.
	battle := Battle new initializeWith: fleet1 versus: fleet2.

	self assert: fleet1 ships size equals: 5.
	self assert: fleet2 ships size equals: 2.
	self assert: fleet1 ships first shield equals: 0.
	self assert: fleet1 ships first hull equals: 5500.
	self assert: fleet2 ships first shield equals: 0.
	self assert: fleet2 ships first hull equals: 3000.
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
SpaceGameTest >> testFleetOf2BattlecruiserTaking13500Damages [

    | bc bc2 fleet region |
    bc := BattleCruiser new.
    bc2 := BattleCruiser new.
    region := InhabitedSolarSystem new.
    fleet := Fleet new initializeWith: bc in: region.
    fleet addShip: bc2.
    bc takingDamages: 13500.
    self assert: bc shield equals: 0.
    self assert: bc hull equals: 4500.

]

{ #category : 'tests' }
SpaceGameTest >> testFleetOf2FighterTaking650Damages [

    | fg fg2 fleet region |
    fg := Fighter new.
    fg2 := Fighter new.
    region := InhabitedSolarSystem new.
    fleet := Fleet new initializeWith: fg in: region.
    fleet addShip: fg2.
    fg takingDamages: 650.
    self assert: fg shield equals: 0.
    self assert: fg hull equals: 0.
	self assert: fg2 shield equals: 0.
    self assert: fg2 hull equals: 350.
]

{ #category : 'tests' }
SpaceGameTest >> testNameAsteroidField [

	| a |
	a := AsteroidField new.
	self assert: a name equals: 'Asteroid Field'
]

{ #category : 'tests' }
SpaceGameTest >> testNameDeepSpace [

	| d |
	d := DeepSpace new.
	self assert: d name equals: 'Deep Space'
]

{ #category : 'tests' }
SpaceGameTest >> testNameInhabitedSolarSystem [

	| i |
	i := InhabitedSolarSystem new.
	self assert: i name equals: 'Inhabited Solar System'
]

{ #category : 'tests' }
SpaceGameTest >> testNameNebula [

	| n |
	n := Nebula new.
	self assert: n name equals: 'Nebula'
]
