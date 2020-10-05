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

!EmptyElement methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 20:21:59'!
value
OOStack error: OOStack stackEmptyErrorDescription
! !


!classDefinition: #FilledElementWithLink category: #'Stack-Exercise'!
ElementWithLink subclass: #FilledElementWithLink
	instanceVariableNames: 'Value LinkedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 10:37:58'!
isEmpty
^false! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 12:08:32'!
linked
^LinkedElement ! !

!FilledElementWithLink methodsFor: 'InformationRetrieval' stamp: 'a 10/4/2020 12:27:23'!
value
^Value! !


!FilledElementWithLink methodsFor: 'Initialize' stamp: 'a 10/4/2020 11:19:32'!
initializeWithValue: ValueToInsert AndLinkedTo: Element
Value:=ValueToInsert.
LinkedElement:=Element
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledElementWithLink class' category: #'Stack-Exercise'!
FilledElementWithLink class
	instanceVariableNames: ''!

!FilledElementWithLink class methodsFor: 'InstanceCreation' stamp: 'a 10/4/2020 11:18:13'!
newElementWithValue: Value AndLinkedTo: Element
^self new initializeWithValue: Value AndLinkedTo: Element! !


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

!OOStack methodsFor: 'StackActions' stamp: 'a 10/4/2020 11:28:14'!
push: element
top:=FilledElementWithLink newElementWithValue:  element AndLinkedTo: top.
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
