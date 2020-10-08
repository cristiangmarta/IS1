!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'a 10/4/2020 08:36:51'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'a 10/4/2020 12:39:11'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
		self assert: stack isEmpty
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'a 10/4/2020 12:20:55'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackVacio stackOneElement stackMultipleElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'CM 10/8/2020 16:06:24'!
setUp
	
	stackVacio := OOStack new.
	stackOneElement := OOStack new push: 'winter is coming'.
						
	stackMultipleElements := stackOneElement copy.
	stackMultipleElements push: 'winning is everything';
					   push: 'The winds of Winter';
					   push: 'Winter is here'.
	


! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:07:11'!
test01FindOnEmptyStackReturnsEmptyStack

	|expectedResult|
	
	expectedResult := OOStack new.
	
	self shouldFind: 'KO' OnTheStack: stackVacio  PreserveStackOrderAndReturn: expectedResult.

		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:07:34'!
test02FindExistingPrefixInAStackWith1Element

	| expectedResult |
	
	expectedResult := OOStack new push: 'winter is coming'.
	
	self shouldFind: 'wint' OnTheStack: stackOneElement  PreserveStackOrderAndReturn: expectedResult.
	
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:08:12'!
test03FindNonExistentPrefixInAStackWith1Element

	| expectedResult |
	
	expectedResult := OOStack new.
	
	self shouldFind: 'wit' OnTheStack: stackOneElement  PreserveStackOrderAndReturn: expectedResult.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:08:25'!
test04FindNonExistentPrefixInAStackWithMultipleElements
	
	| expectedResult |
	
	expectedResult := OOStack new.
	
	self shouldFind: 'wit' OnTheStack: stackMultipleElements  PreserveStackOrderAndReturn: expectedResult.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:09:21'!
test05FindPrefixInAStackWithMultipleMatches

	| expectedResult |
	
	expectedResult := (OOStack new push: 'winter is coming') push: 'winning is everything'.
	
	self shouldFind: 'win' OnTheStack: stackMultipleElements  PreserveStackOrderAndReturn: expectedResult.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:09:45'!
test06FindPrefixInAStackWithOnly1Match

	| expectedResult |
	
	expectedResult := OOStack new push: 'winning is everything'.
	
	self shouldFind: 'winning' OnTheStack: stackMultipleElements  PreserveStackOrderAndReturn: expectedResult.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:09:38'!
test07PrefixIsCaseSensitive

	| expectedResult |
	
	expectedResult:=OOStack new push: 'Winter is here'. 
	
	self shouldFind: 'Wint' OnTheStack: stackMultipleElements  PreserveStackOrderAndReturn: expectedResult.
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:10:10'!
test08RaisesErrorWhenPrefixHasWhitespaceInStackWithAtLeast1Element

	self shouldFind: 'Wi nt' 
	      OnTheStack: stackMultipleElements 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix BlankSpaceInThePrefixErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:10:23'!
test09RaisesErrorWhenPrefixHasWhitespaceInEmptyStack

	self shouldFind: 'Wi nt' 
	      OnTheStack: stackVacio 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix BlankSpaceInThePrefixErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:10:38'!
test10RaisesErrorWhenPrefixHasWhitespaceEvenIfItExistsInTheStack

	self shouldFind: 'Winter is here' 
	      OnTheStack: stackMultipleElements 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix BlankSpaceInThePrefixErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:10:49'!
test11RaisesErrorWhenPrefixIsJustAWhiteSpace

	self shouldFind: ' ' 
	      OnTheStack: stackMultipleElements 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix BlankSpaceInThePrefixErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:11:01'!
test12RaisesErrorWhenPrefixIsEmptyInStackWithAtLeast1Element

	self shouldFind: '' 
	      OnTheStack: stackMultipleElements 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix EmptyPrefixErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CM 10/8/2020 16:11:14'!
test13RaisesErrorWhenPrefixIsEmptyInEmptyStack

	self shouldFind: '' 
	      OnTheStack: stackVacio 
	      PreserveStackOrderAndRaiseError: SentenceFinderByPrefix EmptyPrefixErrorDescription! !


!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:15:31'!
makeABagFrom: aStack
	| bag |

	bag := Bag new.

	1 to: aStack size do: [ :x | bag add: (aStack pop) ].

	^bag






! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:15:53'!
shouldFind: aPrefix OnTheStack: aStack PreserveStackOrderAndRaiseError: anErrorDescription

	| originalStack |
	
	originalStack := aStack copy.
	
	self shouldFind: aPrefix OnTheStack: aStack RaiseError: anErrorDescription.
	
	self shouldStack: originalStack beEqualTo: aStack.  
		! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:11:54'!
shouldFind: aPrefix OnTheStack: aStack PreserveStackOrderAndReturn: expectedResult

	| originalStack |
	
	originalStack := aStack copy.
	
	self shouldFind: aPrefix OnTheStack: aStack Returns: expectedResult.
	
	self shouldStack: originalStack beEqualTo: aStack 
		! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:16:54'!
shouldFind: aPrefix OnTheStack: aStack RaiseError: anErrorDescription

	| finder |

	finder := SentenceFinderByPrefix with: aStack .
	
	self should: [ finder find: aPrefix ]		
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = anErrorDescription ].
		! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:16:47'!
shouldFind: aPrefix OnTheStack: aStack Returns: expectedResult 
	
	| finder result |
	
	finder := SentenceFinderByPrefix with: aStack .
	result := finder find: aPrefix.
	
	self shouldStack: result containSameElementsInAnyOrderOf: expectedResult .
	
		! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'CM 10/8/2020 16:14:18'!
