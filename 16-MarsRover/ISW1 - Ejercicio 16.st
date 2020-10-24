!classDefinition: #XXTest category: 'ISW1 - Ejercicio 16'!
TestCase subclass: #XXTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!XXTest methodsFor: 'multiple' stamp: 'CM 10/24/2020 18:36:47'!
test20
	self assertExecuting: 'ff' whenHeading: $S movesRoverTo: #(12 20) pointing: $S.! !

!XXTest methodsFor: 'multiple' stamp: 'CM 10/24/2020 18:36:52'!
test21
	self assertExecuting: 'ffgff' whenHeading: $S movesRoverTo: #(12 20) pointing: $S.! !


!XXTest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:10:37'!
assertExecuting: aCommandList whenHeading: aCardinalPoint movesRoverTo: aPosition pointing: anotherCardinalPoint
	| marsRover |
	marsRover := MarsRover atX: 10 atY: 20 heading: aCardinalPoint .
	
	marsRover executeCommands: aCommandList.
	
	self assert: marsRover position equals: aPosition.
	self assert: marsRover direction equals: anotherCardinalPoint .! !

!XXTest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 16:57:39'!
test01
	| marsRover |
	marsRover := MarsRover atX: 50 atY: 50 heading: $N.
	
	self assert: marsRover position equals: #(50 50).
	self assert: marsRover direction equals: $N.! !

!XXTest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:01:30'!
test02
	| marsRover |
	marsRover := MarsRover atX: 10 atY: 20 heading: $E.
	
	self assert: marsRover position equals: #(10 20).
	self assert: marsRover direction equals: $E.! !

!XXTest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:11:34'!
test03
	
	self assertExecuting: '' whenHeading: $E movesRoverTo: #(10 20) pointing: $E.
! !


!XXTest methodsFor: 'forward' stamp: 'CM 10/24/2020 18:12:12'!
test04
	
	self assertExecuting: 'f' whenHeading: $E movesRoverTo: #(10 21) pointing: $E.
! !

!XXTest methodsFor: 'forward' stamp: 'CM 10/24/2020 18:12:36'!
test05
	self assertExecuting: 'f' whenHeading: $S movesRoverTo: #(11 20) pointing: $S.
	! !

!XXTest methodsFor: 'forward' stamp: 'CM 10/24/2020 18:15:25'!
test10
	
	self assertExecuting: 'f' whenHeading: $N movesRoverTo: #(9 20) pointing: $N.
	! !

!XXTest methodsFor: 'forward' stamp: 'CM 10/24/2020 18:15:47'!
test11
	self assertExecuting: 'f' whenHeading: $O movesRoverTo: #(10 19) pointing: $O.! !


!XXTest methodsFor: 'backwards' stamp: 'CM 10/24/2020 18:13:50'!
test06
	self assertExecuting: 'b' whenHeading: $O movesRoverTo: #(10 21) pointing: $O.
	! !

!XXTest methodsFor: 'backwards' stamp: 'CM 10/24/2020 18:14:26'!
test07
	self assertExecuting: 'b' whenHeading: $E movesRoverTo: #(10 19) pointing: $E.
	! !

!XXTest methodsFor: 'backwards' stamp: 'CM 10/24/2020 18:14:43'!
test08
	self assertExecuting: 'b' whenHeading: $N movesRoverTo: #(11 20) pointing: $N.
	! !

!XXTest methodsFor: 'backwards' stamp: 'CM 10/24/2020 18:15:03'!
test09
	self assertExecuting: 'b' whenHeading: $S movesRoverTo: #(9 20) pointing: $S.
	! !


!XXTest methodsFor: 'rotateRight' stamp: 'CM 10/24/2020 18:26:11'!
test16
	self assertExecuting: 'r' whenHeading: $N movesRoverTo: #(10 20) pointing: $E.! !

!XXTest methodsFor: 'rotateRight' stamp: 'CM 10/24/2020 18:27:23'!
test17
	self assertExecuting: 'r' whenHeading: $E movesRoverTo: #(10 20) pointing: $S.! !

!XXTest methodsFor: 'rotateRight' stamp: 'CM 10/24/2020 18:28:02'!
test18
	self assertExecuting: 'r' whenHeading: $S movesRoverTo: #(10 20) pointing: $O.! !

!XXTest methodsFor: 'rotateRight' stamp: 'CM 10/24/2020 18:28:35'!
test19
	self assertExecuting: 'r' whenHeading: $O movesRoverTo: #(10 20) pointing: $N.! !


!XXTest methodsFor: 'rotateLeft' stamp: 'CM 10/24/2020 18:18:01'!
test12

	self assertExecuting: 'l' whenHeading: $N movesRoverTo: #(10 20) pointing: $O.! !

