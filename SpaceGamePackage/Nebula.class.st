Class {
	#name : 'Nebula',
	#superclass : 'Region',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Nebula >> damageModifierFighter [

	^ 2
]

{ #category : 'initialization' }
Nebula >> initialize [

	super initialize.
	name := 'Nebula'.
	id := 'Nebula'
]

{ #category : 'as yet unclassified' }
Nebula >> precisionModifierFighter [

	^ 1.5
]
