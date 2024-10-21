Class {
	#name : 'BattleCruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'as yet unclassified' }
BattleCruiser >> attack: aShip [
    aShip beAttackedByBattleCruiser: self.
]

{ #category : 'as yet unclassified' }
BattleCruiser >> beAttackedByBattleCruiser: aBattleCruiser [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> beAttackedByCruiser: aCruiser [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> beAttackedByDestroyer: aDestroyer [
]

{ #category : 'as yet unclassified' }
BattleCruiser >> beAttackedByFighter: aFighter [
]

{ #category : 'initialization' }
BattleCruiser >> initialize [

	super initialize.
	name := 'Battle Cruiser'.
	shield := 1200.
	hull := 6000.
	damage := 1000.
	regionModifier := self initializeRegionModifier
]

{ #category : 'initialization' }
BattleCruiser >> initializeRegionModifier [

	| shieldModifier hullModifier damageModifier precisionModifier |
	shieldModifier = regionModifier at: 'shieldModifier'.
	shieldModifier at: 'DeepSpace' put: 1.
	shieldModifier at: 'Nebula' put: 1.
	shieldModifier at: 'AsteroidField' put: 1.
	shieldModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'shieldModifier' put: shieldModifier.

	hullModifier = regionModifier at: 'hullModifier'.
	hullModifier at: 'DeepSpace' put: 1.
	hullModifier at: 'Nebula' put: 1.
	hullModifier at: 'AsteroidField' put: 1.
	hullModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'hullModifier' put: hullModifier.

	precisionModifier = regionModifier at: 'precisionModifier'.
	precisionModifier at: 'DeepSpace' put: 1.
	precisionModifier at: 'Nebula' put: 1.
	precisionModifier at: 'AsteroidField' put: 1.
	precisionModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'precisionModifier' put: precisionModifier.

	damageModifier = regionModifier at: 'damageModifier'.
	damageModifier at: 'DeepSpace' put: 1.
	damageModifier at: 'Nebula' put: 1.
	damageModifier at: 'AsteroidField' put: 1.
	damageModifier at: 'InhabitedSolarSystem' put: 1.
	regionModifier at: 'damageModifier' put: damageModifier
]
