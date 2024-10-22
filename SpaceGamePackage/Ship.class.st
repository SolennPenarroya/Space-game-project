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
Ship >> attackByBattleCruiser: aBattleCuiser in: aRegion [

	| dmg |
	dmg := aBattleCuiser damage
	       *
	       (aBattleCuiser regionModifier
		        at: 'damageModifier'
		        at: aRegion id) * (aBattleCuiser regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackByCruiser: aCruiser in: aRegion [
| dmg |
	dmg := aCruiser damage
	       *
	       (aCruiser regionModifier
		        at: 'damageModifier'
		        at: aRegion id)
	       *
	       (aCruiser regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
	
]

{ #category : 'as yet unclassified' }
Ship >> attackByDestroyer: aDestroyer in: aRegion [
| dmg |
	dmg := aDestroyer damage
	       *
	       (aDestroyer regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (aDestroyer regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
	
]

{ #category : 'as yet unclassified' }
Ship >> attackByFighter: aFighter in: aRegion [
	| dmg |
	dmg := aFighter damage
	       *
	       (aFighter regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (aFighter regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
	
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
					parentFleet OtherShipTakingDamages: 0 - remaining Ship: self ] ]
]
