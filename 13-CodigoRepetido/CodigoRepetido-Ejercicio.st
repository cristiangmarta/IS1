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
	instanceVariableNames: 'customerBook validCustomerName invalidCustomerName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'helpers' stamp: 'CM 9/23/2020 20:43:30'!
addAndSuspendCustomerNamed: aName
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'CM 9/23/2020 22:32:20'!
assertOnlyOneCustomerNamed: aName

	self assert: customerBook numberOfCustomers = 1.
	self assert: ( customerBook includesCustomerNamed: aName )! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'CM 9/23/2020 22:39:29'!
assertTotalCustomersCount: totalCustomersCount activeCustomerCount: activeCustomersCount suspendedCustomerCount: suspendedCustomersCount

	self assert: totalCustomersCount equals: customerBook numberOfCustomers.
	self assert: activeCustomersCount equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomersCount equals: customerBook numberOfSuspendedCustomers.
	! !


!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 20:44:49'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self should: [ customerBook addCustomerNamed: validCustomerName ] notTakeMoreThan: 50 milliSeconds.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 20:44:49'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: validCustomerName .

	self should: [ customerBook removeCustomerNamed: validCustomerName ] notTakeMoreThan: 100 milliSeconds. 
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 20:45:19'!
test03CanNotAddACustomerWithEmptyName

	self should: [ customerBook addCustomerNamed: '' ] raise: Error withMessageText: CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 22:32:52'!
test04CanNotRemoveAnInvalidCustomer
			
	customerBook addCustomerNamed: validCustomerName .
	
	self should: [ customerBook removeCustomerNamed: invalidCustomerName ] raise: NotFound.

	self assertOnlyOneCustomerNamed: validCustomerName.
		
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 22:39:29'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	self addAndSuspendCustomerNamed: validCustomerName .
	
	self assertTotalCustomersCount: 1 activeCustomerCount: 0 suspendedCustomerCount: 1.
	self assert: ( customerBook includesCustomerNamed: validCustomerName ).
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 22:39:29'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self addAndSuspendCustomerNamed: validCustomerName .	
	customerBook removeCustomerNamed: validCustomerName .
	
	self assertTotalCustomersCount: 0 activeCustomerCount: 0 suspendedCustomerCount: 0.
	self deny: ( customerBook includesCustomerNamed: validCustomerName ).



	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 22:33:12'!
test07CanNotSuspendAnInvalidCustomer
			
	customerBook addCustomerNamed: validCustomerName .
	
	self should: [ customerBook suspendCustomerNamed: invalidCustomerName ] raise: CantSuspend.
	
	self assertOnlyOneCustomerNamed: validCustomerName.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CM 9/23/2020 22:33:20'!
test08CanNotSuspendAnAlreadySuspendedCustomer
			
	self addAndSuspendCustomerNamed: validCustomerName .
	
	self should: [ customerBook suspendCustomerNamed: validCustomerName ] raise: CantSuspend.
	
	self assertOnlyOneCustomerNamed: validCustomerName.
! !


!CustomerBookTest methodsFor: 'setUp/tearDown' stamp: 'CM 9/23/2020 20:44:49'!
setUp
	customerBook := CustomerBook new.
	validCustomerName := 'John Lennon'.
	invalidCustomerName := 'McCartney'.
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:32:21'!
hasActiveCustomers
	
	^ activeCustomers notEmpty! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:32:30'!
hasSuspendedCustomers
	
	^ suspendedCustomers notEmpty! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:30:00'!
includesActiveCustomerNamed: aName

	^ activeCustomers includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:30:23'!
includesCustomerNamed: aName

	^(self includesActiveCustomerNamed: aName) or: [ self includesSuspendedCustomerNamed: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:30:23'!
includesSuspendedCustomerNamed: aName

	^ suspendedCustomers includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:31:17'!
isEmpty
	
	^self notEmpty not! !

!CustomerBook methodsFor: 'testing' stamp: 'CM 9/23/2020 19:32:03'!
notEmpty
	
	^self hasActiveCustomers or: self hasSuspendedCustomers.! !


!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/23/2020 19:37:31'!
signalCustomerAlreadyExists

	CantAdd signal: self class customerAlreadyExistsErrorMessage.
	! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/23/2020 19:39:16'!
signalCustomerCannotBeSuspended

	CantSuspend new signal: self class customerCannotBeSuspendedErrorMessage.
	
! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/23/2020 19:37:55'!
signalCustomerNameCannotBeEmpty

	CantAdd signal: self class customerCanNotBeEmptyErrorMessage.! !

!CustomerBook methodsFor: 'error handling' stamp: 'CM 9/23/2020 19:38:18'!
signalCustomerNotFound

	NotFound signal: self class customerNotFoundErrorMessage.
	! !


!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/23/2020 19:34:20'!
numberOfActiveCustomers
	
	^ activeCustomers size! !

!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/23/2020 19:34:35'!
numberOfCustomers
	
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'CM 9/23/2020 19:34:14'!
numberOfSuspendedCustomers
	
	^ suspendedCustomers size! !


!CustomerBook methodsFor: 'initialization' stamp: 'CM 9/23/2020 19:29:02'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers:= OrderedCollection new.! !


!CustomerBook methodsFor: 'validations' stamp: 'CM 9/23/2020 22:25:39'!
additionValidation
	^ [ :aName | 
		aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
		((activeCustomers includes: aName) or: [suspendedCustomers includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ]
	].
	! !

!CustomerBook methodsFor: 'validations' stamp: 'CM 9/23/2020 22:22:35'!
removalValidation
	^ [ :aName |
		(self includesCustomerNamed: aName) ifFalse: [ self signalCustomerNotFound ]
	]
	! !

!CustomerBook methodsFor: 'validations' stamp: 'CM 9/23/2020 20:08:55'!
suspendValidation
	^ [ :aName |
		(activeCustomers includes: aName) ifFalse: [ self signalCustomerCannotBeSuspended ]
	]
	
	! !

!CustomerBook methodsFor: 'validations' stamp: 'CM 9/23/2020 20:10:23'!
validate: aValidationBlock forCustomerNamed: aName 
	aValidationBlock value: aName
! !


!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/23/2020 22:25:39'!
addCustomerNamed: aName

	self validate: self additionValidation forCustomerNamed: aName.
	
	activeCustomers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/23/2020 22:22:35'!
removeCustomerNamed: aName 
 
	self validate: self removalValidation forCustomerNamed: aName.
	
	activeCustomers remove: aName ifAbsent: [
		suspendedCustomers remove: aName
	].

	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'CM 9/23/2020 20:10:23'!
suspendCustomerNamed: aName 
	
	self validate: self suspendValidation forCustomerNamed: aName.
	
	activeCustomers remove: aName.
	suspendedCustomers add: aName
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

!CustomerBook class methodsFor: 'error messages' stamp: 'CM 9/23/2020 19:36:53'!
customerCannotBeSuspendedErrorMessage

	^'customer name is not an active customer!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'CM 9/23/2020 19:37:00'!
customerNotFoundErrorMessage

	^'customer name is not an active or suspended customer!!'! !
