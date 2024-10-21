Class {
	#name : 'SpaceGameTest',
	#superclass : 'TestCase',
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'tests' }
SpaceGameTest >> testNebulaHasRightName [

	| n |
	n := Nebula new.
	self assert: n name equals: 'Nebula'
]
