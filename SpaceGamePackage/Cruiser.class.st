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

{ #category : 'initialization' }
Cruiser >> initialize [

	super initialize.
	name := 'Cruiser'.
	shield := 1000.
	hull := 8000.
	damage := 400.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
Cruiser >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier defenseModifier |
	super initializeRegionModifier.
	shieldModifier := regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 0.75. "TODO"
	shieldModifier at: 'Nebula' put: 1.
	shieldModifier at: 'AsteroidField' put: 0.25.
	shieldModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'shieldModifier' put: shieldModifier.

	hullModifier := regionModifier at: 'hullModifier'.
	hullModifier at: 'DeepSpace' put: 0.75. "TODO"
	hullModifier at: 'Nebula' put: 1.
	hullModifier at: 'AsteroidField' put: 0.25.
	hullModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'hullModifier' put: hullModifier.

	precisionModifier := regionModifier at: 'precisionModifier'.
	precisionModifier at: 'DeepSpace' put: 1.
	precisionModifier at: 'Nebula' put: 1.
	precisionModifier at: 'AsteroidField' put: 1.
	precisionModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'precisionModifier' put: precisionModifier.

	damageModifier := regionModifier at: 'damageModifier'.
	damageModifier at: 'DeepSpace' put: 0.5.
	damageModifier at: 'Nebula' put: 1.
	damageModifier at: 'AsteroidField' put: 0.5.
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
