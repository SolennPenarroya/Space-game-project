Class {
	#name : 'Fighter',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
Fighter >> attack: aShip [
    aShip beAttackedByFighter: self.
]

{ #category : 'as yet unclassified' }
Fighter >> beAttackedByBattleCruiser: aBattleCruiser [
]

{ #category : 'as yet unclassified' }
Fighter >> beAttackedByCruiser: aCruiser [
]

{ #category : 'as yet unclassified' }
Fighter >> beAttackedByDestroyer: aDestroyer [
]

{ #category : 'as yet unclassified' }
Fighter >> beAttackedByFighter: aFighter [
]

{ #category : 'initialization' }
Fighter >> initialize [

	super initialize.
	name := 'Fighter'.
	shield := 100.
	hull := 400.
	damage := 50.
]

{ #category : 'initialization' }
Fighter >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier |
	super initializeRegionModifier.
	shieldModifier := regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 1.
	shieldModifier at: 'Nebula' put: 1.
	shieldModifier at: 'AsteroidField' put: 1.
	shieldModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'shieldModifier' put: shieldModifier.

	hullModifier := regionModifier at: 'hullModifier'.
	hullModifier at: 'DeepSpace' put: 0.
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
	regionModifier at: 'damageModifier' put: damageModifier
]
