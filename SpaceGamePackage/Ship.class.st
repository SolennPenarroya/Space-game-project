Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parentFleet',
		'shield',
		'hull',
		'damage',
		'regionModifier'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Ship >> attack: anEnnemiFleet in: aRegion [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Ship >> attackBattleCruiser: aShip in: aRegion [

	aShip shield > 0
		ifTrue: [ aShip shield - aShip damage * (aShip regionModifier at: 'damageModifier' at: aRegion) * (regionModifier at: 'defenseModifier' at: aRegion) ]
		ifFalse: [ aShip hull - aShip damage * (aShip regionModifier at: 'damageModifier' at: aRegion) * (regionModifier at: 'defenseModifier' at: aRegion) ]
		
]

{ #category : 'as yet unclassified' }
Ship >> attackCruiser: aShip in: aRegion [

	
]

{ #category : 'as yet unclassified' }
Ship >> attackDestroyer: aShip in: aRegion [

	
]

{ #category : 'as yet unclassified' }
Ship >> attackFighter: aShip in: aRegion [

	
]

{ #category : 'accessing' }
Ship >> damage [
^damage 
]

{ #category : 'accessing' }
Ship >> hull [
^hull
]

{ #category : 'initialization' }
Ship >> initialize [
	super initialize.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
Ship >> initializeRegionModifier [

	regionModifier := Dictionary new.

	regionModifier at: 'shieldModifier' put: Dictionary new.
	regionModifier at: 'hullModifier' put: Dictionary new.
	regionModifier at: 'precisionModifier' put: Dictionary new.
	regionModifier at: 'damageModifier' put: Dictionary new.
	regionModifier at: 'defenseModifier' put: Dictionary new.

	^ regionModifier
]

{ #category : 'accessing' }
Ship >> parentFleet: aFleet [

	parentFleet := aFleet
]

{ #category : 'accessing' }
Ship >> region [
	^ parentFleet region
]

{ #category : 'accessing' }
Ship >> regionModifier [
^regionModifier 
]

{ #category : 'accessing' }
Ship >> shield [
^shield
]
