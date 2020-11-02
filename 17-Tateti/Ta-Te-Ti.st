!classDefinition: #TatetiTest category: #'Ta-Te-Ti'!
TestCase subclass: #TatetiTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:09:30'!
test01gameIsCreatedWithoutPiecesOnBoard
|tateti|
	tateti:=Tateti createGame.
	self assert: (tateti isEmpty).! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:10:20'!
test02CanAddPiecesToBoardAndBoardIsNotEmpty
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 2@3.
	self deny: (tateti isEmpty).! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 07:34:05'!
test03CanNotAddPieceToBoardInAlreadyTakenSpot
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 2@3.
	self should:  [tateti addPieceAt: 2@3]  raise: Error withMessageText:  Tateti alreadyTakenErrorDescription. ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:26:27'!
test04CanNotAddPieceBelowTheBoard
self shouldRaiseOutsideOfBoundsWhenAddingPieceAt: 4@3! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:26:40'!
test05CanNotAddPieceOnTheRightOfTheBoard
self shouldRaiseOutsideOfBoundsWhenAddingPieceAt: 3@4! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:26:52'!
test06CanNotAddPieceOnTheLeftOfTheBoard
self shouldRaiseOutsideOfBoundsWhenAddingPieceAt: 2@0! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:27:15'!
test07CanNotAddPieceAboveOfTheBoard
self shouldRaiseOutsideOfBoundsWhenAddingPieceAt: 0@2! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:15:39'!
test08PlayerXStartsPlaying
|tateti|
	tateti:=Tateti createGame.
	self assert: tateti nextPlayerIsX.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:16:00'!
test09PlayerOPlaysAfterX
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	self assert: tateti nextPlayerIsO.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:16:26'!
test10PlayerXPlaysAfterO
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	self assert: tateti nextPlayerIsX.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:52:50'!
test11PlayersCanNotAddMoreThan6PiecesOnTheBoardInTotal
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 2@3.
	
	self should:  [tateti addPieceAt: 3@1.]  raise: Error withMessageText: Tateti playerCanNotAddFourthPieceErrorDescription.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:31:05'!
test12PlayerCanNotMovePieceFromASlotWhereThereIsNotOneOfHisPieces
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 2@3.
	self should:  [tateti movePieceAt: 2@1 to: 3@1.]  raise: Error withMessageText:  Tateti positionDoenNotHaveAValidPieceToMoveErrorDescription.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 06:22:22'!
test13CanNotMovePieceToOutsideOfBoundsLocation
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 3@2.
	tateti addPieceAt: 3@3.
	self should:  [tateti movePieceAt: 1@1 to: 0@1.]  raise: Error withMessageText:  Tateti outsideOfBoundsErrorDescription .! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 06:22:23'!
test14CanNotMovePieceToNotNeighbourLocation
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 3@2.
	tateti addPieceAt: 3@3.
	self should:  [tateti movePieceAt: 1@1 to: 2@3.]  raise: Error withMessageText:  Tateti DestinationNotANeighbourErrorDescription.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 06:22:23'!
test15piecesCenteredInTheBordersCannotMoveDiagonally
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 3@2.
	tateti addPieceAt: 3@3.
	self should:  [tateti movePieceAt: 1@2 to: 2@1.]  raise: Error withMessageText: Tateti DestinationNotANeighbourErrorDescription.! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 00:29:14'!
test16GameIsNotFinishedWhen3PiecesFromDIfferentPlayersAreInARow
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 1@3.

	self deny:  tateti isOver. ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:00:26'!
test17GameIsFinishedWhen3PiecesOfPlayerXAreInAColumn
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 1@3.
	self assert:  tateti isOver . ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:00:42'!
test18GameIsFinishedWhen3PiecesOfPlayerXAreInARow
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 3@1.
	self assert:  tateti isOver . ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:04:02'!
test19GameIsFinishedWhen3PiecesOfPlayerXAreInAnUpperLeftToBottomRightDiagonal
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 3@3.
	
	self assert:  tateti isOver . ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:05:24'!
test20GameIsFinishedWhen3PiecesOfPlayerXAreInAnUpperRightToBottomLeftDiagonal
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 3@1.
	
	self assert:  tateti isOver . ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 10:06:21'!
