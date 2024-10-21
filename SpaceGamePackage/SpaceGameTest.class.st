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
