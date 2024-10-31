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

	| defender sizeFleetA sizeFleetB |
	sizeFleetA := fleetA ships size.
	sizeFleetB := fleetB ships size.

	[ fleetA isDestroyed or: [ fleetB isDestroyed or: [ turn > 3 ] ] ]
		whileFalse: [
			Transcript
			nextPutAll: '----------------------------------- ';
				cr;
				nextPutAll: 'turn: ';
				print: turn asString;
				cr;
				nextPutAll: '----------------------------------- ';
				cr. 
				
			fleetA ships do: [ :attacker |
				defender := fleetB ships first.
				defender attackedBy: attacker in: defender region ].

			Transcript
				nextPutAll: 'Fleet A -> Fleet B ';
				cr;
				nextPutAll: 'Ship def: ';
				print: defender;
				cr.

			fleetB ships do: [ :attacker |
				defender := fleetA ships first.
				defender attackedBy: attacker in: defender region ].

			Transcript
				nextPutAll: 'Fleet B -> Fleet A ';
				cr;
				nextPutAll: 'Ship def: ';
				print: defender;
				cr.
				turn := turn + 1.].

	sizeFleetA := sizeFleetA - fleetA ships size.
	sizeFleetB := sizeFleetB - fleetB ships size.

	sizeFleetA > 0 ifTrue: [
		Transcript
			nextPutAll: 'Fleet A has ' , sizeFleetA asString;
			nextPutAll: ' ship(s) lost';
			cr ].

	sizeFleetB > 0 ifTrue: [
		Transcript
			nextPutAll: 'Fleet B has ' , sizeFleetB asString;
			nextPutAll: ' ship(s) lost';
			cr ].

	fleetA isDestroyed ifTrue: [
		Transcript
			show: 'Fleet A has been defeated.';
			cr ].
	fleetB isDestroyed ifTrue: [
		Transcript
			show: 'Fleet B has been defeated.';
			cr ].
	turn = 4 ifTrue: [
		Transcript
			show: 'No one has won.';
			cr ]
]

{ #category : 'accessing' }
Battle >> turn [
	^ turn.
]
