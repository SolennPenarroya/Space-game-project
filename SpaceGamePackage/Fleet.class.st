Class {
	#name : 'Fleet',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'region'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Fleet >> OtherShipTakingDamages: anInteger Ship: previousShip [
	self removeShip: previousShip.
	ships isEmpty
		ifTrue: [ 'Fleet is out of boats' ]
		ifFalse: [ ships atRandom takingDamages: anInteger ]
]

{ #category : 'adding' }
Fleet >> addShip: aShip [

	aShip parentFleet: self.
	ships add: aShip
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip in: aRegion [

	super initialize.
	ships := OrderedCollection new.
	region := aRegion.
	self addShip: aShip
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip numberOfShips: shipCount in: aRegion [

	super initialize.
	ships := OrderedCollection new.
	region := aRegion.
	shipCount timesRepeat: [ self addShip: aShip copy ]
]

{ #category : 'accessing' }
Fleet >> region [
^region

	
]

{ #category : 'accessing' }
Fleet >> region:aRegion [
region:=aRegion.
]

{ #category : 'removing' }
Fleet >> removeShip: aShip [

	aShip parentFleet: nil.
	ships remove: aShip
]

{ #category : 'accessing' }
Fleet >> ships [
 ^ ships
]
