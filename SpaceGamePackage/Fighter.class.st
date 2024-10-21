Class {
	#name : 'Fighter',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Fighter >> initialize [

	super initialize.
	name := 'Fighter'.
	shield := 100.
	hull := 400.
	damage := 50.
	regionModifier := self initializeRegionModifier
]
