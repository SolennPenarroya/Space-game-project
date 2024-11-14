Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'tiles',
		'width',
		'height'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Board >> addTile: aTile atx: xPos y: yPos [

	tiles atColumn: xPos atRow: yPos put: aTile
]

{ #category : 'as yet unclassified' }
Board >> battleAgainst: fleet vs: anOtherFleet [
	|b|
	b := Battle new initializeWith: fleet versus: anOtherFleet.
	Transcript show: b battleLogs printString; cr.
	anOtherFleet isDestroyed ifTrue: [
		self
			fleetMoveOnx: anOtherFleet x
			y: anOtherFleet y
			from: fleet tile
			fleet: fleet ]
	
]

{ #category : 'as yet unclassified' }
Board >> fleetMoveOnx: nextx y: nexty from: aTile fleet: aFleet [

	| targetFleet nextTile |
	nextTile := self getTileAtx: nextx y: nexty.
	targetFleet := nextTile fleet.
	aFleet encounterWith: targetFleet on: nextTile from: aTile 
]

{ #category : 'as yet unclassified' }
Board >> getTileAtx: x y: y [

	| coordx coordy |
	coordx := x max: 1.
	coordx := coordx min: width.
	coordy := y max: 1.
	coordy := coordy min: height.
	^ tiles atColumn: coordx atRow: coordy
]

{ #category : 'initialization' }
Board >> initializeWidth: w height: h [

	| region tile |
	width := w.
	height := h.
	region := InhabitedSolarSystem new.
	tiles := CTArray2D width: w height: h.
	1 to: w do: [ :x |
		1 to: h do: [ :y |
			tile := BoardTile new
				        initializeX: x
				        y: y
				        region: region
				        fleet: FleetNullObject new
				        board: self.
			tiles atColumn: x atRow: y put: tile ] ]
]
