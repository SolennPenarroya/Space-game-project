Class {
	#name : 'Destroyer',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Destroyer >> attackBattleCruiser: aBattleCuiser in: aRegion [

	| dmg |
	dmg := self damage * self getDamageModifier
	       * aBattleCuiser getDefenceModifier.
	aBattleCuiser takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Destroyer >> attackCruiser: aCruiser in: aRegion [

	| dmg |
	dmg := self damage * self getDamageModifier
	       * aCruiser getDefenceModifier.
	aCruiser takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Destroyer >> attackDestroyer: aDestroyer in: aRegion [

	| dmg |
	dmg := self damage * self getDamageModifier
	       * aDestroyer getDefenceModifier.
	aDestroyer takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Destroyer >> attackFighter: aFighter in: aRegion [

	| dmg |
	dmg := self damage * self getDamageModifier
	       * aFighter getDefenceModifier.
	aFighter takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Destroyer >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackDestroyer: self in: aRegion
]

{ #category : 'as yet unclassified' }
Destroyer >> getDamageModifier [

	^ self region damageModifierDestroyer
]

{ #category : 'as yet unclassified' }
Destroyer >> getDefenceModifier [

	^ self region defenceModifierDestroyer
]

{ #category : 'as yet unclassified' }
Destroyer >> getHullModifier [

	^ self region hullModifierDestroyer 
]

{ #category : 'as yet unclassified' }
Destroyer >> getPrecisionModifier [

	^ self region precisionModifierDestroyer
]

{ #category : 'as yet unclassified' }
Destroyer >> getShieldModifier [

	^ self region shieldModifierDestroyer
]

{ #category : 'initialization' }
Destroyer >> initialize [

	super initialize.
	name := 'Destroyer'.
	shield := 5000.
	hull := 10000.
	damage := 2000.
]
