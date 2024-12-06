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

{ #category : 'as yet unclassified' }
Region >> damageModifier [
^1
]

{ #category : 'as yet unclassified' }
Region >> damageModifierBattleCruiser [

	^ self damageModifier
]

{ #category : 'as yet unclassified' }
Region >> damageModifierCruiser [

	^ self damageModifier
]

{ #category : 'as yet unclassified' }
Region >> damageModifierDestroyer [

	^ self damageModifier
]

{ #category : 'as yet unclassified' }
Region >> damageModifierFighter [
	^ self damageModifier
]

{ #category : 'as yet unclassified' }
Region >> defenceModifier [

	^ 1
]

{ #category : 'as yet unclassified' }
Region >> defenceModifierBattleCruiser [

	^ self defenceModifier
]

{ #category : 'as yet unclassified' }
Region >> defenceModifierCruiser [

	^ self defenceModifier
]

{ #category : 'as yet unclassified' }
Region >> defenceModifierDestroyer [

	^ self defenceModifier
]

{ #category : 'as yet unclassified' }
Region >> defenceModifierFighter [

	^ self defenceModifier
]

{ #category : 'as yet unclassified' }
Region >> hullModifier [

	^ 1
]

{ #category : 'as yet unclassified' }
Region >> hullModifierBattleCruiser [

	^ self hullModifier
]

{ #category : 'as yet unclassified' }
Region >> hullModifierCruiser [

	^ self hullModifier
]

{ #category : 'as yet unclassified' }
Region >> hullModifierDestroyer [

	^ self hullModifier
]

{ #category : 'as yet unclassified' }
Region >> hullModifierFighter [

	^ self hullModifier
]

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

{ #category : 'as yet unclassified' }
Region >> precisionModifier [

	^ 1
]

{ #category : 'as yet unclassified' }
Region >> precisionModifierBattleCruiser [

	^ self precisionModifier
]

{ #category : 'as yet unclassified' }
Region >> precisionModifierCruiser [

	^ self precisionModifier
]

{ #category : 'as yet unclassified' }
Region >> precisionModifierDestroyer [

	^ self precisionModifier
]

{ #category : 'as yet unclassified' }
Region >> precisionModifierFighter [

	^ self precisionModifier
]

{ #category : 'printing' }
Region >> printOn: aStream [

	aStream nextPutAll: name;
	cr.
]

{ #category : 'as yet unclassified' }
Region >> shieldModifier [

	^ 1
]

{ #category : 'as yet unclassified' }
Region >> shieldModifierBattleCruiser [

	^ self shieldModifier
]

{ #category : 'as yet unclassified' }
Region >> shieldModifierCruiser [

	^ self shieldModifier
]

{ #category : 'as yet unclassified' }
Region >> shieldModifierDestroyer [

	^ self shieldModifier
]

{ #category : 'as yet unclassified' }
Region >> shieldModifierFighter [

	^ self shieldModifier
]
