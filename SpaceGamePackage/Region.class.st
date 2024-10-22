Class {
	#name : 'Region',
	#superclass : 'Object',
	#instVars : [
		'name',
		'id'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'accessing' }
Region >> id [

	^ id
]

{ #category : 'accessing' }
Region >> id: aString [

	id := aString
]

{ #category : 'initialization' }
Region >> initialize [ 
 super initialize.
]

{ #category : 'accessing' }
Region >> name [

	^ name
]

{ #category : 'accessing' }
Region >> name: aString [

	name := aString
]
