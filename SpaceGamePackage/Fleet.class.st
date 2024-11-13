Class {
	#name : 'Fleet',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'region',
		'tile'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'adding' }
Fleet >> addShip: aShip [

	aShip parentFleet: self.
	ships add: aShip
]

{ #category : 'as yet unclassified' }
Fleet >> encounterFleet: aFleet on: anOtherBoardTile from: aBoardTile [

	Battle new initializeWith: self versus: aFleet
]

{ #category : 'as yet unclassified' }
Fleet >> encounterWith: anOtherFleet on: anOtherBoardTile from: aBoardTile [

	anOtherFleet encounterFleet: self on: anOtherBoardTile from: aBoardTile
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip [

	super initialize.
	ships := OrderedCollection new.
	region := InhabitedSolarSystem new.
	self addShip: aShip
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip in: aRegion [

	super initialize.
	ships := OrderedCollection new.
	region := aRegion.
	self addShip: aShip
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip numberOfShips: shipCount [

	super initialize.
	ships := OrderedCollection new.
	region := InhabitedSolarSystem new.
	shipCount timesRepeat: [ self addShip: aShip copy ]
]

{ #category : 'initialization' }
Fleet >> initializeWith: aShip numberOfShips: shipCount in: aRegion [

	super initialize.
	ships := OrderedCollection new.
	region := aRegion.
	shipCount timesRepeat: [ self addShip: aShip copy ]
]

{ #category : 'testing' }
Fleet >> isDestroyed [

	^ ships isEmpty
]

{ #category : 'as yet unclassified' }
Fleet >> moveOnX: x Y: y [
 |targetFleet|
 tile := tile board getTileAtX: x y: y.
 targetFleet := tile fleet.
 self encounterWith: targetFleet on: tile.
 
 
	
]

{ #category : 'as yet unclassified' }
Fleet >> otherShipTakingDamages: anInteger ship: previousShip [

	self removeShip: previousShip.
	self isDestroyed
		ifTrue: [ 'Fleet is out of boats' ]
		ifFalse: [ ships first takingDamages: anInteger ]
]

{ #category : 'as yet unclassified' }
Fleet >> otherShipTakingDamagesByDestroyer: anInteger ship: previousShip [

	self removeShip: previousShip.
	self isDestroyed
		ifTrue: [ 'Fleet is out of boats' ]
		ifFalse: [ ships first takingDamagesByDestroyer: anInteger ]
]

{ #category : 'as yet unclassified' }
Fleet >> parentTile: t [

	tile := t.
	region := t region
]

{ #category : 'printing' }
Fleet >> printOn: aStream [

	aStream
		nextPutAll: 'Fleet in region: ' , region printString;
		cr.
	ships do: [ :aShip |
		aStream
			nextPutAll: aShip printString;
			cr ].
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

{ #category : 'initialization' }
Fleet >> setPositionOnX: x Y: y Board: b [

	tile := tile b getTileAtX: x y: y.
	tile assignFleet: self.
]

{ #category : 'accessing' }
Fleet >> ships [
 ^ ships
]

{ #category : 'accessing - structure variables' }
Fleet >> x [
^ tile x
]

{ #category : 'accessing - structure variables' }
Fleet >> y [

	^ tile y
]
