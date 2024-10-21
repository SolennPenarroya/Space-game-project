Class {
	#name : 'Region',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Region >> initialize [ 
 super initialize.
]

{ #category : 'accessing' }
Region >> name [

	^ name
]

{ #category : 'accessing' }
Region >> name: anObject [

	name := anObject
]