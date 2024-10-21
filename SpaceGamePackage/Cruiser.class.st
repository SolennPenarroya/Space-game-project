Class {
	#name : 'Cruiser',
	#superclass : 'Ship',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'initialization' }
Cruiser >> initialize [
	super initialize.
	name := 'Cruiser'.
	shield := 1000.
	hull := 8000.
	damage := 400.
]
