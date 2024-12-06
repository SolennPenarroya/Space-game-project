Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parentFleet',
		'shield',
		'hull',
		'damage'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Ship >> attackBattleCruiser: aBattleCuiser in: aRegion [

	| dmg |
	dmg := self damage * self getDamageModifier
	       * aBattleCuiser getDefenceModifier.
	aBattleCuiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackCruiser: aCruiser in: aRegion [

	| dmg |
	dmg := self damage
	       * self getDamageModifier
	       * aCruiser getDefenceModifier.
	aCruiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackDestroyer: aDestroyer in: aRegion [

	| dmg |
	dmg := self damage
	       * self getDamageModifier
	       * aDestroyer getDefenceModifier.
	aDestroyer takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackFighter: aFighter in: aRegion [

	| dmg |
	dmg := self damage
	       * (self getDamageModifier)
	       * (aFighter getDefenceModifier).
	aFighter takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackedBy: anEnnemiFleet in: aRegion [

	self subclassResponsibility
]

{ #category : 'accessing' }
Ship >> damage [
^damage 
]

{ #category : 'as yet unclassified' }
Ship >> getDamageModifier [

	^ self region damageModifier
]

{ #category : 'as yet unclassified' }
Ship >> getDefenceModifier [

	^ self region defenceModifier
]

{ #category : 'as yet unclassified' }
Ship >> getHullModifier [

	^ self region hullModifier
]

{ #category : 'as yet unclassified' }
Ship >> getPrecisionModifier [

	^ self region precisionModifier
]

{ #category : 'as yet unclassified' }
Ship >> getShieldModifier [

	^ self region shieldModifier
]

{ #category : 'accessing' }
Ship >> hull [
^hull
]

{ #category : 'initialization' }
Ship >> initialize [

	super initialize.
]

{ #category : 'accessing' }
Ship >> parentFleet: aFleet [

	parentFleet := aFleet
]

{ #category : 'printing' }
Ship >> printOn: aStream [

	aStream
		nextPutAll: name;
		cr;
		tab;
		nextPutAll: '  Shield: ' , shield asString;
		cr;
		tab;
		nextPutAll: '  Hull: ' , hull asString;
		cr;
		tab;
		nextPutAll: '  Damage: ' , damage asString;
		cr
]

{ #category : 'accessing' }
Ship >> region [
	^ parentFleet region
]

{ #category : 'accessing' }
Ship >> shield [
^shield
]

{ #category : 'as yet unclassified' }
Ship >> takingDamages: dmgTaken [

	| remaining |
	remaining := shield - dmgTaken.
	remaining > 0
		ifTrue: [ shield := remaining ]
		ifFalse: [
			shield := 0.
			remaining := hull + remaining.
			remaining > 0
				ifTrue: [ hull := remaining ]
				ifFalse: [
					hull := 0.
					parentFleet otherShipTakingDamages: 0 - remaining ship: self ] ]
]

{ #category : 'as yet unclassified' }
Ship >> takingDamagesByDestroyer: dmgTaken [

	| remaining |
	remaining := shield - (dmgTaken * 2).
	remaining > 0
		ifTrue: [ shield := remaining ]
		ifFalse: [
			shield := 0.
			remaining := hull + (remaining / 4).
			remaining > 0
				ifTrue: [ hull := remaining ]
				ifFalse: [
					hull := 0.
					parentFleet otherShipTakingDamagesByDestroyer: 0 - (remaining * 2) ship: self ] ]
]
