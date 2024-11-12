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
Ship >> attackedBy: anEnnemiFleet in: aRegion [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
Ship >> attackedByBattleCruiser: aBattleCuiser in: aRegion [

	| dmg |
	dmg := aBattleCuiser damage
	       *
	       (aBattleCuiser regionModifier
		        at: 'damageModifier'
		        at: aRegion id)
	       *
	       (aBattleCuiser regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackedByCruiser: aCruiser in: aRegion [

	| dmg |
	dmg := aCruiser damage
	       *
	       (aCruiser regionModifier at: 'damageModifier' at: aRegion id)
	       *
	       (aCruiser regionModifier
		        at: 'defenseModifier'
		        at: self region id).
	self takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Ship >> attackedByDestroyer: aDestroyer in: aRegion [

	| dmg remaining |
	dmg := self damage
	       * (self regionModifier at: 'damageModifier' at: aRegion id)
	       * (self regionModifier at: 'defenseModifier' at: self region id).


	remaining := shield - dmg*2.
	remaining > 0
		ifTrue: [ shield := remaining ]
		ifFalse: [
			shield := 0.
			remaining := hull + remaining/4.
			remaining > 0
				ifTrue: [ hull := remaining ]
				ifFalse: [
					hull := 0.
					parentFleet
						otherShipTakingDamages: 0 - (remaining*4) ship: aShip ] ]

]

{ #category : 'as yet unclassified' }
Ship >> attackedByFighter: aFighter in: aRegion [

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
					parentFleet OtherShipTakingDamages: 0 - remaining Ship: self ] ]
]
