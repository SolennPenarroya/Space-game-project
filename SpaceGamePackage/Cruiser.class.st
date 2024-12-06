Class {
	#name : 'Cruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Cruiser >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackCruiser: self in: aRegion
]

{ #category : 'as yet unclassified' }
Cruiser >> getDamageModifier [

	^ self region damageModifierCruiser
]

{ #category : 'as yet unclassified' }
Cruiser >> getDefenceModifier [

	^ self region defenceModifierCruiser
]

{ #category : 'as yet unclassified' }
Cruiser >> getHullModifier [

	^ self region hullModifierCruiser
]

{ #category : 'as yet unclassified' }
Cruiser >> getPrecisionModifier [

	^ self region precisionModifierCruiser
]

{ #category : 'as yet unclassified' }
Cruiser >> getShieldModifier [

	^ self region shieldModifierCruiser
]

{ #category : 'initialization' }
Cruiser >> initialize [

	super initialize.
	name := 'Cruiser'.
	shield := 1000.
	hull := 8000.
	damage := 400.
]
