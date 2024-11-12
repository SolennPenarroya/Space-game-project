Class {
	#name : 'BattleCruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
BattleCruiser >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackedByBattleCruiser: self in: aRegion
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackedByFighter: aFighter in: aRegion [
	"Si possède du shield = 0 sinon dmg"

	| dmg |
	dmg := 0.
	self shield > 0
		ifTrue: [  ]
		ifFalse: [
			dmg := aFighter damage
			       *
			       (aFighter regionModifier at: 'damageModifier' at: aRegion id)
			       *
			       (aFighter regionModifier
				        at: 'defenseModifier'
				        at: self region id) ].
	self takingDamages: dmg
]

{ #category : 'initialization' }
BattleCruiser >> initialize [

	super initialize.
	name := 'Battle Cruiser'.
	shield := 12000.
	hull := 6000.
	damage := 1000.
	regionModifier := self initializeRegionModifier.
]

{ #category : 'initialization' }
BattleCruiser >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier defenseModifier |
	super initializeRegionModifier.
	shieldModifier := regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 1.
	shieldModifier at: 'Nebula' put: 1.
	shieldModifier at: 'AsteroidField' put: 1.
	shieldModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'shieldModifier' put: shieldModifier.

	hullModifier := regionModifier at: 'hullModifier'.
	hullModifier at: 'DeepSpace' put: 1.
	hullModifier at: 'Nebula' put: 1.
	hullModifier at: 'AsteroidField' put: 1.
	hullModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'hullModifier' put: hullModifier.

	precisionModifier := regionModifier at: 'precisionModifier'.
	precisionModifier at: 'DeepSpace' put: 1.
	precisionModifier at: 'Nebula' put: 1.
	precisionModifier at: 'AsteroidField' put: 1.
	precisionModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'precisionModifier' put: precisionModifier.

	damageModifier := regionModifier at: 'damageModifier'.
	damageModifier at: 'DeepSpace' put: 1.
	damageModifier at: 'Nebula' put: 1.
	damageModifier at: 'AsteroidField' put: 0.
	damageModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'damageModifier' put: damageModifier.

	defenseModifier := regionModifier at: 'defenseModifier'.
	defenseModifier at: 'DeepSpace' put: 1.
	defenseModifier at: 'Nebula' put: 1.
	defenseModifier at: 'AsteroidField' put: 0.1.
	defenseModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'defenseModifier' put: defenseModifier.
	^ regionModifier
]
