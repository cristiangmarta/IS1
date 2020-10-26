!classDefinition: #MarsRoverTest category: 'ISW1 - Ejercicio 16'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CM 10/25/2020 14:10:42'!
assertExecuting: aCommandList on: aMarsRover movesItTo: aPosition facing: aCardinalPoint
	
	aMarsRover executeCommands: aCommandList.
	
	self assert: aMarsRover position equals: aPosition.
	self assert: aMarsRover facingDirection equals: aCardinalPoint.	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CM 10/25/2020 13:23:58'!
test01MarsRoverShouldBeLocatedAtLandingPosition
	| marsRover |
	
	marsRover := MarsRover landingAtX: 50 andY: 50 facing: $N.

	self assert: marsRover position equals: #(50 50).
	self assert: marsRover facingDirection equals: $N.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CM 10/25/2020 14:13:27'!
test02MarsRoverShouldNotMoveWhenGivenEmptyCommands
	
	self 
		assertExecuting: '' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(10 20) facing: $N
		
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CM 10/25/2020 14:13:58'!
test07MarsRoverExecutesManyCommandsCorrectly

	self 
		assertExecuting: 'ff' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(8 20) facing: $N
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CM 10/26/2020 11:16:06'!
test12MarsRoverStopsExecutionWhenUnknownCommandDetected
	
	|marsRover|
	
	marsRover := MarsRover landingAtX: 10 andY: 20 facing: $W.
	
	self should: [ marsRover executeCommands: 'ffbnff' ]	
		raise: Error withMessageText: MarsRover unknownCommandErrorDescription.
	
	self assert: marsRover position equals: #(10 19).
	self assert: marsRover facingDirection equals: $W.
	
	! !


!MarsRoverTest methodsFor: 'move forward tests' stamp: 'CM 10/25/2020 14:15:37'!
test03MarsRoverMovesForwardCorrectlyWhenHeadingNorth

	self 
		assertExecuting: 'f' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(9 20) facing: $N
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'CM 10/25/2020 14:15:59'!
test04MarsRoverMovesForwardCorrectlyWhenHeadingSouth

	self 
		assertExecuting: 'f' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $S)
	 	movesItTo: #(11 20) facing: $S! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'CM 10/25/2020 14:16:17'!
test05MarsRoverMovesForwardCorrectlyWhenHeadingEast

	self 
		assertExecuting: 'f' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $E)
	 	movesItTo: #(10 21) facing: $E! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'CM 10/25/2020 14:16:50'!
test06MarsRoverMovesForwardCorrectlyWhenHeadingWest

	self 
		assertExecuting: 'f' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $W)
	 	movesItTo: #(10 19) facing: $W! !


!MarsRoverTest methodsFor: 'rotate left tests' stamp: 'CM 10/25/2020 14:17:24'!
test13MarsRoverRotatesLeftCorrectlyWhenHeadingNorth
	
	self 
		assertExecuting: 'l' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(10 20) facing: $W
	! !

!MarsRoverTest methodsFor: 'rotate left tests' stamp: 'CM 10/25/2020 14:17:39'!
test14MarsRoverRotatesLeftCorrectlyWhenHeadingWest
	
	self 
		assertExecuting: 'l' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $W)
	 	movesItTo: #(10 20) facing: $S
	! !

!MarsRoverTest methodsFor: 'rotate left tests' stamp: 'CM 10/25/2020 14:17:51'!
test15MarsRoverRotatesLeftCorrectlyWhenHeadingSouth
	
	self 
		assertExecuting: 'l' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $S)
	 	movesItTo: #(10 20) facing: $E
	! !

!MarsRoverTest methodsFor: 'rotate left tests' stamp: 'CM 10/25/2020 14:17:58'!
test16MarsRoverRotatesLeftCorrectlyWhenHeadingEast
	
	self 
		assertExecuting: 'l' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $E)
	 	movesItTo: #(10 20) facing: $N
	! !


!MarsRoverTest methodsFor: 'rotate right tests' stamp: 'CM 10/25/2020 14:19:13'!
test17MarsRoverRotatesRightCorrectlyWhenHeadingNorth
	
	self 
		assertExecuting: 'r' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(10 20) facing: $E
	! !

