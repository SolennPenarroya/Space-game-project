Class {
	#name : 'BoardTile',
	#superclass : 'Object',
	#instVars : [
		'x',
		'y',
		'region',
		'fleet',
		'board'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
BoardTile >> assignFleet: f from: anOtherTile [

	fleet := f.
	f parentTile: self.
	anOtherTile removeFleet
]

{ #category : 'accessing' }
BoardTile >> board [

	^ board
]

{ #category : 'testing' }
BoardTile >> fleet [

	^ fleet
]

{ #category : 'as yet unclassified' }
BoardTile >> fleetMoveOnx: nextx y: nexty [
	board fleetMoveOnx: nextx y: nexty from: self fleet: fleet.
]

{ #category : 'initialization' }
BoardTile >> initializeX: xPos y: yPos region: aRegion fleet: aFleet board: aBoard [

	super initialize.
	x := xPos.
	y := yPos.
	region := aRegion.
	fleet := aFleet.
	aFleet region: aRegion.
	board := aBoard
]

{ #category : 'as yet unclassified' }
BoardTile >> needBattleWith: anOtherfleet [

	board battleAgainst: fleet vs: anOtherfleet
]

{ #category : 'accessing' }
BoardTile >> region [
^region 
]

{ #category : 'removing' }
BoardTile >> removeFleet [

	fleet := FleetNullObject new.
]

{ #category : 'initialization' }
BoardTile >> setFleet: f [ 

	fleet := f.
	f parentTile: self.
]

{ #category : 'initialization' }
BoardTile >> setNullFleet [

	| f |
	f := FleetNullObject new.
	fleet := f.
]

{ #category : 'accessing' }
BoardTile >> x [

	^ x
]

{ #category : 'accessing' }
BoardTile >> y [

	^ y
]