shouldStack: firstStack beEqualTo: secondStack
	
	self assert: (firstStack size = secondStack size). 

	1 to: firstStack size do: [ :x | self assert: firstStack pop = secondStack pop ].


		! !

!SentenceFinderByPrefixTest methodsFor: 'private - test' stamp: 'a 10/8/2020 02:54:27'!
shouldStack: firstStack containSameElementsInAnyOrderOf: secondStack

	self assert: (self makeABagFrom: firstStack) = (self makeABagFrom: secondStack). 




! !


!classDefinition: #ElementWithLink category: #'Stack-Exercise'!
Object subclass: #ElementWithLink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:54:16'!
isEmpty
	self subclassResponsibility .! !

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:54:20'!
linked
	self subclassResponsibility .! !

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:54:24'!
value
	self subclassResponsibility .! !


!classDefinition: #EmptyElement category: #'Stack-Exercise'!
ElementWithLink subclass: #EmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:54:37'!
isEmpty

	^ true .! !

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:59:20'!
linked

	self error: OOStack stackEmptyErrorDescription.! !

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:55:01'!
value

	self error: OOStack stackEmptyErrorDescription
! !


!classDefinition: #FilledElementWithLink category: #'Stack-Exercise'!
ElementWithLink subclass: #FilledElementWithLink
	instanceVariableNames: 'value linkedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:55:27'!
isEmpty

	^ false.! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:55:35'!
linked

	^ linkedElement .! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'CM 10/8/2020 15:55:44'!
value

	^ value.! !


!FilledElementWithLink methodsFor: 'Initialization' stamp: 'CM 10/8/2020 15:56:06'!
initializeWithValue: aValue AndLinkedTo: anElement

	value := aValue.
	linkedElement := anElement.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledElementWithLink class' category: #'Stack-Exercise'!
FilledElementWithLink class
	instanceVariableNames: ''!

!FilledElementWithLink class methodsFor: 'InstanceCreation' stamp: 'CM 10/8/2020 15:56:31'!
newElementWithValue: aValue AndLinkedTo: anElement

	^ self new initializeWithValue: aValue AndLinkedTo: anElement.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'StackInformation' stamp: 'CM 10/8/2020 15:53:41'!
isEmpty

	^ top isEmpty .
! !

!OOStack methodsFor: 'StackInformation' stamp: 'CM 10/8/2020 15:53:47'!
size

	^ size.! !


!OOStack methodsFor: 'StackActions' stamp: 'CM 10/8/2020 15:53:00'!
pop
	| ValorEliminado |

	ValorEliminado := top value.
	top := top linked.
	size := size-1.
	^ ValorEliminado.! !

!OOStack methodsFor: 'StackActions' stamp: 'CM 10/8/2020 15:53:24'!
push: anElement
	top := FilledElementWithLink newElementWithValue:  anElement AndLinkedTo: top.
	size := size+1.! !

!OOStack methodsFor: 'StackActions' stamp: 'CM 10/8/2020 15:53:32'!
top

	^ top value.! !


!OOStack methodsFor: 'Initialization' stamp: 'CM 10/8/2020 15:52:04'!
initialize

	top := EmptyElement new.
	size :=0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'a 10/4/2020 04:10:35'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!OOStack class methodsFor: 'Instance Creation' stamp: 'CM 10/8/2020 15:51:49'!
new

	^ super new initialize.
	
! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'CM 10/8/2020 15:46:11'!
find: aPrefix

	self prefixIsValid: aPrefix.
	^self findRecursive: aPrefix.






! !


!SentenceFinderByPrefix methodsFor: 'private - operations' stamp: 'CM 10/8/2020 15:46:30'!
findRecursive: aPrefix

	(stack isEmpty) 
		ifTrue: [^OOStack new] 
		ifFalse: [
			^self recursiveCaseOfFindRecursive: aPrefix
		]






! !

!SentenceFinderByPrefix methodsFor: 'private - operations' stamp: 'CM 10/8/2020 15:48:00'!
recursiveCaseOfFindRecursive: aPrefix
	|currentWord result deeperRecursiveResult|

	currentWord := stack pop.
	deeperRecursiveResult := (self findRecursive: aPrefix).
	
	(currentWord beginsWith: aPrefix)
		ifTrue:  [ result := deeperRecursiveResult push: currentWord.				] 
		ifFalse: 	[ result := deeperRecursiveResult ].
		
	stack push: currentWord.
	^result.






! !


!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'a 10/6/2020 08:47:35'!
prefixDoesNotHaveBlankSpaces: aPrefix

	(aPrefix findString: ' ') > 0 ifTrue: [self error: self class BlankSpaceInThePrefixErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'a 10/6/2020 08:47:24'!
prefixIsNotEmpty: aPrefix

	^ aPrefix isEmpty ifTrue: [self error: self class EmptyPrefixErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'CM 10/8/2020 15:50:57'!
prefixIsValid: aPrefix
	self prefixDoesNotHaveBlankSpaces: aPrefix.
	self prefixIsNotEmpty: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'CM 10/8/2020 15:48:29'!
initializeWith: aStack
	stack := aStack
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Instance Creation' stamp: 'CM 10/8/2020 16:02:21'!
with: aStack

	^ SentenceFinderByPrefix new initializeWith: aStack.! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'CM 10/8/2020 16:01:58'!
BlankSpaceInThePrefixErrorDescription

	^ 'Prefix can not have blank spaces!!'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'CM 10/8/2020 16:02:02'!
EmptyPrefixErrorDescription

	^ 'Prefix can not be empty!!'! !