test21GameIsFinishedWhen3PiecesOfPlayerOAreConsecutive
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 3@3.
	tateti addPieceAt: 1@3.
	
	self assert:  tateti isOver . ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:52:25'!
test22CanNotAddPieceInFinishedGame
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 1@3.
	
	self should:  [tateti addPieceAt: 3@3 .]  raise: Error withMessageText:  Tateti canNotAddOrMovePiecesInFinishedGameErrorDescription. ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:52:17'!
test23CanNotMovePieceInFinishedGame
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 3@3.
	tateti addPieceAt: 1@3.
	
	self should:  [tateti movePieceAt: 3@1 to: 3@2 ]  raise: Error description: Tateti canNotAddOrMovePiecesInFinishedGameErrorDescription. ! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:52:05'!
test24MovingPiecesChangeNextPlayer
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 3@2.
	
	tateti movePieceAt: 1@1 to: 1@2.
	self assert: tateti nextPlayerIsO .
	
	tateti movePieceAt: 2@1 to: 1@1.
	
	self assert: tateti nextPlayerIsX .! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:51:55'!
test25MovingPiecesOccupiesDestinationSpotCreatingGameOverConfigurationsWhereXwins
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 3@2.
	
	tateti movePieceAt: 2@2 to: 1@2.
	
	self assert: tateti hasPlayerXWon .! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:51:47'!
test26MovingPiecesOccupiesDestinationSpotCreatingGameOverConfigurationsWhereOwins
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 3@2.
	
	tateti movePieceAt: 1@3 to: 2@3.
	tateti movePieceAt: 2@2 to: 3@3.
	
	self assert: tateti hasPlayerOWon .! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:51:36'!
test27MovingPiecesLeavesOriginalSpotFree
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 2@1.
	tateti addPieceAt: 3@2.
	
	tateti movePieceAt: 1@1 to: 1@2.
	tateti movePieceAt: 3@2 to: 3@3.
	
	self deny: tateti isOver .! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:51:30'!
test28CanNotMovePiecesBeforeThereAre6OnTheBoard
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 2@2.
	tateti addPieceAt: 1@3.
	self should:  [tateti movePieceAt: 2@2 to: 1@2.]  raise: Error withMessageText: Tateti NotEnoughPiecesToMoveErrorDescription.
! !

!TatetiTest methodsFor: 'tateti tests' stamp: 'AS 11/2/2020 09:51:23'!
test29CanNotMovePieceToTakenSpot
|tateti|
	tateti:=Tateti createGame.
	tateti addPieceAt: 1@1.
	tateti addPieceAt: 1@2.
	tateti addPieceAt: 1@3.
	tateti addPieceAt: 3@1.
	tateti addPieceAt: 3@2.
	tateti addPieceAt: 3@3.
	self should:  [tateti movePieceAt: 1@1 to: 1@2.]  raise: Error withMessageText: Tateti alreadyTakenErrorDescription .
! !


!TatetiTest methodsFor: 'auxiliar methods' stamp: 'AS 11/2/2020 10:25:49'!
shouldRaiseOutsideOfBoundsWhenAddingPieceAt: aPoint
|tateti|
	tateti:=Tateti createGame.
	self should:  [tateti addPieceAt: aPoint.]  raise: Error withMessageText:  Tateti outsideOfBoundsErrorDescription. ! !


!classDefinition: #Tateti category: #'Ta-Te-Ti'!
Object subclass: #Tateti
	instanceVariableNames: 'piecesX piecesO state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!Tateti methodsFor: 'initialization' stamp: 'AS 11/2/2020 07:52:45'!
initializeGame
piecesX:=OrderedCollection new.
piecesO:=OrderedCollection new.
state:=NextPlayerIsX with:self.! !


!Tateti methodsFor: 'move and add pieces' stamp: 'AS 11/2/2020 09:28:55'!
addPieceAt: aPoint 
	 self assertGameIsNotOver.
						
	(self addingPhaseIsOver)  ifTrue:[	
							self error: self class playerCanNotAddFourthPieceErrorDescription 				].

	state addPieceAt: aPoint.! !

