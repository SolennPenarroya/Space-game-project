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
Ship >> attack: aShip [

	aShip beAttackedBy: self
]

{ #category : 'as yet unclassified' }
Ship >> attack: anAnotherShip inRegion: aRegion [

	^ anAnotherShip receiveAttackFrom: self inRegion: aRegion.
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

{ #category : 'as yet unclassified' }
Ship >> receiveAttackFrom: anAttacker inRegion: aRegion [
    ^ 'Attack not defined for this combination'.
]