!XXTest methodsFor: 'rotateLeft' stamp: 'CM 10/24/2020 18:23:23'!
test13

	self assertExecuting: 'l' whenHeading: $O movesRoverTo: #(10 20) pointing: $S.! !

!XXTest methodsFor: 'rotateLeft' stamp: 'CM 10/24/2020 18:24:08'!
test14

	self assertExecuting: 'l' whenHeading: $S movesRoverTo: #(10 20) pointing: $E.! !

!XXTest methodsFor: 'rotateLeft' stamp: 'CM 10/24/2020 18:24:44'!
test15

	self assertExecuting: 'l' whenHeading: $E movesRoverTo: #(10 20) pointing: $N.! !


!classDefinition: #MarsRover category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinateX coordinateY cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:39:41'!
direction
	^ cardinalPoint direction.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:07:44'!
executeCommands: aString 
	
	aString do: [ :aCharacter |
		((MarsRoverCommand subclasses detect: [:aSubClass | aSubClass canHandle: aCharacter ]) for: self) execute
		ifFalse: [
			^self
		].
	]	
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:55:50'!
moveBackwards
	
	cardinalPoint moveBackwards.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:45:12'!
moveEast
	
	coordinateY := coordinateY + 1.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:01:15'!
moveForward
	
	cardinalPoint moveForward.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:45:30'!
moveNorth
	
	coordinateX := coordinateX - 1.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:45:37'!
moveSouth
	
	coordinateX := coordinateX + 1.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:45:22'!
moveWest
	
	coordinateY := coordinateY - 1.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:04:54'!
position
	^ Array with: coordinateX with: coordinateY.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:56:04'!
rotateLeft
	
	cardinalPoint rotateLeft.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:56:12'!
rotateRight
	
	cardinalPoint rotateRight.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:23:02'!
setCardinalPointTo: aMarsRoverPointingSubclass
	cardinalPoint := aMarsRoverPointingSubclass for: self.! !


!MarsRover methodsFor: 'initialization' stamp: 'CM 10/24/2020 17:46:41'!
initializeAtX: aSmallInteger atY: aSmallInteger2 heading: aCardinalPoint 
	
	coordinateX := aSmallInteger.
	coordinateY := aSmallInteger2.
	
	cardinalPoint := (MarsRoverCardinalPoint subclasses detect: [:aSubClass | aSubClass canHandle: aCardinalPoint ]) for: self.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'ISW1 - Ejercicio 16'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'CM 10/24/2020 17:00:55'!
atX: coordinateX atY: coordinateY heading: aCardinalPoint 
	
	^self new initializeAtX: coordinateX atY: coordinateY heading: aCardinalPoint ! !


!classDefinition: #MarsRoverCardinalPoint category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRoverCardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:40:24'!
direction

	self subclassResponsibility .! !

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:47:31'!
initializeFor: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:04:41'!
moveBackwards
	
	self subclassResponsibility .! !

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:30:00'!
moveForward
	
	self subclassResponsibility .! !

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:25:30'!
rotateLeft
	
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCardinalPoint class' category: 'ISW1 - Ejercicio 16'!
MarsRoverCardinalPoint class
	instanceVariableNames: ''!

!MarsRoverCardinalPoint class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:32:41'!
canHandle: aMarsRover

	^ self subclassResponsibility.
	! !

!MarsRoverCardinalPoint class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:47:09'!
for: aMarsRover

	^ self new initializeFor: aMarsRover! !


!classDefinition: #MarsRoverPointingEast category: 'ISW1 - Ejercicio 16'!
MarsRoverCardinalPoint subclass: #MarsRoverPointingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:39:58'!
direction
	
	^ $E.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:02:41'!
moveBackwards

	marsRover moveWest.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:28:54'!
moveForward
	
	marsRover moveEast.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:25:13'!
rotateLeft
	marsRover setCardinalPointTo: MarsRoverPointingNorth.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:27:45'!
rotateRight
	marsRover setCardinalPointTo: MarsRoverPointingSouth .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPointingEast class' category: 'ISW1 - Ejercicio 16'!
MarsRoverPointingEast class
	instanceVariableNames: ''!

!MarsRoverPointingEast class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:35:41'!
canHandle: aCardinalPoint

	^ aCardinalPoint = $E! !


!classDefinition: #MarsRoverPointingNorth category: 'ISW1 - Ejercicio 16'!
MarsRoverCardinalPoint subclass: #MarsRoverPointingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:40:06'!
direction
	
	^ $N.! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:03:26'!
moveBackwards
	marsRover moveSouth.! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:29:15'!
moveForward
	
	marsRover moveNorth.! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:22:15'!
