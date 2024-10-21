Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'shield',
		'hull',
		'damage',
		'regionModifier'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Ship >> initialize [
	super initialize.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
Ship >> initializeRegionModifier [
	
	| shiedModifier hullModifier damageModifier precisionModifier |
	regionModifier := Dictionary new.

	shiedModifier := Dictionary new.
	hullModifier := Dictionary new.
	damageModifier := Dictionary new.
	precisionModifier := Dictionary new.

	shiedModifier at: 'DeepSpace' put: Dictionary new.
	shiedModifier at: 'Nebula' put: Dictionary new.
	shiedModifier at: 'AsteroidField' put: Dictionary new.
	shiedModifier at: 'InhabitedSolarSystem' put: Dictionary new.
	regionModifier at: 'shiedModifier' put: Dictionary new.

	hullModifier at: 'DeepSpace' put: Dictionary new.
	hullModifier at: 'Nebula' put: Dictionary new.
	hullModifier at: 'AsteroidField' put: Dictionary new.
	hullModifier at: 'InhabitedSolarSystem' put: Dictionary new.
	regionModifier at: 'hullModifier' put: Dictionary new.

	precisionModifier at: 'DeepSpace' put: Dictionary new.
	precisionModifier at: 'Nebula' put: Dictionary new.
	precisionModifier at: 'AsteroidField' put: Dictionary new.
	precisionModifier at: 'InhabitedSolarSystem' put: Dictionary new.
	regionModifier at: 'precisionModifier' put: Dictionary new.

	damageModifier at: 'DeepSpace' put: Dictionary new.
	damageModifier at: 'Nebula' put: Dictionary new.
	damageModifier at: 'AsteroidField' put: Dictionary new.
	damageModifier at: 'InhabitedSolarSystem' put: Dictionary new.
	regionModifier at: 'damageModifier' put: Dictionary new.
	
	^regionModifier 
]
