Class {
	#name : 'Battle',
	#superclass : 'Object',
	#instVars : [
		'fleetA',
		'fleetB',
		'turn'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'accessing' }
Battle >> fleetA [

	^ fleetA
]

{ #category : 'accessing' }
Battle >> fleetB [

	^ fleetB
]

{ #category : 'initialization' }
Battle >> initializeWith: fleetOne versus: fleetTwo [

	super initialize.
	fleetA := fleetOne.
	fleetB := fleetTwo.
	turn := 1.
	self startBattle.
]

{ #category : 'as yet unclassified' }
Battle >> startBattle [

	| attacker defender sizeFleetA sizeFleetB|
	sizeFleetA := fleetA size.
	sizeFleetB := fleetB size.
	[ fleetA isDestroyed or: [ fleetB isDestroyed or: [ turn >= 3 ] ] ]
		whileFalse: [
			attacker := fleetA ships atRandom.
			defender := fleetB ships first.
			defender attackedBy: attacker in: defender region.
			"swap"
			attacker := fleetB ships atRandom.
			defender := fleetA ships first.
			defender attackedBy: attacker in: defender region.
			turn := turn + 1 ].
	
	sizeFleetA := sizeFleetA - fleetA size.
	sizeFleetB := sizeFleetB - fleetB size.
	
	sizeFleetA > 0 ifTrue: [ Transcript nextPutAll: 'Fleet A has ' , sizeFleetA asString; nextPutAll: 'remaining ships'; cr].
	sizeFleetA = 0 ifTrue: [ Transcript nextPutAll: 'Fleet A has been defeated, no ship remaining'; cr].
	
	sizeFleetB > 0 ifTrue: [ Transcript nextPutAll: 'Fleet B has ' , sizeFleetB asString; nextPutAll: 'remaining ships'; cr].
	sizeFleetB = 0 ifTrue: [ Transcript nextPutAll: 'Fleet B has been defeated, no ship remaining'; cr].
	
	fleetA isDestroyed ifTrue: [
		Transcript
			show: 'Fleet A has been defeated.';
			cr ].
	fleetB isDestroyed ifTrue: [
		Transcript
			show: 'Fleet B has been defeated.';
			cr ].
	turn = 3 ifTrue: [
		Transcript
			show: 'No one has won.';
			cr ]
]

{ #category : 'accessing' }
Battle >> turn [
	^ turn.
]
