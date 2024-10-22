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
Ship >> attackByBattleCruiser: aBattleCuiser in: aRegion [

	aBattleCuiser shield > 0
		ifTrue: [
			self shield - aBattleCuiser damage
			* (aBattleCuiser regionModifier at: 'damageModifier' at: aRegion)
			* (regionModifier at: 'defenseModifier' at: aRegion) ]
		ifFalse: [
			aBattleCuiser hull - aBattleCuiser damage
			* (aBattleCuiser regionModifier at: 'damageModifier' at: aRegion)
			* (regionModifier at: 'defenseModifier' at: aRegion) ]
]

{ #category : 'as yet unclassified' }
Ship >> attackByCruiser: aShip in: aRegion [

	
]

{ #category : 'as yet unclassified' }
Ship >> attackByDestroyer: aShip in: aRegion [

	
]

{ #category : 'as yet unclassified' }
Ship >> attackByFighter: aShip in: aRegion [

	
]

{ #category : 'as yet unclassified' }
Ship >> attackedBy: anEnnemiFleet in: aRegion [

	self subclassResponsibility
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
