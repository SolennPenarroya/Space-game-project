Class {
	#name : 'BattleCruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
BattleCruiser >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackBattleCruiser:self in: aRegion
]

{ #category : 'as yet unclassified' }
BattleCruiser >> getDamageModifier [
^self region damageModifierBattleCruiser
]

{ #category : 'as yet unclassified' }
BattleCruiser >> getDefenceModifier [

	^ self region defenceModifierBattleCruiser
]

{ #category : 'as yet unclassified' }
BattleCruiser >> getHullModifier [

	^ self region hullModifierBattleCruiser
]

{ #category : 'as yet unclassified' }
BattleCruiser >> getPrecisionModifier [

	^ self region precisionModifierBattleCruiser
]

{ #category : 'as yet unclassified' }
BattleCruiser >> getShieldModifier [

	^ self region shieldModifierBattleCruiser
]

{ #category : 'initialization' }
BattleCruiser >> initialize [

	super initialize.
	name := 'Battle Cruiser'.
	shield := 12000.
	hull := 6000.
	damage := 1000.
]
