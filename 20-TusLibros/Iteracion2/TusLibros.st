!classDefinition: #TestDoubleTest category: 'TusLibros'!
TestCase subclass: #TestDoubleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:29:08'!
test01DoubleShouldExecuteBlockWhenAnAllowedMessageIsSent

	| double executed |
	
	double := TestDouble new.
	
	executed := false.
	
	double allowToReceive: #myMethod andRun: [ executed := true ].
	
	double myMethod.
	self assert: executed.! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:30:00'!
test02DoubleShouldRaiseErrorWhenMessageReceivedHasNotBeenAllowed

	| double |
	
	double := TestDouble new.
	
	self should: [ double myMethod ] raise: MessageNotUnderstood.
		! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:34:15'!
test03DoubleShouldExecuteBlockWithSameArgments

	| double executed |
	
	double := TestDouble new.
	
	executed := false.
	
	double allowToReceive: #myMethod: andRun: [ :arg | executed := arg ].
	
	double myMethod: true.
	self assert: executed.! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:43:02'!
test04WhenAllowedMessageIsNotSentTimesReceivedIsZero
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andRun: [ ].
	
	self assert: 0 equals: (double timesReceived: #myMethod).! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:42:34'!
test05TimesReceivedIs1WhenMessageIsSentOnce
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andRun: [ ].
	double myMethod.
	
	self assert: 1 equals: (double timesReceived: #myMethod).! !

!TestDoubleTest methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:45:13'!
test06TimesReceivedEqualsTheAmountOfTimesTheMessageWasSent
	| double |
	
	double := TestDouble new.
	double allowToReceive: #myMethod andRun: [ ].
	double myMethod.
	double myMethod.
	
	self assert: 2 equals: (double timesReceived: #myMethod).! !


!classDefinition: #TusLibrosTest category: 'TusLibros'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:47:11'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:57:47'!
createExpiredCreditCard
	
	^ CreditCard expiringOn: Date today month previous.! !

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:57:41'!
createValidCreditCard
	
	^ CreditCard expiringOn: Date today month.! !

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:47:48'!
defaultCatalog
		
	| catalog |
	
	catalog := Dictionary new.
	catalog add: self itemSellByTheStore -> self itemSellByTheStorePrice.
	
	^ catalog.
	! !

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:57:06'!
itemSellByTheStore
	
	^ 'validBook'! !

!TusLibrosTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:57:13'!
itemSellByTheStorePrice
	
	^ 3.! !


!classDefinition: #CartTest category: 'TusLibros'!
TusLibrosTest subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/25/2020 18:49:22'!
test09EmptyCartIsFreeFromCharge

	| cart |
	
	cart := self createCart.
	
	self assert: cart totalProductsPrice equals: 0! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/25/2020 18:50:23'!
test10AfterAddingAnItemTheCartTotalPriceIsUpdatedByItsValue

	| cart |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	
	self assert: cart totalProductsPrice equals: self itemSellByTheStorePrice.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TusLibrosTest subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:37:08'!
createMerchantProcessorDouble

	^ self createMerchantProcessorDoubleWithDebitBehaviour: [ :amount :creditCard | ].
	! !

!CashierTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:36:54'!
createMerchantProcessorDoubleWithDebitBehaviour: aBlock

	| merchantProcesor |
	
	merchantProcesor := TestDouble new.
	merchantProcesor allowToReceive: #debit:from: andRun: aBlock.
	
	^ merchantProcesor.
! !

!CashierTest methodsFor: 'support' stamp: 'CM 11/25/2020 19:09:40'!
createSalesBook
	
	^ OrderedCollection new.! !


!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 20:27:46'!
test01CanNotCheckoutAnEmptyCart
	
	| cart creditCard cashier merchantProcessor salesBook |
	
	cart := self createCart.
	creditCard := self createValidCreditCard.

	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := self createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.
	
	self should: [
			cashier checkout: cart chargingOn: creditCard
		]  raise: Error withMessageText: Cashier cartCannotBeEmptyErrorDescription.
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 20:27:55'!
test02AmountChargedCorrelatesToCartTotalPrice
	
	| cart cashier receiptAmount creditCard merchantProcessor salesBook |
	
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	creditCard := self createValidCreditCard.
	
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := self createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	receiptAmount := cashier checkout: cart chargingOn: creditCard.
	
	self assert: receiptAmount equals: self itemSellByTheStorePrice * 2.
	
	
		! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 19:32:25'!
test03CanNotChargeOnAnExpiredCreditCard
	
	| cart cashier expiredCreditCard merchantProcessor salesBook |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	expiredCreditCard := self createExpiredCreditCard.
	
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := self createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	self should: [
			cashier checkout: cart chargingOn: expiredCreditCard.
		] raise: Error withMessageText: Cashier cannotChargeOnAnExpiredCreditCardErrorDescription .
	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 19:09:18'!
test04SuccessfulCheckoutRegistersSaleOnSalesBook
	
	| cart cashier receiptAmount salesBook creditCard merchantProcessor |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	creditCard := self createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDouble.
	salesBook := self createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	receiptAmount := cashier checkout: cart chargingOn: creditCard.
	
	self assert: salesBook size equals: 1.
	self assert: salesBook first equals: receiptAmount.
! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 19:35:38'!
test05CanNotProcessDebitWhenMerchantProcessorIsDown
	
	| cart cashier salesBook creditCard merchantProcessor |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	creditCard := self createValidCreditCard.
	merchantProcessor := self createMerchantProcessorDoubleWithDebitBehaviour: [ :amount :card | self error: Cashier paymentCannotBeProcessedErrorDescription ].
	salesBook := self createSalesBook.
	
	cashier := Cashier billingOn: merchantProcessor registeringSalesOn: salesBook.
	
	self should: [
			cashier checkout: cart chargingOn: creditCard
		] raise: Error withExceptionDo: [ :error | 
			self assert: (salesBook isEmpty).
			self assert: error messageText equals: Cashier paymentCannotBeProcessedErrorDescription.
		]

	! !

!CashierTest methodsFor: 'tests' stamp: 'CM 11/25/2020 19:40:04'!
test06CashierOnlyChargesOneTimeWithRightAmountAndCorrectCard
	
	| cart cashier salesBook creditCard merchantProcessor chargedAmount chargedCreditCard receiptAmount |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	creditCard := self createValidCreditCard.
	
	merchantProcessor := self createMerchantProcessorDoubleWithDebitBehaviour: [ :amountToCharge :creditCardToCharge | 
		chargedAmount  := amountToCharge.
		chargedCreditCard  := creditCardToCharge.
	].
	salesBook := self createSalesBook.

	cashier := Cashier billingOn: merchantProcessor 
				      registeringSalesOn: salesBook.

	receiptAmount := cashier checkout: cart chargingOn: creditCard.
		
	self assert: (		merchantProcessor timesReceived: #debit:from: ) equals: 1.
	self assert: chargedAmount equals: receiptAmount.
	self assert: chargedCreditCard equals: creditCard.
	! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TusLibrosTest subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'CM 11/25/2020 18:59:06'!
test01CreditCardIsExpiredWhenExpirationDateIsPassed

	| creditCard |
	
	creditCard := self createExpiredCreditCard.
	
	self assert: creditCard isExpired.! !

!CreditCardTest methodsFor: 'tests' stamp: 'CM 11/25/2020 19:01:48'!
test02CreditCardIsValidWhenExpirationDateHasNotYetArrived

	| creditCard |
	
	creditCard := self createValidCreditCard.
	
	self deny: creditCard isExpired.! !


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


!Cart methodsFor: 'assertions' stamp: 'CM 11/25/2020 18:52:45'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'CM 11/25/2020 18:51:19'!
totalProductsPrice

	^ items sum: [ :item | catalog at: item ] ifEmpty: [ 0 ].! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
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
	instanceVariableNames: 'salesBook merchantProcesor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'CM 11/25/2020 20:20:50'!
assertIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [ self error: self class cartCannotBeEmptyErrorDescription ]! !

!Cashier methodsFor: 'assertions' stamp: 'CM 11/25/2020 20:21:08'!
assertIsNotExpired: aCreditCard

	^ (aCreditCard isExpired) ifTrue: [ self error: self class cannotChargeOnAnExpiredCreditCardErrorDescription ]! !


!Cashier methodsFor: 'chckout' stamp: 'CM 11/25/2020 20:24:08'!
checkout: aCart chargingOn: aCreditCard

	| totalToDebit |
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard.
	
	totalToDebit := aCart totalProductsPrice.
	
	merchantProcesor debit: totalToDebit from: aCreditCard.
	
	self registerSale: totalToDebit .
	^ totalToDebit.! !

!Cashier methodsFor: 'chckout' stamp: 'CM 11/25/2020 20:24:08'!
registerSale: totalToDebit

	^ salesBook add: totalToDebit! !


!Cashier methodsFor: 'initialization' stamp: 'CM 11/25/2020 19:12:03'!
initializeBillingOn: aMerchantProcesor registeringSalesOn: aSalesBook
	
	salesBook := aSalesBook.
	merchantProcesor := aMerchantProcesor! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'CM 11/25/2020 18:54:49'!
cannotChargeOnAnExpiredCreditCardErrorDescription

	^ 'Can not charge on an expired credit card'.! !

!Cashier class methodsFor: 'error messages' stamp: 'CM 11/25/2020 18:44:13'!
cartCannotBeEmptyErrorDescription

	^ 'Can not checkout an empty cart'.! !

!Cashier class methodsFor: 'error messages' stamp: 'CM 11/25/2020 19:36:08'!
paymentCannotBeProcessedErrorDescription

	^ 'Payment cannot be processed'.! !


!Cashier class methodsFor: 'class initialization' stamp: 'CM 11/25/2020 19:11:40'!
billingOn: aMerchantProcesor registeringSalesOn: aSalesBook
	
	^ self new initializeBillingOn: aMerchantProcesor registeringSalesOn: aSalesBook.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'CM 11/25/2020 19:03:29'!
isExpired
	
	^ self isExpiredBy: Date today.! !

!CreditCard methodsFor: 'testing' stamp: 'CM 11/25/2020 19:03:16'!
isExpiredBy: aDate
	
	^ aDate start > expirationDate end.! !


!CreditCard methodsFor: 'initialization' stamp: 'CM 11/25/2020 18:58:14'!
initializeExpiringOn: aMonth

	expirationDate := aMonth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'class initialization' stamp: 'CM 11/25/2020 18:57:56'!
expiringOn: aMonth
	
	^ self new initializeExpiringOn: aMonth.! !


!classDefinition: #TestDouble category: 'TusLibros'!
Object subclass: #TestDouble
	instanceVariableNames: 'allowedMessages receivedMessages'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:13:43'!
allowToReceive: aMessageSelector andRun: aBlock

	allowedMessages at: aMessageSelector put: aBlock.
	
	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:44:33'!
doesNotUnderstand: aMessage 

	| blockToRun |

	blockToRun := (allowedMessages at: aMessage selector 
					ifAbsent: [ ^ super doesNotUnderstand: aMessage. ]
	).
	
	self incrementTimesReceived: aMessage selector.
	^ blockToRun valueWithArguments: aMessage arguments.
	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:45:41'!
incrementTimesReceived: aMessageSelector

	receivedMessages at: aMessageSelector put: (self timesReceived: aMessageSelector) + 1.	! !

!TestDouble methodsFor: 'as yet unclassified' stamp: 'CM 11/25/2020 19:43:56'!
timesReceived: aMessageSelector

	^ receivedMessages at: aMessageSelector ifAbsent: [ 0 ].

	
	! !


!TestDouble methodsFor: 'initialization' stamp: 'CM 11/25/2020 19:43:39'!
initialize

	allowedMessages := Dictionary new.
	receivedMessages := Dictionary new.
	! !
