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

{ #category : 'accessing' }
Battle >> fleetB [

	^ fleetB
]

{ #category : 'initialization' }
Battle >> initializeWith: fleetOne in: regionOne versus: fleetTwo in: regionTwo [
    fleetA := fleetOne.
    regionA := regionOne.
    fleetB := fleetTwo.
    regionB := regionTwo.
]

{ #category : 'accessing' }
Battle >> regionA [
^regionA 
]

{ #category : 'accessing' }
Battle >> regionB [

	^ regionB
]