!MarsRoverTest methodsFor: 'rotate right tests' stamp: 'CM 10/25/2020 14:19:27'!
test18MarsRoverRotatesRightCorrectlyWhenHeadingEast
	
	self 
		assertExecuting: 'r' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $E)
	 	movesItTo: #(10 20) facing: $S
	! !

!MarsRoverTest methodsFor: 'rotate right tests' stamp: 'CM 10/25/2020 14:19:34'!
test19MarsRoverRotatesRightCorrectlyWhenHeadingSouth
	
	self 
		assertExecuting: 'r' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $S)
	 	movesItTo: #(10 20) facing: $W
	! !

!MarsRoverTest methodsFor: 'rotate right tests' stamp: 'CM 10/25/2020 14:19:43'!
test20MarsRoverRotatesRightCorrectlyWhenHeadingWest
	
	self 
		assertExecuting: 'r' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $W)
	 	movesItTo: #(10 20) facing: $N
	! !

!MarsRoverTest methodsFor: 'rotate right tests' stamp: 'CM 10/26/2020 12:50:39'!
test21MarsRoverCanNotBeCreatedWithInvalidCardinalPoint
	
	self should: [ MarsRover landingAtX: 10 andY: 20 facing: $P ] 
		raise: Error withMessageText: MarsRover invalidCardinalPointErrorDescription
		
	! !


!MarsRoverTest methodsFor: 'move backward tests' stamp: 'CM 10/25/2020 14:20:13'!
test08MarsRoverMovesBackwardCorrectlyWhenHeadingNorth

	self 
		assertExecuting: 'b' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $N)
	 	movesItTo: #(11 20) facing: $N
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'CM 10/25/2020 14:20:31'!
test09MarsRoverMovesBackwardCorrectlyWhenHeadingEast

	self 
		assertExecuting: 'b' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $E)
	 	movesItTo: #(10 19) facing: $E
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'CM 10/25/2020 14:20:47'!
test10MarsRoverMovesBackwardCorrectlyWhenHeadingSouth

	self 
		assertExecuting: 'b' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $S)
	 	movesItTo: #(9 20) facing: $S
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'CM 10/25/2020 14:20:59'!
test11MarsRoverMovesBackwardCorrectlyWhenHeadingWest

	self 
		assertExecuting: 'b' 
		on: (MarsRover landingAtX: 10 andY: 20 facing: $W)
	 	movesItTo: #(10 21) facing: $W
	! !


!classDefinition: #MarsRover category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinateX coordinateY facingDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRover methodsFor: 'initialization' stamp: 'CM 10/26/2020 12:57:20'!
initializeLandingAtX: startingCoordinateX andY: startingCoordinateY facing: aCardinalPoint 
	
	coordinateX := startingCoordinateX.
	coordinateY := startingCoordinateY.
	facingDirection := aCardinalPoint.
	
	self checkIfStateIsValid.! !


!MarsRover methodsFor: 'accessing' stamp: 'CM 10/25/2020 13:37:17'!
facingDirection
	^ facingDirection .! !

!MarsRover methodsFor: 'accessing' stamp: 'CM 10/25/2020 11:33:58'!
position
	^ Array with: coordinateX  with: coordinateY.! !


!MarsRover methodsFor: 'private' stamp: 'CM 10/26/2020 12:57:40'!
checkIfStateIsValid

	self state! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 11:59:28'!
moveEast

	coordinateY := coordinateY + 1.! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 13:37:17'!
moveFaceTo: aCardinalPoint

	facingDirection := aCardinalPoint.! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 11:53:05'!
moveNorth

	coordinateX := coordinateX - 1.! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 11:53:13'!
moveSouth

	coordinateX := coordinateX + 1.! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 12:02:04'!
moveWest

	coordinateY := coordinateY - 1.! !

!MarsRover methodsFor: 'private' stamp: 'CM 10/25/2020 11:54:03'!
state

	^ MarsRoverState stateFor: self.! !


!MarsRover methodsFor: 'private - actions' stamp: 'CM 10/25/2020 13:39:03'!
moveBackward

	^ self state moveBackward.! !

!MarsRover methodsFor: 'private - actions' stamp: 'CM 10/25/2020 13:39:06'!
moveForward

	^ self state moveForward.! !

!MarsRover methodsFor: 'private - actions' stamp: 'CM 10/25/2020 12:50:35'!
rotateLeft

	^ self state rotateLeft.! !

