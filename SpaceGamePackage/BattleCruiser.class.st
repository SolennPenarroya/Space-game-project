Class {
	#name : 'BattleCruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
BattleCruiser >> attack: anEnnemiFleet in: aRegion [

	anEnnemiFleet defendAgainstBattleCruiser: self region
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackBattleCruiser: aBattleCruiser in: aRegion [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackCruiser: aCruiser in: aRegion [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackDestroyer: aDestroyer in: aRegion [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackFighter: aFighter in: aRegion [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> attackedBy: anAttackingFleet in: aRegion [

	^ anAttackingFleet attackBattleCruiser: self in: aRegion.
]

{ #category : 'initialization' }
BattleCruiser >> initialize [

	super initialize.
	name := 'Battle Cruiser'.
	shield := 1200.
	hull := 6000.
	damage := 1000.
]

{ #category : 'initialization' }
BattleCruiser >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier |
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
	damageModifier at: 'AsteroidField' put: 1.
	damageModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'damageModifier' put: damageModifier
]
