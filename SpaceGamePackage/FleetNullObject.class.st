Class {
	#name : 'FleetNullObject',
	#superclass : 'Object',
	#instVars : [
		'region'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
FleetNullObject >> encounterFleet: aFleet on: anOtherBoardTile from: aBoardTile [

	anOtherBoardTile assignFleet: aFleet from: aBoardTile
]

{ #category : 'as yet unclassified' }
FleetNullObject >> encounterWith: anOtherFleet on: anOtherBoardTile from: aBoardTile [

	anOtherBoardTile assignFleet: anOtherFleet from: aBoardTile
]

{ #category : 'accessing' }
FleetNullObject >> region [

	^ region
]

{ #category : 'accessing' }
FleetNullObject >> region: aRegion [

	region := aRegion
]
