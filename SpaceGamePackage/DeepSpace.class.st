Class {
	#name : 'DeepSpace',
	#superclass : 'Region',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
DeepSpace >> initialize [

	super initialize.
	name := 'Deep Space'.
	id := 'DeepSpace'
]

{ #category : 'as yet unclassified' }
DeepSpace >> shieldModifierDestroyer [

	^ 0.5
]

{ #category : 'as yet unclassified' }
DeepSpace >> shieldModifierFighter [

	^ 0
]
