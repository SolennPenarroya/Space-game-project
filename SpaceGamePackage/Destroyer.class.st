Class {
	#name : 'Destroyer',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Destroyer >> initialize [

	super initialize.
	name := 'Destroyer'.
	shield := 5000.
	hull := 10000.
	damage := 2000.
	regionModifier := self initializeRegionModifier
]
