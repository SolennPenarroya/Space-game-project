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
FleetNullObject >> encounterWith: otherFleet on: aBoardTile [

	aBoardTile assignFleet: otherFleet from: aBoardTile
]

{ #category : 'accessing' }
FleetNullObject >> region [

	^ region
]

{ #category : 'accessing' }
FleetNullObject >> region: aRegion [

	region := aRegion
]
