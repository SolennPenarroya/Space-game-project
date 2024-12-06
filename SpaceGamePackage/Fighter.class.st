Class {
	#name : 'Fighter',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Fighter >> attackBattleCruiser: aBattleCruiser in: aRegion [
	"Si possède du shield = 0 sinon dmg"

	| dmg |
	dmg := 0.
	aBattleCruiser shield > 0 ifFalse: [
		dmg := self damage * self getDamageModifier
	       * aBattleCruiser getDefenceModifier. ].
	aBattleCruiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Fighter >> attackDestroyer: aDestroyer in: aRegion [
	"Si possède du shield = 0 sinon dmg"

	| dmg |
	dmg := 0.
	aDestroyer shield > 0 ifFalse: [
		dmg := self damage * self getDamageModifier
	       * aDestroyer getDefenceModifier. ].
	aDestroyer takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Fighter >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackFighter: self in: aRegion
]

{ #category : 'as yet unclassified' }
Fighter >> getDamageModifier [

	^ self region damageModifierFighter
]

{ #category : 'as yet unclassified' }
Fighter >> getDefenceModifier [

	^ self region defenceModifierFighter
]

{ #category : 'as yet unclassified' }
Fighter >> getHullModifier [

	^ self region hullModifierFighter
]

{ #category : 'as yet unclassified' }
Fighter >> getPrecisionModifier [

	^ self region precisionModifierFighter
]

{ #category : 'as yet unclassified' }
Fighter >> getShieldModifier [

	^ self region shieldModifierFighter
]

{ #category : 'initialization' }
Fighter >> initialize [

	super initialize.
	name := 'Fighter'.
	shield := 100.
	hull := 400.
	damage := 50.
]
