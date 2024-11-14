Class {
	#name : 'Battle',
	#superclass : 'Object',
	#instVars : [
		'fleetA',
		'fleetB',
		'turn',
		'battleLogs',
		'nbShipsFleetBLost',
		'nbShipsFleetALost'
	],
	#category : 'SpaceGamePackage',
	#package : 'SpaceGamePackage'
}

{ #category : 'adding' }
Battle >> addLogResult [

	nbShipsFleetALost := nbShipsFleetALost - fleetA ships size.
	nbShipsFleetBLost := nbShipsFleetBLost - fleetB ships size.
	self logBattle: '--------RESULT----------'.
	self logBattle: String cr.
	nbShipsFleetALost > 0 ifTrue: [
		self logBattle:'Fleet A has ' , nbShipsFleetALost asString , ' ship(s) lost'.
		self logBattle: String cr.].
	fleetA isDestroyed
	ifTrue: [ 
		self logBattle: 'Fleet A has been defeated.']
	ifFalse: [ 
		self logBattle: fleetA asString].
	self logBattle: String cr.
	self logBattle: '-----------------------'.
	self logBattle: String cr.
	nbShipsFleetBLost > 0 ifTrue: [
		self logBattle:'Fleet B has ' , nbShipsFleetBLost asString , ' ship(s) lost'.
		self logBattle: String cr.].
	fleetB isDestroyed
		ifTrue: [ self logBattle: 'Fleet B has been defeated.' ]
		ifFalse: [ self logBattle: fleetB asString].
	self logBattle: String cr.
	self logBattle: '-----------------------'.
	self logBattle: String cr
]

{ #category : 'adding' }
Battle >> addLogStart [

	self logBattle: '------START BATTLE-------'.
	self logBattle: String cr.
	self logBattle: 'fleetA'.
	self logBattle: String cr.
	self logBattle: fleetA asString.
	self logBattle: String cr.
	self logBattle: '-----------------------'.
	self logBattle: String cr.
	self logBattle: 'fleetB'.
	self logBattle: String cr.
	self logBattle: fleetB asString.
	self logBattle: String cr
]

{ #category : 'as yet unclassified' }
Battle >> addLogTurn [

	self logBattle: '----------------------------------- '.
	self logBattle: String cr.
	self logBattle: 'turn: '.
	self logBattle: turn.
	self logBattle: String cr.
	self logBattle: 'Fleet A -> Fleet B '.
	self logBattle: String cr.
	self logBattle: 'Ship def: '.
	self logBattle: fleetA asString.
	self logBattle: String cr.
	self logBattle: 'Fleet B -> Fleet A '.
	self logBattle: String cr.
	self logBattle: 'Ship def: '.
	self logBattle: fleetB asString.
	self logBattle: String cr
]

{ #category : 'accessing' }
Battle >> battleLogs [ [
        ^ battleLogs
    ]
]

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
	battleLogs := OrderedCollection new.
	nbShipsFleetALost := fleetA ships size.
	nbShipsFleetBLost := fleetB ships size.
	self startBattle
]

{ #category : 'as yet unclassified' }
Battle >> logBattle: aLogEntry [

	battleLogs add: aLogEntry
]

{ #category : 'printing' }
Battle >> printOn: aStream [

	battleLogs do: [ :logEntry | logEntry printOn: aStream ]
]

{ #category : 'as yet unclassified' }
Battle >> startBattle [

	| defender |
	self addLogStart.
	[ fleetA isDestroyed or: [ fleetB isDestroyed or: [ turn > 3 ] ] ]
		whileFalse: [
			fleetA ships do: [ :attacker |
				defender := fleetB ships first.
				defender attackedBy: attacker in: defender region ].
			fleetB ships do: [ :attacker |
				defender := fleetA ships first.
				defender attackedBy: attacker in: defender region ].
			self addLogTurn.
			turn := turn + 1 ].
	self addLogResult
]

{ #category : 'accessing' }
Battle >> turn [
	^ turn.
]
