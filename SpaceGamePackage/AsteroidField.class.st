Class {
	#name : 'AsteroidField',
	#superclass : 'Region',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
AsteroidField >> damageModifierBattleCruiser [

	^ 0
]

{ #category : 'as yet unclassified' }
AsteroidField >> damageModifierCruiser [

	^ 0.5
]

{ #category : 'as yet unclassified' }
AsteroidField >> damageModifierDestroyer [

	^ 0
]

{ #category : 'as yet unclassified' }
AsteroidField >> defenceModifier [

	^ 0.9
]

{ #category : 'as yet unclassified' }
AsteroidField >> hullModifierCruiser [

	^ 0.25
]

{ #category : 'initialization' }
AsteroidField >> initialize [

	super initialize.
	name := 'Asteroid Field'.
	id := 'AsteroidField'
]

{ #category : 'as yet unclassified' }
AsteroidField >> shieldModifierCruiser [

	^ 0.25
]
