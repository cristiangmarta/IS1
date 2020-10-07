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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 10/6/2020 07:59:31'!
test01

	| stack firstPushedObject secondPushedObject thirdPushedObject fourthPushedObject finder result|
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	fourthPushedObject := 'fourth'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject .
	stack push: fourthPushedObject .
	
	finder:= SentenceFinderByPrefix with: stack.
	result:=finder find: 'fou'.
	self assert: (Bag with:fourthPushedObject  )=(Bag with: (result pop)).
	self assert: result isEmpty .
	
	self assert: stack pop = fourthPushedObject.
	self assert: stack pop = thirdPushedObject.
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty .
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 10/6/2020 08:01:04'!
test02

	| stack firstPushedObject secondPushedObject thirdPushedObject fourthPushedObject finder result|

	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	fourthPushedObject := 'thirsty'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject .
	stack push: fourthPushedObject .
	
	finder:= SentenceFinderByPrefix with: stack.
	result:=finder find: 'thi'.
	
	self assert: (Bag with:thirdPushedObject with:fourthPushedObject  )=(Bag with: (result pop) with: (result pop)).
	
	self assert: result isEmpty.
	
	self assert: stack pop = fourthPushedObject.
	self assert: stack pop = thirdPushedObject.
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	
	self assert: stack isEmpty .
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 10/6/2020 08:49:37'!
test03

	| stack firstPushedObject secondPushedObject thirdPushedObject fourthPushedObject finder|

	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	fourthPushedObject := 'thirsty'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject .
	stack push: fourthPushedObject .
	
	finder:= SentenceFinderByPrefix with: stack.
	self
		should: [finder find: 'ds as' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix BlankSpaceInThePrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 10/6/2020 08:50:31'!
test04

	| stack firstPushedObject secondPushedObject thirdPushedObject fourthPushedObject finder|

	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	fourthPushedObject := 'thirsty'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject .
	stack push: fourthPushedObject .
	
	finder:= SentenceFinderByPrefix with: stack.
	self
		should: [finder find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix EmptyPrefixErrorDescription ]! !


!classDefinition: #ElementWithLink category: #'Stack-Exercise'!
Object subclass: #ElementWithLink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 10:13:56'!
isEmpty
self subclassResponsibility ! !

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 12:07:44'!
linked
self subclassResponsibility ! !

!ElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 11:35:32'!
value
self subclassResponsibility ! !


!classDefinition: #EmptyElement category: #'Stack-Exercise'!
ElementWithLink subclass: #EmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 10:10:58'!
isEmpty
^true! !

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 20:21:53'!
linked
OOStack error: OOStack stackEmptyErrorDescription! !

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'a 10/6/2020 08:20:41'!
value
self error: OOStack stackEmptyErrorDescription
! !


!classDefinition: #FilledElementWithLink category: #'Stack-Exercise'!
ElementWithLink subclass: #FilledElementWithLink
	instanceVariableNames: 'value linkedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 10:37:58'!
isEmpty
^false! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/6/2020 08:32:44'!
linked
^linkedElement ! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/6/2020 08:32:39'!
value
^value! !


!FilledElementWithLink methodsFor: 'Initialize' stamp: 'a 10/6/2020 08:32:57'!
initializeWithValue: aValue AndLinkedTo: anElement
value:=aValue.
linkedElement:=anElement 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledElementWithLink class' category: #'Stack-Exercise'!
FilledElementWithLink class
	instanceVariableNames: ''!

!FilledElementWithLink class methodsFor: 'InstanceCreation' stamp: 'a 10/6/2020 08:32:13'!
newElementWithValue: aValue AndLinkedTo: anElement
^self new initializeWithValue: aValue AndLinkedTo: anElement! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'StackInformation' stamp: 'a 10/4/2020 10:12:30'!
isEmpty
^top isEmpty 
! !

!OOStack methodsFor: 'StackInformation' stamp: 'a 10/4/2020 10:02:33'!
size
^size.! !


!OOStack methodsFor: 'StackActions' stamp: 'a 10/4/2020 20:25:03'!
pop
|ValorEliminado|

ValorEliminado:=top value.
top:= top linked.
size:=size-1.
^ValorEliminado ! !

!OOStack methodsFor: 'StackActions' stamp: 'a 10/6/2020 08:31:10'!
push: anElement
top:=FilledElementWithLink newElementWithValue:  anElement AndLinkedTo: top.
size:=size+1.! !

!OOStack methodsFor: 'StackActions' stamp: 'a 10/4/2020 11:46:58'!
top
^top value! !


!OOStack methodsFor: 'Private - Initialization' stamp: 'a 10/4/2020 10:06:57'!
initialize
top:=EmptyElement new.
size:=0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'a 10/4/2020 04:10:35'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!OOStack class methodsFor: 'Instance Creation' stamp: 'a 10/4/2020 10:20:32'!
new
^super new initialize.
	
! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'a 10/6/2020 08:39:32'!
find: aPrefix

self prefixIsValid: aPrefix .

^self findRecursive: aPrefix .






! !


!SentenceFinderByPrefix methodsFor: 'private - operations' stamp: 'a 10/6/2020 08:55:46'!
findRecursive: aPrefix
|currentWord result deeperRecursiveResult|

(stack isEmpty) 
	ifTrue: [^OOStack new] 
	ifFalse:[
		currentWord:=stack pop.
		deeperRecursiveResult:=(self findRecursive: aPrefix).
		(currentWord beginsWith: aPrefix)
		 	ifTrue: [	result:= deeperRecursiveResult push: currentWord.				] 
			ifFalse: 	[result:=deeperRecursiveResult].
		
		stack push: currentWord.
		^result.
		]






! !


!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'a 10/6/2020 08:47:35'!
prefixDoesNotHaveBlankSpaces: aPrefix

	(aPrefix findString: ' ') > 0 ifTrue: [self error: self class BlankSpaceInThePrefixErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'a 10/6/2020 08:47:24'!
prefixIsNotEmpty: aPrefix

	^ aPrefix isEmpty ifTrue: [self error: self class EmptyPrefixErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'private - error detection' stamp: 'a 10/6/2020 08:35:16'!
prefixIsValid: aPrefix
self prefixDoesNotHaveBlankSpaces: aPrefix.
self prefixIsNotEmpty: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'private - initialization' stamp: 'a 10/6/2020 08:30:35'!
initializeWith: aStack
stack:=aStack
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Instance Creation' stamp: 'a 10/6/2020 08:30:11'!
with: aStack
^SentenceFinderByPrefix new initializeWith: aStack! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'a 10/6/2020 08:46:59'!
BlankSpaceInThePrefixErrorDescription

^'Prefix can not have blank spaces!!'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'a 10/6/2020 08:46:29'!
EmptyPrefixErrorDescription

^'Prefix can not be empty!!'! !
