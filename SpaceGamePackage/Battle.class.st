Class {
	#name : 'Battle',
	#superclass : 'Object',
	#instVars : [
		'fleetA',
		'fleetB',
		'regionA',
		'regionB'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'accessing' }
Battle >> fleetA [

	^ fleetA
]

{ #category : 'as yet unclassified' }
Battle >> fleetA:afleet fleetB: bfleet regionA: aregion regionB: bRegion [

	fleetA := afleet.
	fleetB := bfleet.
	regionA := aregion.
	regionB := bRegion
]

{ #category : 'accessing' }
Battle >> fleetB [

	^ fleetB
]

{ #category : 'accessing' }
Battle >> regionA [
^regionA 
]

{ #category : 'accessing' }
Battle >> regionB [

	^ regionB
]
