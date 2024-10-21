Class {
	#name : 'BoardTile',
	#superclass : 'Object',
	#instVars : [
		'region',
		'fleet',
		'isOccupied'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'protected' }
BoardTile >> basicPosition: aPosition [
	"A position is a x,y kind of object."

	"to probably remove and introduce basicX: and basicY:"

	x := aPosition x.
	y := aPosition y
]

{ #category : 'accessing' }
BoardTile >> board [

	^ board
]

{ #category : 'initialization' }
BoardTile >> initialize [

	super initialize.
	self basicPosition: 1 @ 1
]

{ #category : 'accessing' }
BoardTile >> position [

	^ x @ y
]

{ #category : 'accessing' }
BoardTile >> position: aPoint [

	self basicPosition: aPoint.
	self board atX: aPoint x atY: aPoint y put: self
]

{ #category : 'accessing' }
BoardTile >> region [
^region 
]

{ #category : 'initialization' }
BoardTile >> setBoard: aBoard [

	board := aBoard
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
