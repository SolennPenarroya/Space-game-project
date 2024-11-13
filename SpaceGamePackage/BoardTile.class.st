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
BoardTile >> assignFleet: f from: anOthertile [

	fleet := f.
	f parentTile: self.
	anOthertile removeFleet.
]

{ #category : 'accessing' }
BoardTile >> board [

	^ board
]

{ #category : 'testing' }
BoardTile >> fleet [

	^ fleet
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

{ #category : 'accessing' }
BoardTile >> region [
^region 
]

{ #category : 'removing' }
BoardTile >> removeFleet [

	fleet = nil.
]

{ #category : 'accessing' }
BoardTile >> x [

	^ x
]

{ #category : 'accessing' }
BoardTile >> y [

	^ y
]