!MarsRover methodsFor: 'private - actions' stamp: 'CM 10/25/2020 12:57:15'!
rotateRight

	^ self state rotateRight.! !


!MarsRover methodsFor: 'command execution' stamp: 'CM 10/26/2020 11:09:36'!
executeCommands: aCommandList 
	
	aCommandList do: [ :aCommand | 
		(MarsRoverCommand for: aCommand) executeOn: self.
	]




	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'ISW1 - Ejercicio 16'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'CM 10/25/2020 13:06:42'!
landingAtX: startingCoordinateX andY: startingCoordinateY facing: aCardinalPoint 
	
	^self new initializeLandingAtX: startingCoordinateX andY: startingCoordinateY facing: aCardinalPoint ! !


!MarsRover class methodsFor: 'error messages' stamp: 'CM 10/26/2020 12:51:32'!
invalidCardinalPointErrorDescription
	^ 'Invalid cardinal point'.! !

!MarsRover class methodsFor: 'error messages' stamp: 'CM 10/26/2020 11:16:39'!
unknownCommandErrorDescription

	^ 'Unknown command detected'.! !


!classDefinition: #MarsRoverCommand category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverCommand methodsFor: 'execution' stamp: 'CM 10/25/2020 12:37:18'!
executeOn: aMarsRover
	
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'subclass selection' stamp: 'CM 10/25/2020 12:33:41'!
canHandle: aCommand

	self subclassResponsibility .! !

!MarsRoverCommand class methodsFor: 'subclass selection' stamp: 'CM 10/26/2020 11:18:56'!
for: aCommand

	^(self subclasses detect: [:aMarsRoverCommandClass | aMarsRoverCommandClass canHandle: aCommand ] 
				   ifNone: [ self error: MarsRover unknownCommandErrorDescription . ]) new! !


!classDefinition: #MarsRoverMoveBackwardCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverMoveBackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverMoveBackwardCommand methodsFor: 'execution' stamp: 'CM 10/25/2020 12:39:12'!
executeOn: aMarsRover
	
	aMarsRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMoveBackwardCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverMoveBackwardCommand class
	instanceVariableNames: ''!

!MarsRoverMoveBackwardCommand class methodsFor: 'subclass selection' stamp: 'CM 10/25/2020 13:24:32'!
canHandle: aCommand
	
	^ aCommand = $b.! !


!classDefinition: #MarsRoverMoveForwardCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverMoveForwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverMoveForwardCommand methodsFor: 'execution' stamp: 'CM 10/25/2020 12:38:50'!
executeOn: aMarsRover
	
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMoveForwardCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverMoveForwardCommand class
	instanceVariableNames: ''!

!MarsRoverMoveForwardCommand class methodsFor: 'subclass selection' stamp: 'CM 10/25/2020 13:24:36'!
canHandle: aCommand
	
	^ aCommand = $f.! !


!classDefinition: #MarsRoverRotateLeftCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverRotateLeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverRotateLeftCommand methodsFor: 'execution' stamp: 'CM 10/25/2020 12:51:15'!
executeOn: aMarsRover
	
	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverRotateLeftCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverRotateLeftCommand class
	instanceVariableNames: ''!

!MarsRoverRotateLeftCommand class methodsFor: 'subclass selection' stamp: 'CM 10/25/2020 13:24:41'!
canHandle: aCommand
	
	^ aCommand = $l.! !


!classDefinition: #MarsRoverRotateRightCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverRotateRightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverRotateRightCommand methodsFor: 'execution' stamp: 'CM 10/25/2020 12:56:35'!
executeOn: aMarsRover
	
	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverRotateRightCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverRotateRightCommand class
	instanceVariableNames: ''!

!MarsRoverRotateRightCommand class methodsFor: 'subclass selection' stamp: 'CM 10/25/2020 13:24:44'!
canHandle: aCommand
	
	^ aCommand = $r.! !


!classDefinition: #MarsRoverState category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverState methodsFor: 'initialization' stamp: 'CM 10/25/2020 13:31:36'!
initializeFor: aMarsRover
	
	marsRover := aMarsRover.! !


!MarsRoverState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:32:49'!
moveBackward
	
	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:32:46'!
moveForward
	
	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:32:43'!
rotateLeft
	
	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:32:40'!
rotateRight
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: 'ISW1 - Ejercicio 16'!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'instance creation' stamp: 'CM 10/25/2020 13:30:27'!
for: aMarsRover

	^ self new initializeFor: aMarsRover.! !


