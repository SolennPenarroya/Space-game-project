Class {
	#name : 'Destroyer',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Destroyer >> attackDestroyer: aDestroyer in: aRegion [
"x2 on shield and /2 on hull"

	
]

{ #category : 'as yet unclassified' }
Destroyer >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackDestroyer: self in: aRegion
]

{ #category : 'initialization' }
Destroyer >> initialize [

	super initialize.
	name := 'Destroyer'.
	shield := 5000.
	hull := 10000.
	damage := 2000.
]

{ #category : 'initialization' }
Destroyer >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier defenseModifier |
	super initializeRegionModifier.
	shieldModifier := regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 0.5.
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
	defenseModifier at: 'AsteroidField' put: 1.
	defenseModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'defenseModifier' put: defenseModifier
]