!Tateti methodsFor: 'move and add pieces' stamp: 'AS 11/2/2020 09:29:11'!
movePieceAt: aPoint to:  anotherPoint
	|aPiece|

	 self assertGameIsNotOver.
	
	(self addingPhaseIsOver )  ifFalse:[	
							self error: self class NotEnoughPiecesToMoveErrorDescription 				].
	
	aPiece:=(TatetiPiece for: aPoint).
	
	 aPiece assertIsNeighbourOf: anotherPoint .
	
	state move: aPiece to: anotherPoint .! !


!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 06:28:41'!
addPieceToO: aPiece
	piecesO add:aPiece! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 06:28:52'!
addPieceToX: aPiece
	piecesX add:aPiece! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 02:08:56'!
addingPhaseIsOver

	^ (piecesX size + piecesO size)>=6! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:28:11'!
assertGameIsNotOver
		(self isOver) ifTrue: [
			self error: self class canNotAddOrMovePiecesInFinishedGameErrorDescription
			].! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:34:48'!
assertPiecesOnBoardDoNotInclude: aPiece
		(self piecesIncludes: aPiece) ifTrue:[	
							self error: self class alreadyTakenErrorDescription.				].! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:31:18'!
assertPlayerOHas: aPiece
	((piecesO includes: aPiece)) ifFalse:[	
							self error: self class positionDoenNotHaveAValidPieceToMoveErrorDescription .				].! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:32:14'!
assertPlayerXHas: aPiece
	((piecesX includes: aPiece)) ifFalse:[	
							self error: self class positionDoenNotHaveAValidPieceToMoveErrorDescription .				].! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 01:31:34'!
changePlayerToO
	state:=NextPlayerIsO with:self! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 01:31:42'!
changePlayerToX
	state:=NextPlayerIsX with:self! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:35:04'!
piecesIncludes: aPiece
	^((piecesX includes: aPiece) or: (piecesO includes: aPiece))! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 06:52:27'!
removePieceFromO: aPiece
piecesO remove: aPiece! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 06:52:44'!
removePieceFromX: aPiece
piecesX remove: aPiece! !

!Tateti methodsFor: 'private' stamp: 'AS 11/2/2020 09:49:41'!
winningConfigurationsInclude: aPieceCollection

	1 to: 3 do: [:i|
		((aPieceCollection includes: (TatetiPiece for: 1@i))
		and:(aPieceCollection includes: (TatetiPiece for: 2@i))
		and:(aPieceCollection includes: (TatetiPiece for: 3@i))) ifTrue: [^true].
		
		((aPieceCollection includes: (TatetiPiece for: i@1))
		and:(aPieceCollection includes: (TatetiPiece for: i@2))
		and:(aPieceCollection includes: (TatetiPiece for: i@3))) ifTrue: [^true].
		].
	
		((aPieceCollection includes: (TatetiPiece for: 1@1))
		and:(aPieceCollection includes: (TatetiPiece for: 2@2))
		and:(aPieceCollection includes: (TatetiPiece for: 3@3))) ifTrue: [^true].
		
		((aPieceCollection includes: (TatetiPiece for: 3@1))
		and:(aPieceCollection includes: (TatetiPiece for: 2@2))
		and:(aPieceCollection includes: (TatetiPiece for: 1@3))) ifTrue: [^true].
	
	^false.! !


!Tateti methodsFor: 'access' stamp: 'AS 11/2/2020 08:53:42'!
hasPlayerOWon

	^(self winningConfigurationsInclude: piecesO).
	
	! !

!Tateti methodsFor: 'access' stamp: 'AS 11/2/2020 08:53:58'!
hasPlayerXWon

	^(self winningConfigurationsInclude: piecesX).
	
	! !

!Tateti methodsFor: 'access' stamp: 'AS 11/1/2020 18:37:24'!
isEmpty
	^(piecesX isEmpty) and: (piecesO isEmpty).! !

!Tateti methodsFor: 'access' stamp: 'AS 11/1/2020 20:35:46'!
isOver
	self nextPlayerIsX ifTrue: [
				^(self hasPlayerOWon)
			] ifFalse:[
			 	^(self hasPlayerXWon)
			]
	
	! !

!Tateti methodsFor: 'access' stamp: 'AS 11/2/2020 01:41:13'!
nextPlayerIsO
	^state nextPlayerIsO! !

!Tateti methodsFor: 'access' stamp: 'AS 11/2/2020 01:41:40'!
nextPlayerIsX
	^state nextPlayerIsX! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tateti class' category: #'Ta-Te-Ti'!