rotateLeft
	marsRover setCardinalPointTo: MarsRoverPointingWest.! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:27:11'!
rotateRight
	marsRover setCardinalPointTo: MarsRoverPointingEast .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPointingNorth class' category: 'ISW1 - Ejercicio 16'!
MarsRoverPointingNorth class
	instanceVariableNames: ''!

!MarsRoverPointingNorth class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:36:00'!
canHandle: aCardinalPoint

	^ aCardinalPoint = $N! !


!classDefinition: #MarsRoverPointingSouth category: 'ISW1 - Ejercicio 16'!
MarsRoverCardinalPoint subclass: #MarsRoverPointingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:40:12'!
direction
	
	^ $S.! !

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:29:32'!
moveForward
	
	marsRover moveSouth.! !

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:24:29'!
rotateLeft
	marsRover setCardinalPointTo: MarsRoverPointingEast .! !

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:28:17'!
rotateRight
	marsRover setCardinalPointTo: MarsRoverPointingWest ! !


!MarsRoverPointingSouth methodsFor: 'accessing' stamp: 'CM 10/24/2020 18:04:23'!
moveBackwards
	marsRover moveNorth .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPointingSouth class' category: 'ISW1 - Ejercicio 16'!
MarsRoverPointingSouth class
	instanceVariableNames: ''!

!MarsRoverPointingSouth class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:36:07'!
canHandle: aCardinalPoint

	^ aCardinalPoint = $S! !


!classDefinition: #MarsRoverPointingWest category: 'ISW1 - Ejercicio 16'!
MarsRoverCardinalPoint subclass: #MarsRoverPointingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:40:17'!
direction
	
	^ $O.! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:55:37'!
moveBackwards

	marsRover moveEast.! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:29:43'!
moveForward
	
	marsRover moveWest.! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:23:53'!
rotateLeft
	marsRover setCardinalPointTo: MarsRoverPointingSouth .! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:28:51'!
rotateRight
	marsRover setCardinalPointTo: MarsRoverPointingNorth .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPointingWest class' category: 'ISW1 - Ejercicio 16'!
MarsRoverPointingWest class
	instanceVariableNames: ''!

!MarsRoverPointingWest class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 17:36:14'!
canHandle: aCardinalPoint

	^ aCardinalPoint = $O! !


!classDefinition: #MarsRoverCommand category: 'ISW1 - Ejercicio 16'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:59:45'!
initializeFor: aMarsRover

	marsRover := aMarsRover .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:45:55'!
canHandle: aMarsRover

	^ self subclassResponsibility.! !

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:00:21'!
for: aMarsRover

	^ self new initializeFor: aMarsRover.! !


!classDefinition: #MarsRoverBackwardCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverBackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverBackwardCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:08:06'!
execute
	
	marsRover moveBackwards .
	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverBackwardCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverBackwardCommand class
	instanceVariableNames: ''!

!MarsRoverBackwardCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:54:32'!
canHandle: aCommand

	^ aCommand = $b! !


!classDefinition: #MarsRoverFordwardCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverFordwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverFordwardCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:08:13'!
execute
	
	marsRover moveForward.
	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFordwardCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverFordwardCommand class
	instanceVariableNames: ''!

!MarsRoverFordwardCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:52:20'!
canHandle: aCommand

	^ aCommand = $f! !


!classDefinition: #MarsRoverRotateLeftCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverRotateLeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverRotateLeftCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:08:16'!
execute
	
	marsRover rotateLeft .
	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverRotateLeftCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverRotateLeftCommand class
	instanceVariableNames: ''!

!MarsRoverRotateLeftCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:54:54'!
canHandle: aCommand

	^ aCommand = $l! !


!classDefinition: #MarsRoverRotateRightCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverRotateRightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverRotateRightCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:08:20'!
execute
	
	marsRover rotateRight .
	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverRotateRightCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverRotateRightCommand class
	instanceVariableNames: ''!

!MarsRoverRotateRightCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 18:55:26'!
canHandle: aCommand

	^ aCommand = $r! !


!classDefinition: #MarsRoverWrongCommand category: 'ISW1 - Ejercicio 16'!
MarsRoverCommand subclass: #MarsRoverWrongCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1 - Ejercicio 16'!

!MarsRoverWrongCommand methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:08:27'!
execute
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWrongCommand class' category: 'ISW1 - Ejercicio 16'!
MarsRoverWrongCommand class
	instanceVariableNames: ''!

!MarsRoverWrongCommand class methodsFor: 'as yet unclassified' stamp: 'CM 10/24/2020 19:06:24'!
canHandle: aCommand
	|x|
	x := Set with: $r with: $l with: $f with: $b.
	^ (x includes: aCommand) not! !
