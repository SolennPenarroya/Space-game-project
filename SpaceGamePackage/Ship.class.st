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

{ #category : 'as yet unclassified' }
Ship >> attack: anotherFleet in: aRegion [
    ^ anotherFleet attackedBy: self in: aRegion.
]

{ #category : 'initialization' }
Ship >> initialize [
	super initialize.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
Ship >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier |
	regionModifier := Dictionary new.

	shieldModifier := Dictionary new.
	hullModifier := Dictionary new.
	damageModifier := Dictionary new.
	precisionModifier := Dictionary new.

	regionModifier at: 'shieldModifier' put: Dictionary new.
	regionModifier at: 'hullModifier' put: Dictionary new.
	regionModifier at: 'precisionModifier' put: Dictionary new.
	regionModifier at: 'damageModifier' put: Dictionary new.

	^ regionModifier
]