Tateti class
	instanceVariableNames: ''!

!Tateti class methodsFor: 'instance creation' stamp: 'AS 11/1/2020 17:01:22'!
createGame
	^self new initializeGame! !


!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/2/2020 09:10:16'!
DestinationNotANeighbourErrorDescription
	^'Destination is not a neighbour'! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/2/2020 00:44:26'!
NotEnoughPiecesToMoveErrorDescription
	^'Can not move when there are less than 6 pieces'! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/2/2020 09:09:50'!
alreadyTakenErrorDescription
	^'pieces can not be placed in a position that is already taken'.! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/1/2020 21:00:39'!
canNotAddOrMovePiecesInFinishedGameErrorDescription
	^'Pieces can not be added or moved in a game that is already over'! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/2/2020 05:44:20'!
outsideOfBoundsErrorDescription
	^'piece can not be outside the bounds of the board'.! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/1/2020 18:29:22'!
playerCanNotAddFourthPieceErrorDescription
	^'A player can not add four pieces to the board'.! !

!Tateti class methodsFor: 'ErrorDescriptions' stamp: 'AS 11/2/2020 09:11:00'!
positionDoenNotHaveAValidPieceToMoveErrorDescription
	^'There is not a valid piece to move in that position'! !


!classDefinition: #TatetiPiece category: #'Ta-Te-Ti'!
Object subclass: #TatetiPiece
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!TatetiPiece methodsFor: 'assert' stamp: 'AS 11/2/2020 02:47:40'!
assertIsNeighbourOf: aPoint
	self subclassResponsibility ! !


!TatetiPiece methodsFor: 'initialize' stamp: 'AS 11/2/2020 02:45:17'!
initializeWith: aPoint.
	position:= aPoint ! !


!TatetiPiece methodsFor: 'comparator' stamp: 'AS 11/2/2020 05:22:10'!
= aPiece
^position = aPiece position! !


!TatetiPiece methodsFor: 'accessing' stamp: 'AS 11/2/2020 05:19:29'!
position
^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TatetiPiece class' category: #'Ta-Te-Ti'!
TatetiPiece class
	instanceVariableNames: ''!

!TatetiPiece class methodsFor: 'private-instance creation' stamp: 'AS 11/2/2020 02:32:36'!
canHandle: aPoint
	self subclassResponsibility ! !

!TatetiPiece class methodsFor: 'private-instance creation' stamp: 'AS 11/2/2020 02:44:43'!
with: aPoint
	^self new initializeWith: aPoint ! !


!TatetiPiece class methodsFor: 'instance creation' stamp: 'AS 11/2/2020 05:13:32'!
for: aPoint
	^ (self allSubclasses detect: [:aClass | aClass canHandle: aPoint ]ifNone: [ self error: Tateti outsideOfBoundsErrorDescription. ]) with: aPoint! !


!classDefinition: #PieceInTheMiddleOfABorder category: #'Ta-Te-Ti'!
TatetiPiece subclass: #PieceInTheMiddleOfABorder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!PieceInTheMiddleOfABorder methodsFor: 'assert' stamp: 'AS 11/2/2020 02:50:09'!
assertIsNeighbourOf: aPoint

	(position fourNeighbors includes: aPoint) 			ifFalse:
			[
				self error: Tateti DestinationNotANeighbourErrorDescription 
			]	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PieceInTheMiddleOfABorder class' category: #'Ta-Te-Ti'!
PieceInTheMiddleOfABorder class
	instanceVariableNames: ''!

!PieceInTheMiddleOfABorder class methodsFor: 'private-instance creation' stamp: 'AS 11/2/2020 02:36:17'!
canHandle: aPoint
	^(Array with: 1@2
		     with: 2@1
		     with: 3@2
		     with: 2@3) includes: aPoint.! !


!classDefinition: #PiecesInTheCornerOrTheMiddle category: #'Ta-Te-Ti'!
TatetiPiece subclass: #PiecesInTheCornerOrTheMiddle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!PiecesInTheCornerOrTheMiddle methodsFor: 'assert' stamp: 'AS 11/2/2020 02:50:22'!
assertIsNeighbourOf: aPoint

	(position eightNeighbors includes: aPoint) 			ifFalse:
			[
				self error: Tateti DestinationNotANeighbourErrorDescription 
			]	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PiecesInTheCornerOrTheMiddle class' category: #'Ta-Te-Ti'!
