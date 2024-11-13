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
Board >> addTile: aTile atX: xPos y: yPos [

	tiles atColumn: xPos atRow: yPos put: aTile
]

{ #category : 'as yet unclassified' }
Board >> getTileAtX: x y: y [
	^ tiles atColumn: x atRow: y.
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
