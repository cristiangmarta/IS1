!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:10:29'!
test01NewCartsAreCreatedEmpty

	self assert: factory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:10:48'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := factory createCart.
	
	self 
		should: [ cart add: factory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:11:42'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := factory createCart.
	
	cart add: factory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:02'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := factory createCart.
	
	self 
		should: [cart add: 0 of: factory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:07'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := factory createCart.
	
	self 
		should: [cart add: 2 of: factory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:13'!
test06CartRemembersAddedItems

	| cart |
	
	cart := factory createCart.
	
	cart add: factory itemSellByTheStore.
	self assert: (cart includes: factory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:22'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := factory createCart.
	
	self deny: (cart includes: factory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:31'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := factory createCart.
	
	cart add: 2 of: factory itemSellByTheStore.
	self assert: (cart occurrencesOf: factory itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:39'!
test09EmptyCartIsFreeFromCharge

	| cart |
	
	cart := factory createCart.
	
	self assert: cart totalProductsPrice equals: 0! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:13:46'!
test10AfterAddingAnItemTheCartTotalPriceIsUpdatedByItsValue

	| cart |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	
	self assert: cart totalProductsPrice equals: factory itemSellByTheStorePrice.! !


!CartTest methodsFor: 'setUp' stamp: 'CM 11/22/2020 02:48:49'!
setUp
	
	factory := TusLibrosTestSubjectFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'doubles' stamp: 'CM 11/22/2020 01:43:44'!
createMerchantProcessorDouble

	^ self createMerchantProcessorDoubleWithDebitBehaviour: [ :amount :creditCard | ].! !

!CashierTest methodsFor: 'doubles' stamp: 'CM 11/22/2020 01:42:44'!
createMerchantProcessorDoubleWithDebitBehaviour: aBlock

	| merchantProcesor |
	
	merchantProcesor := TestDouble new.
	merchantProcesor allowToReceive: #debit:from: andReturn: aBlock.
	
	^ merchantProcesor.
	! !


!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:20:15'!
test01CanNotCheckoutAnEmptyCart
	
	| cart creditCard cashier merchantProcessor salesBook |
	
	cart := factory createCart.
	creditCard := factory createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := factory createSalesBook.
	
	cashier := Cashier billingOn: merchantProcessor
				      registeringSalesOn: salesBook.
	
	self should: [
			cashier checkout: cart chargingOn: creditCard
		]  raise: Error withMessageText: Cashier cartCannotBeEmptyErrorDescription.
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:45:11'!
test02AmountChargedCorrelatesToCartTotalPrice
	
	| cart cashier receiptAmount creditCard merchantProcessor salesBook |
	
	cart := factory createCart.
	cart add: 2 of: factory itemSellByTheStore.
	creditCard := factory createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := factory createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.
	
	receiptAmount := cashier checkout: cart chargingOn: creditCard.
	
	self assert: receiptAmount equals: factory itemSellByTheStorePrice * 2.
	
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:21:12'!
test03CanNotChargeOnAnExpiredCreditCard
	
	| cart cashier creditCard merchantProcessor salesBook |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	creditCard := factory createExpiredCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := factory createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.
	
	self should: [
			cashier checkout: cart chargingOn: creditCard.
		] raise: Error withMessageText: Cashier cannotChargeOnAnExpiredCreditCardErrorDescription .
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:21:16'!
test04CanNotProcessDebitWhenMerchantProcessorIsDown
	
	| cart cashier salesBook creditCard merchantProcessor |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	creditCard := factory createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDoubleWithDebitBehaviour: [ :amount :card | self error: Cashier paymentCannotBeProcessedErrorDescription ].
	salesBook := factory createSalesBook.
	
	cashier := Cashier billingOn: merchantProcessor registeringSalesOn: salesBook.
	
	self should: [
			cashier checkout: cart chargingOn: creditCard
		] raise: Error withExceptionDo: [ :error | 
			self assert: (salesBook isEmpty).
			self assert: error messageText equals: Cashier paymentCannotBeProcessedErrorDescription.
		]

	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:23:11'!
test05CashierChargesRightAmountOnTheCorrectCreditCard
	
	| cart cashier salesBook creditCard merchantProcessor |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	creditCard := factory createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := factory createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	cashier checkout: cart chargingOn: creditCard.
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:45:23'!
test05SuccessfulCheckoutRegistersSaleOnSalesBook
	
	| cart cashier receiptAmount salesBook creditCard merchantProcessor |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	creditCard := factory createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := factory createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	receiptAmount := cashier checkout: cart chargingOn: creditCard.
	
	self assert: salesBook size equals: 1.
	self assert: salesBook first equals: receiptAmount.
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:51:24'!
test06CashierOnlyChargesOneTimeWithRightAmountAndCorrectCard
	
	| cart cashier salesBook creditCard merchantProcessor chargedAmount chargedCreditCard receiptAmount |
	
	cart := factory createCart.
	cart add: factory itemSellByTheStore.
	creditCard := factory createValidCreditCard.
	
	merchantProcessor := self createMerchantProcessorDoubleWithDebitBehaviour: [ :amountToCharge :creditCardToCharge | 
		chargedAmount  := amountToCharge.
		chargedCreditCard  := creditCardToCharge.
	].
	salesBook := factory createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	receiptAmount := cashier checkout: cart chargingOn: creditCard.
		
	self assert: (		merchantProcessor timesReceived: #debit:from: ) equals: 1.
	self assert: chargedAmount equals: receiptAmount.
	self assert: chargedCreditCard equals: creditCard.
	! !


!CashierTest methodsFor: 'setUp/tearDown' stamp: 'CM 11/22/2020 02:48:49'!
setUp
	
	factory := TusLibrosTestSubjectFactory new.! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:02:45'!
test01CreditCardIsExpiredWhenExpirationDateIsPassed

	| tarjeta |
	
	tarjeta := factory createExpiredCreditCard.
	
	self assert: tarjeta isExpired.! !

!CreditCardTest methodsFor: 'tests' stamp: 'CM 11/22/2020 02:02:54'!
test02CreditCardIsValidWhenExpirationDateHasNotYetArrived

	| tarjeta |
	
	tarjeta := factory createValidCreditCard.
	
	self deny: tarjeta isExpired.! !


!CreditCardTest methodsFor: 'setUp/tearDown' stamp: 'CM 11/22/2020 02:48:49'!
setUp

	factory := TusLibrosTestSubjectFactory new.! !


!classDefinition: #TestDoubleTest category: 'TusLibros'!
TestCase subclass: #TestDoubleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:04:59'!
test01
	| double |
	
	double := TestDouble new.
	
	double allowToReceive: #myMethod andReturn: [ 2 ].
	
	self assert: 2 equals: double myMethod.! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:09:23'!
test02
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andReturn: [ 2 ].
	
	self assert: 0 equals: (double timesReceived: #myMethod).! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:10:18'!
test03
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andReturn: [ 2 ].
	double myMethod.
	
	self assert: 1 equals: (double timesReceived: #myMethod).! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:10:09'!
test04
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andReturn: [ 2 ].
	double myMethod.
	double myMethod.
	
	self assert: 2 equals: (double timesReceived: #myMethod).! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'CM 11/21/2020 18:37:48'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !

!Cart methodsFor: 'initialization' stamp: 'CM 11/22/2020 00:39:27'!
totalProductsPrice

	^ items sum: [ :item | catalog at: item ] ifEmpty: [ 0 ].! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'CM 11/21/2020 18:38:41'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'merchantProcesor salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'CM 11/22/2020 01:12:00'!
assertIsNotEmpty: aCart

	aCart isEmpty ifTrue: [ self error: self class cartCannotBeEmptyErrorDescription. ]! !

!Cashier methodsFor: 'assertions' stamp: 'CM 11/22/2020 01:12:39'!
assertIsNotExpired: aCreditCard

	^ (aCreditCard isExpired) ifTrue: [ self error: self class cannotChargeOnAnExpiredCreditCardErrorDescription ]! !


!Cashier methodsFor: 'checkout' stamp: 'CM 11/22/2020 01:38:18'!
checkout: aCart chargingOn: aTarjeta

	| totalToDebit |
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aTarjeta.
	
	totalToDebit := aCart totalProductsPrice.
	
	merchantProcesor debit: totalToDebit from: aTarjeta	.
	
	salesBook add: totalToDebit.
	
	^ totalToDebit.
	
	! !


!Cashier methodsFor: 'initialization' stamp: 'CM 11/22/2020 01:32:15'!
initializeBillingOn: aMerchantProcesor registeringSalesOn: aSalesBook
	
	salesBook := aSalesBook.
	merchantProcesor := aMerchantProcesor! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'class initialization' stamp: 'CM 11/22/2020 01:31:21'!
billingOn: aMerchantProcesor registeringSalesOn: aSalesBook
	
	^ self new initializeBillingOn: aMerchantProcesor registeringSalesOn: aSalesBook.! !


!Cashier class methodsFor: 'error messages' stamp: 'CM 11/22/2020 01:12:39'!
cannotChargeOnAnExpiredCreditCardErrorDescription

	^ 'Can not charge on an expired credit card'.! !

!Cashier class methodsFor: 'error messages' stamp: 'CM 11/22/2020 01:12:00'!
cartCannotBeEmptyErrorDescription

	^ 'Can not checkout an empty cart'.! !

!Cashier class methodsFor: 'error messages' stamp: 'CM 11/22/2020 01:14:06'!
paymentCannotBeProcessedErrorDescription

	^ 'Payment cannot be processed'.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'CM 11/21/2020 19:10:57'!
initializeExpiringOn: aMonth

	expirationDate := aMonth.! !


!CreditCard methodsFor: 'testing' stamp: 'CM 11/22/2020 00:23:56'!
isExpired

	^ self isExpiredBy: Date today.! !

!CreditCard methodsFor: 'testing' stamp: 'CM 11/21/2020 19:26:05'!
isExpiredBy: aDate

	^ aDate start > expirationDate end.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'class initialization' stamp: 'CM 11/21/2020 19:12:30'!
expiringOn: aMonth
	
	^ self new initializeExpiringOn: aMonth.! !


!classDefinition: #TestDouble category: 'TusLibros'!
Object subclass: #TestDouble
	instanceVariableNames: 'allowedMessages receivedMessages'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestDouble methodsFor: 'initialization' stamp: 'CM 11/22/2020 02:36:17'!
initialize

	allowedMessages := Dictionary new.
	receivedMessages := Dictionary new.
	
	! !


!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 00:09:40'!
allowToReceive: aMessageSelector andReturn: aBlock

	allowedMessages at: aMessageSelector put: aBlock.
	
	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:11:56'!
doesNotUnderstand: aMessage 

	| blockToEvaluate |

	blockToEvaluate := (allowedMessages at: aMessage selector 
					ifAbsent: [ ^ super doesNotUnderstand: aMessage. ]
	).

	self incrementTimesReceived: aMessage selector.
	^ blockToEvaluate valueWithArguments: aMessage arguments.
	
	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 03:11:32'!
incrementTimesReceived: aMessageSelector

	receivedMessages at: aMessageSelector put: (self timesReceived: aMessageSelector) + 1.
	
	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/22/2020 02:37:07'!
timesReceived: aMessageSelector

	^ receivedMessages at: aMessageSelector ifAbsent: [ 0 ].
	
	! !


!classDefinition: #TusLibrosTestSubjectFactory category: 'TusLibros'!
Object subclass: #TusLibrosTestSubjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTestSubjectFactory methodsFor: 'cart factories' stamp: 'CM 11/22/2020 02:06:11'!
createCart
	
	^ Cart acceptingItemsOf: self defaultCatalog.! !

!TusLibrosTestSubjectFactory methodsFor: 'cart factories' stamp: 'CM 11/22/2020 02:06:37'!
defaultCatalog
	
	| catalog |
	
	catalog := Dictionary new.
	catalog add: self itemSellByTheStore -> self itemSellByTheStorePrice.
	
	^ catalog.
	! !

!TusLibrosTestSubjectFactory methodsFor: 'cart factories' stamp: 'CM 11/22/2020 02:07:36'!
itemNotSellByTheStore
	
	^ 'invalidBook'.! !

!TusLibrosTestSubjectFactory methodsFor: 'cart factories' stamp: 'CM 11/22/2020 02:07:54'!
itemSellByTheStore
	
	^ 'validBook'.! !

!TusLibrosTestSubjectFactory methodsFor: 'cart factories' stamp: 'CM 11/22/2020 02:08:14'!
itemSellByTheStorePrice

	^ 3.! !


!TusLibrosTestSubjectFactory methodsFor: 'sales factories' stamp: 'CM 11/22/2020 02:17:37'!
createSalesBook
	
	^ OrderedCollection new.! !


!TusLibrosTestSubjectFactory methodsFor: 'credit card factories' stamp: 'CM 11/22/2020 02:02:10'!
createExpiredCreditCard.

	^ CreditCard expiringOn: Date today month previous.
! !

!TusLibrosTestSubjectFactory methodsFor: 'credit card factories' stamp: 'CM 11/22/2020 02:01:55'!
createValidCreditCard.

	^ CreditCard expiringOn: Date today month.
! !
