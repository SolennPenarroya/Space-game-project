Class {
	#name : 'BattleCruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
BattleCruiser >> initialize [

	super initialize.
	name := 'Battle Cruiser'.
	shield := 1200.
	hull := 6000.
	damage := 1000
]
