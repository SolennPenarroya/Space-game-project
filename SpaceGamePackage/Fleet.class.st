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

{ #category : 'accessing' }
Fleet >> ships [
 ^ ships
]
