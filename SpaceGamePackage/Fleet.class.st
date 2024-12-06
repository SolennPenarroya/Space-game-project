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
Fleet >> encounterFleet: aFleet on: anOthertile from: aBoardTile [

	aBoardTile needBattleWith: self
]

{ #category : 'as yet unclassified' }
Fleet >> encounterWith: anOtherFleet on: anOtherTile from: aBoardTile [

	anOtherFleet encounterFleet: self on:anOtherTile from: aBoardTile
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

{ #category : 'actions' }
Fleet >> moveDown [

	tile fleetMoveOnx: self x y: self y + 1
]

{ #category : 'as yet unclassified' }
Fleet >> moveLeft [

	tile fleetMoveOnx: self x - 1 y: self y
]

{ #category : 'as yet unclassified' }
Fleet >> moveRight [

	tile fleetMoveOnx: self x + 1 y: self y
]

{ #category : 'as yet unclassified' }
Fleet >> moveUp [

	tile fleetMoveOnx: self x y: self y - 1
]

{ #category : 'as yet unclassified' }
Fleet >> otherShipTakingDamages: anInteger ship: previousShip [

	self removeShip: previousShip.
	self isDestroyed
		ifTrue: [ tile setNullFleet ]
		ifFalse: [ ships first takingDamages: anInteger ]
]

{ #category : 'as yet unclassified' }
Fleet >> otherShipTakingDamagesByDestroyer: anInteger ship: previousShip [

	self removeShip: previousShip.
	self isDestroyed
		ifTrue: [ tile setNullFleet ]
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
		nextPutAll:
			'Fleet in region: ' , region printString , 'Coordinate ('
			, self x printString , ';' , self y printString , ') ';
		cr.
	ships do: [ :aShip |
		aStream
			nextPutAll: aShip printString;
			cr ]
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
Fleet >> setPositionOnx: x y: y board: b [

	tile := b getTileAtx: x y: y.
	tile setFleet: self
]

{ #category : 'accessing' }
Fleet >> ships [
 ^ ships
]

{ #category : 'accessing' }
Fleet >> tile [
^tile
]

{ #category : 'accessing - structure variables' }
Fleet >> x [
^ tile x
]

{ #category : 'accessing - structure variables' }
Fleet >> y [

	^ tile y
]
