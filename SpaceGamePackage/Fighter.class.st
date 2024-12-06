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
		dmg := self damage
		       * (self regionModifier at: 'damageModifier' at: aRegion id)
		       *
		       (self regionModifier at: 'defenseModifier' at: self region id) ].
	aBattleCruiser takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Fighter >> attackDestroyer: aDestroyer in: aRegion [
	"Si possède du shield = 0 sinon dmg"

	| dmg |
	dmg := 0.
	aDestroyer shield > 0 ifFalse: [
		dmg := self damage
		       * (self regionModifier at: 'damageModifier' at: aRegion id)
		       *
		       (self regionModifier at: 'defenseModifier' at: self region id) ].
	aDestroyer takingDamages: dmg
]

{ #category : 'as yet unclassified' }
Fighter >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackFighter: self in: aRegion
]

{ #category : 'initialization' }
Fighter >> initialize [

	super initialize.
	name := 'Fighter'.
	shield := 100.
	hull := 400.
	damage := 50.
	regionModifier := self initializeRegionModifier
]

{ #category : 'as yet unclassified' }
Fighter >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier defenseModifier |
	super initializeRegionModifier.
	shieldModifier := regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 0.
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
	damageModifier at: 'Nebula' put: 2.
	damageModifier at: 'AsteroidField' put: 1.
	damageModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'damageModifier' put: damageModifier.

	defenseModifier := regionModifier at: 'defenseModifier'.
	defenseModifier at: 'DeepSpace' put: 1.
	defenseModifier at: 'Nebula' put: 1.
	defenseModifier at: 'AsteroidField' put: 1.
	defenseModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'defenseModifier' put: defenseModifier.
	^ regionModifier
]
