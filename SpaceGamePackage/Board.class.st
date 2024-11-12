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
Board >> getTileAtX: x y: y [
	^ tiles atColumn: x atRow: y.
]

{ #category : 'initialization' }
Board >> initializeWidth: w height: h [

	| fleetEmpty region ship tile |
	width := w.
	height := h.
	region := InhabitedSolarSystem new.
	ship := Fighter new.
	fleetEmpty := Fleet new
		              initializeWith: ship
		              numberOfShips: 0
		              in: region.
	tiles := CTArray2D width: w height: h.
	1 to: w do: [ :x |
		1 to: h do: [ :y |
			tile := BoardTile new
				        initializeX: x
				        y: y
				        region: region
				        fleet: fleetEmpty
				        board: self.
			tiles atColumn: x atRow: y put: tile ] ]
]

{ #category : 'as yet unclassified' }
Board >> placeTile: aTile atX: xPos y: yPos [

	tiles atColumn: xPos atRow: yPos put: aTile
]
