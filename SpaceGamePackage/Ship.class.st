Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parentFleet',
		'shield',
		'hull',
		'damage',
		'regionModifier'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Ship >> attackBattleCruiser: aBattleCuiser in: aRegion [

	| dmg |
	dmg := self damage
	       *
	       (self regionModifier
		        at: 'damageModifier'
		        at: aRegion id)
	       *
	       (self regionModifier
		        at: 'defenseModifier'
		        at: aBattleCuiser region id).
	aBattleCuiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackCruiser: aCruiser in: aRegion [

	| dmg |
	dmg := self damage
	       *
	       (self regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (self regionModifier
		        at: 'defenseModifier'
		        at: aCruiser region id).
	aCruiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackDestroyer: aDestroyer in: aRegion [

	| dmg |
	dmg := self damage
	       *
	       (self regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (self regionModifier
		        at: 'defenseModifier'
		        at: aDestroyer region id).
	aDestroyer takingDamagesByDestroyer: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackFighter: aFighter in: aRegion [

	| dmg |
	dmg := self damage
	       *
	       (self regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (self regionModifier
		        at: 'defenseModifier'
		        at: aFighter region id).
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

{ #category : 'accessing' }
Ship >> hull [
^hull
]

{ #category : 'initialization' }
Ship >> initialize [
	super initialize.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
Ship >> initializeRegionModifier [

	regionModifier := Dictionary new.

	regionModifier at: 'shieldModifier' put: Dictionary new.
	regionModifier at: 'hullModifier' put: Dictionary new.
	regionModifier at: 'precisionModifier' put: Dictionary new.
	regionModifier at: 'damageModifier' put: Dictionary new.
	regionModifier at: 'defenseModifier' put: Dictionary new.

	^ regionModifier
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
Ship >> regionModifier [
^regionModifier 
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
