!classDefinition: #CantAdd category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantAdd
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/18/2020 00:31:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| aCustomerName |
	
	aCustomerName := 'John Lennon'.
	self should: [ customerBook addCustomerNamed: aCustomerName ] notTakeMoreThan: 50 milliSeconds! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/17/2020 23:55:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| aCustomerName |
	
	aCustomerName := 'Paul McCartney'.
	
	customerBook addCustomerNamed: aCustomerName.
	self should: [ customerBook removeCustomerNamed: aCustomerName ] notTakeMoreThan: 100 milliSeconds
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/17/2020 22:36:59'!
test03CanNotAddACustomerWithEmptyName 

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/17/2020 23:58:03'!
test04CanNotRemoveAnInvalidCustomer
	
	| aCustomerName anInvalidCustomerName |
			
	aCustomerName := 'John Lennon'.
	anInvalidCustomerName := 'Paul McCartney'.
	customerBook addCustomerNamed: aCustomerName.
	
	[ customerBook removeCustomerNamed: anInvalidCustomerName.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: aCustomerName) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/17/2020 23:31:16'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| aCustomerName |
	
	aCustomerName := 'Paul McCartney'.
	
	customerBook addCustomerNamed: aCustomerName.
	customerBook suspendCustomerNamed: aCustomerName.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: aCustomerName).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/17/2020 23:32:07'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| aCustomerName |
	
	aCustomerName := 'Paul McCartney'.
	
	customerBook addCustomerNamed: aCustomerName.
	customerBook suspendCustomerNamed: aCustomerName.
	customerBook removeCustomerNamed: aCustomerName.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: aCustomerName).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/18/2020 00:14:01'!
test07CanNotSuspendAnInvalidCustomer
	
	| aCustomerName anInvalidCustomerName |
			
	aCustomerName := 'John Lennon'.
	anInvalidCustomerName := 'George Harrison'.
	customerBook addCustomerNamed: aCustomerName.
	
	[ customerBook suspendCustomerNamed: anInvalidCustomerName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: aCustomerName) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/18/2020 00:06:07'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| aCustomerName |
			
	aCustomerName := 'John Lennon'.
	customerBook addCustomerNamed: aCustomerName.
	customerBook suspendCustomerNamed: aCustomerName.
	
	[ customerBook suspendCustomerNamed: aCustomerName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: aCustomerName) ]
! !


!CustomerBookTest methodsFor: 'setUp/tearDown' stamp: 'CM 9/18/2020 00:09:25'!
setUp
	super.
	customerBook := CustomerBook new.
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'CM 9/18/2020 00:27:17'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers:= OrderedCollection new.! !


!CustomerBook methodsFor: 'validations' stamp: 'CM 9/18/2020 02:57:49'!
runValidationAddCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ]! !

!CustomerBook methodsFor: 'validations' stamp: 'CM 9/18/2020 02:58:11'!
runValidationRemoveCustomerNamed: aName

	(self includesCustomerNamed: aName) ifFalse: [ self signalCustomerNotFound ]
	! !

!CustomerBook methodsFor: 'validations' stamp: 'CM 9/18/2020 02:58:40'!
runValidationSuspendCustomerNamed: aName

	(self includesActiveCustomerNamed: aName) ifFalse: [self signalCustomerCannotBeSuspended].! !


!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:29:24'!
hasActiveCustomers
	
	^ activeCustomers notEmpty! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:29:28'!
hasSuspendedCustomers
	
	^ suspendedCustomers notEmpty! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:23:09'!
includesActiveCustomerNamed: aName

	^ activeCustomers includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:24:09'!
includesCustomerNamed: aName

	^ (self includesActiveCustomerNamed: aName) or: [ self includesSuspendedCustomerNamed: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:22:52'!
includesSuspendedCustomerNamed: aName

	^ suspendedCustomers includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:30:38'!
isEmpty
	
	^ self notEmpty not! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/18/2020 02:30:29'!
notEmpty
	
	^ self hasActiveCustomers or: [ self hasSuspendedCustomers ]! !


!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/18/2020 02:56:55'!
numberOfActiveCustomers
	
	^ activeCustomers size! !

!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/18/2020 02:56:51'!
numberOfCustomers
	
	^ self numberOfSuspendedCustomers + self numberOfActiveCustomers ! !

!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/18/2020 02:56:47'!
numberOfSuspendedCustomers
	
	^ suspendedCustomers size! !


!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/18/2020 02:57:49'!
addCustomerNamed: aName

	self runValidationAddCustomerNamed: aName.
	activeCustomers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/18/2020 02:58:11'!
removeCustomerNamed: aName 
	self runValidationRemoveCustomerNamed: aName.
	
	activeCustomers remove: aName ifAbsent: [].
	suspendedCustomers remove: aName ifAbsent: []		.

	"^activeCustomers remove: aName ifAbsent: [ 
		suspendedCustomers remove: aName ifAbsent: [ 
			self signalCustomerNotFound
		]. 
	]."
	
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/18/2020 02:58:40'!
suspendCustomerNamed: aName

	self runValidationSuspendCustomerNamed: aName.
	
	activeCustomers remove: aName.
	suspendedCustomers add: aName
! !


!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/18/2020 02:55:53'!
signalCustomerAlreadyExists

	CantAdd new signal: self class customerAlreadyExistsErrorMessage.
	! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/18/2020 02:49:29'!
signalCustomerCannotBeSuspended

	CantSuspend new signal: self class customerCannotBeSuspendedErrorMessage
	
	! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/18/2020 02:55:53'!
signalCustomerNameCannotBeEmpty

	CantAdd new signal: self class customerCanNotBeEmptyErrorMessage.! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/18/2020 02:49:35'!
signalCustomerNotFound

	NotFound new signal: self class customerNotFoundErrorMessage
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:01:49'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:02:05'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'CM 9/18/2020 01:32:13'!
customerCannotBeSuspendedErrorMessage

	^'customer name is not an active customer!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'CM 9/18/2020 01:32:28'!
customerNotFoundErrorMessage

	^'customer name is not an active or suspended customer!!'! !