!MarsRoverState class methodsFor: 'state selection' stamp: 'CM 10/25/2020 13:30:31'!
canHandle: aMarsRover

	self subclassResponsibility.! !

!MarsRoverState class methodsFor: 'state selection' stamp: 'CM 10/26/2020 12:54:31'!
stateFor: aMarsRover

	^(self subclasses detect: [ :aMarsRoverStateClass | aMarsRoverStateClass canHandle: aMarsRover ] 
					ifNone: [ self error: MarsRover invalidCardinalPointErrorDescription ]
		) for: aMarsRover.! !


!classDefinition: #MarsRoverFacingEastState category: 'ISW1 - Ejercicio 16'!
MarsRoverState subclass: #MarsRoverFacingEastState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverFacingEastState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:22:10'!
moveBackward

	marsRover moveWest.! !

!MarsRoverFacingEastState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 11:59:09'!
moveForward

	marsRover moveEast.! !

!MarsRoverFacingEastState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateLeft

	marsRover moveFaceTo: $N.! !

!MarsRoverFacingEastState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateRight

	marsRover moveFaceTo: $S.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingEastState class' category: 'ISW1 - Ejercicio 16'!
MarsRoverFacingEastState class
	instanceVariableNames: ''!

!MarsRoverFacingEastState class methodsFor: 'state selection' stamp: 'CM 10/25/2020 13:23:58'!
canHandle: aMarsRover

	^ aMarsRover facingDirection = $E.! !


!classDefinition: #MarsRoverFacingNorthState category: 'ISW1 - Ejercicio 16'!
MarsRoverState subclass: #MarsRoverFacingNorthState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverFacingNorthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:22:06'!
moveBackward

	marsRover moveSouth.! !

!MarsRoverFacingNorthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 11:50:45'!
moveForward

	marsRover moveNorth.! !

!MarsRoverFacingNorthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateLeft

	marsRover moveFaceTo: $W.! !

!MarsRoverFacingNorthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateRight

	marsRover moveFaceTo: $E.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingNorthState class' category: 'ISW1 - Ejercicio 16'!
MarsRoverFacingNorthState class
	instanceVariableNames: ''!

!MarsRoverFacingNorthState class methodsFor: 'state selection' stamp: 'CM 10/25/2020 13:23:58'!
canHandle: aMarsRover

	^ aMarsRover facingDirection = $N! !


!classDefinition: #MarsRoverFacingSouthState category: 'ISW1 - Ejercicio 16'!
MarsRoverState subclass: #MarsRoverFacingSouthState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverFacingSouthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:34:36'!
moveBackward

	marsRover moveNorth.! !

!MarsRoverFacingSouthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 11:52:30'!
moveForward

	marsRover moveSouth.! !

!MarsRoverFacingSouthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateLeft

	marsRover moveFaceTo: $E.! !

!MarsRoverFacingSouthState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateRight

	marsRover moveFaceTo: $W.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingSouthState class' category: 'ISW1 - Ejercicio 16'!
MarsRoverFacingSouthState class
	instanceVariableNames: ''!

!MarsRoverFacingSouthState class methodsFor: 'state selection' stamp: 'CM 10/25/2020 13:23:58'!
canHandle: aMarsRover

	^ aMarsRover facingDirection = $S.! !


!classDefinition: #MarsRoverFacingWestState category: 'ISW1 - Ejercicio 16'!
MarsRoverState subclass: #MarsRoverFacingWestState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverFacingWestState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:22:22'!
moveBackward

	marsRover moveEast.! !

!MarsRoverFacingWestState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 12:01:36'!
moveForward

	marsRover moveWest.! !

!MarsRoverFacingWestState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateLeft

	marsRover moveFaceTo: $S.! !

!MarsRoverFacingWestState methodsFor: 'mars-rover actions' stamp: 'CM 10/25/2020 13:35:21'!
rotateRight

	marsRover moveFaceTo: $N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingWestState class' category: 'ISW1 - Ejercicio 16'!
MarsRoverFacingWestState class
	instanceVariableNames: ''!

!MarsRoverFacingWestState class methodsFor: 'state selection' stamp: 'CM 10/25/2020 13:23:58'!
canHandle: aMarsRover

	^ aMarsRover facingDirection = $W.! !
