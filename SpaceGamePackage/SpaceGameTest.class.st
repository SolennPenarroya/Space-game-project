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
SpaceGameTest >> testNebulaHasNebulaName [

	| n |
	n := Nebula new.
	self assert: n name equals: 'Nebula'
]