PiecesInTheCornerOrTheMiddle class
	instanceVariableNames: ''!

!PiecesInTheCornerOrTheMiddle class methodsFor: 'instance creation' stamp: 'AS 11/2/2020 02:38:05'!
canHandle: aPoint
	^(Array with: 1@1
		     with: 1@3
		     with: 3@1
		     with: 3@3
		     with: 2@2
		) includes: aPoint.! !


!classDefinition: #TatetiState category: #'Ta-Te-Ti'!
Object subclass: #TatetiState
	instanceVariableNames: 'tateti'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!TatetiState methodsFor: 'initialize' stamp: 'AS 11/2/2020 01:33:51'!
initializeWith: aTateti
	tateti:= aTateti ! !


!TatetiState methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 01:15:35'!
addPieceAt: aPoint
	self subclassResponsibility ! !

!TatetiState methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 06:35:45'!
move: aPiece to:  aPoint
	self subclassResponsibility ! !


!TatetiState methodsFor: 'next player' stamp: 'AS 11/2/2020 01:47:40'!
nextPlayerIsO
	self subclassResponsibility ! !

!TatetiState methodsFor: 'next player' stamp: 'AS 11/2/2020 01:47:45'!
nextPlayerIsX
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TatetiState class' category: #'Ta-Te-Ti'!
TatetiState class
	instanceVariableNames: ''!

!TatetiState class methodsFor: 'instanceCreation' stamp: 'AS 11/2/2020 01:39:48'!
with: aTateti
	^self new initializeWith: aTateti! !


!classDefinition: #NextPlayerIsO category: #'Ta-Te-Ti'!
TatetiState subclass: #NextPlayerIsO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!NextPlayerIsO methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 09:17:36'!
addPieceAt: aPoint	
	|aPiece|
		aPiece :=TatetiPiece for: aPoint.
		
		tateti assertPiecesOnBoardDoNotInclude: aPiece.
		
		tateti addPieceToO: aPiece.
		tateti changePlayerToX
	! !

!NextPlayerIsO methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 09:31:18'!
move: aPiece to:  aPoint
|anotherPiece|
		tateti assertPlayerOHas: aPiece .			
		tateti removePieceFromO: aPiece.
		anotherPiece :=TatetiPiece for: aPoint.
		tateti assertPiecesOnBoardDoNotInclude: anotherPiece.
		tateti addPieceToO: anotherPiece.
		tateti changePlayerToX.! !


!NextPlayerIsO methodsFor: 'next player' stamp: 'AS 11/2/2020 01:42:33'!
nextPlayerIsO
	^true! !

!NextPlayerIsO methodsFor: 'next player' stamp: 'AS 11/2/2020 01:42:41'!
nextPlayerIsX
	^false! !


!classDefinition: #NextPlayerIsX category: #'Ta-Te-Ti'!
TatetiState subclass: #NextPlayerIsX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ta-Te-Ti'!

!NextPlayerIsX methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 09:18:03'!
addPieceAt: aPoint
|aPiece|
		aPiece :=TatetiPiece for: aPoint.
		
		tateti assertPiecesOnBoardDoNotInclude: aPiece.
		
		tateti addPieceToX: aPiece.
		tateti changePlayerToO
	! !

!NextPlayerIsX methodsFor: 'add or move pieces' stamp: 'AS 11/2/2020 09:32:14'!
move: aPiece to:  aPoint
|anotherPiece|
		tateti assertPlayerXHas: aPiece .			
		tateti removePieceFromX: aPiece.
		anotherPiece :=TatetiPiece for: aPoint.
		tateti assertPiecesOnBoardDoNotInclude: anotherPiece.
		tateti addPieceToX: anotherPiece.
		tateti changePlayerToO.! !


!NextPlayerIsX methodsFor: 'next player' stamp: 'AS 11/2/2020 01:42:53'!
nextPlayerIsO
	^false! !

!NextPlayerIsX methodsFor: 'next player' stamp: 'AS 11/2/2020 01:42:59'!
nextPlayerIsX
	^true! !
