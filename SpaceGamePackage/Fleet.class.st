Class {
	#name : 'Fleet',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'region'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Fleet >> initializeWith: aShip numberOfShips: shipCount [

	
	super initialize.
	ships := OrderedCollection new.

	shipCount timesRepeat: [ ships add: aShip copy ] 
]

{ #category : 'accessing' }
Fleet >> region [
^region

	
]

{ #category : 'accessing' }
Fleet >> region:aRegion [
region:=aRegion.
]

{ #category : 'accessing' }
Fleet >> ships [
 ^ ships
]
