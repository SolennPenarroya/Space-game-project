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

{ #category : 'accessing' }
BoardTile >> board [

	^ board
]

{ #category : 'initialization' }
BoardTile >> initializeX: xPos y: yPos region: aRegion fleet: aFleet board: aBoard [

	super initialize.
	x := xPos.
	y := yPos.
	region := aRegion.
	fleet := aFleet.
	board := aBoard.
]

{ #category : 'testing' }
BoardTile >> isOccupiedByFleet [

	^ fleet notNil 
]

{ #category : 'accessing' }
BoardTile >> region [
^region 
]

{ #category : 'accessing' }
BoardTile >> x [

	^ x
]

{ #category : 'accessing' }
BoardTile >> x: anInteger [

	x := anInteger
]

{ #category : 'instance creation' }
BoardTile >> x: xCoord y: yCoord [

	x := xCoord.
	y := yCoord.
	self board atX: x atY: y put: self
]

{ #category : 'accessing' }
BoardTile >> y [

	^ y
]

{ #category : 'accessing' }
BoardTile >> y: anInteger [

	y := anInteger
]
