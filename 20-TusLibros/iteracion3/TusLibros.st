!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'AS 12/3/2020 06:31:26'!
test09CartContentsReturnsBagWithCartContent

	| cart cartExpectedContents|
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	cartExpectedContents:=Bag new .
	cartExpectedContents add: (testObjectsFactory itemSellByTheStore) withOccurrences: 2.
	self assert: (cart contents= cartExpectedContents).! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InternalRestInterfaceTest category: #TusLibros!
TestCase subclass: #InternalRestInterfaceTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalRestInterfaceTest methodsFor: 'tests- Life Expectancy Cart' stamp: 'AS 12/3/2020 15:21:12'!
test11ListingACartIf30MinutesHappenedSinceTheCartWasLastUsedShouldRaiseAnError

self thirtyMinutesHappenedSinceTheCartWasLastUsedWhenRunningBlock: [:interface :cartID |interface listCart: cartID .].

! !

!InternalRestInterfaceTest methodsFor: 'tests- Life Expectancy Cart' stamp: 'AS 12/3/2020 15:21:07'!
test12addingToACartIf30MinutesHappenedSinceTheCartWasLastUsedShouldRaiseAnError

self thirtyMinutesHappenedSinceTheCartWasLastUsedWhenRunningBlock: [:interface :cartID | interface addToCart: cartID theProduct: (testObjectsFactory  itemSellByTheStore ) withAmount: 2.]
! !

!InternalRestInterfaceTest methodsFor: 'tests- Life Expectancy Cart' stamp: 'AS 12/3/2020 15:21:01'!
test13tryingToCheckoutIf30MinutesHappenedSinceTheCartWasLastUsedShouldRaiseAnError

self thirtyMinutesHappenedSinceTheCartWasLastUsedWhenRunningBlock: [:interface :cartID | interface checkOutCart: cartID debitingFrom: testObjectsFactory notExpiredCreditCard withProcessor: self.]

! !

!InternalRestInterfaceTest methodsFor: 'tests- Life Expectancy Cart' stamp: 'AS 12/3/2020 15:16:08'!
thirtyMinutesHappenedSinceTheCartWasLastUsedWhenRunningBlock: aBlock

|interface user password cartID|

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.

user:= (testObjectsFactory validUser).
password:=(testObjectsFactory validUser).

cartID:= interface createCartForClient: user withPassword: password .

interface changeClockTo: [DateAndTime now + 30 minutes].

self
		should: [(aBlock value: interface value: cartID)]
		raise: Error withMessageText: Store cartExpiredErrorDescription.
! !


!InternalRestInterfaceTest methodsFor: 'tests- valid operations' stamp: 'AS 12/3/2020 03:41:19'!
test01NewCartsAreCreatedEmpty
|interface cartId|

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
							
							
	cartId := interface createCartForClient:(testObjectsFactory validUser) withPassword: (testObjectsFactory validPassword).
	
	self assert: (interface listCart: cartId) isEmpty.
! !

!InternalRestInterfaceTest methodsFor: 'tests- valid operations' stamp: 'AS 12/3/2020 08:29:41'!
test05ValidItemsAreAddedToCart
|interface cartId cartExpectedContents|

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
cartId := interface createCartForClient:(testObjectsFactory validUser) withPassword: (testObjectsFactory validPassword).
	interface addToCart: cartId theProduct: (testObjectsFactory itemSellByTheStore ) withAmount: 2.						
	
	cartExpectedContents:=Bag new .
	cartExpectedContents add: (testObjectsFactory itemSellByTheStore) withOccurrences: 2.
	
	self assert: (interface listCart: cartId)=cartExpectedContents .
	
! !

!InternalRestInterfaceTest methodsFor: 'tests- valid operations' stamp: 'AS 12/3/2020 10:20:25'!
test07PurchasesListFromAClientWithNoPurchasesIsEmpty

|interface user password|

	interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
		
	user:= testObjectsFactory validUser.
	password :=testObjectsFactory validPassword .
							
	interface createCartForClient:user withPassword: password.
	
	self assert: ((interface listPurchasesOfUser: user withPassword: password) = ((Bag new )->0)).

! !

!InternalRestInterfaceTest methodsFor: 'tests- valid operations' stamp: 'AS 12/3/2020 14:12:05'!
test09CheckingOutACartAddsPurchasesToItsUser

|interface user password cartID cartExpectedContents expectedPrice|

	interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
		
	user:= testObjectsFactory validUser.
	password :=testObjectsFactory validPassword .
							
	cartID :=interface createCartForClient:user withPassword: password.
	
	interface addToCart: cartID theProduct: (testObjectsFactory itemSellByTheStore ) withAmount: 2.						
	
	interface checkOutCart:  cartID debitingFrom: testObjectsFactory notExpiredCreditCard withProcessor: self.
	
	
	cartExpectedContents:=Bag new .
	cartExpectedContents add: (testObjectsFactory itemSellByTheStore) withOccurrences: 2.
	expectedPrice := testObjectsFactory itemSellByTheStorePrice * 2.
	
	
	self assert: ((interface listPurchasesOfUser: user withPassword: password) = ((cartExpectedContents )->expectedPrice )).
! !


!InternalRestInterfaceTest methodsFor: 'merchant processor' stamp: 'AS 12/3/2020 13:08:32'!
debit: anAmount from: aCreditCard 
! !


!InternalRestInterfaceTest methodsFor: 'setUp' stamp: 'AS 12/2/2020 21:45:19'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 06:58:54'!
test02creatingACartRisesAnErrorIfAuthenticatorDoesNotValidateCredentials
|interface |

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
							
							
	self
		should: [interface createCartForClient:(testObjectsFactory invalidUser) withPassword: (testObjectsFactory invalidPassword).]
		raise: Error withMessageText: Authenticator wrongCredentialsErrorDescription.
	
! !

!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 07:44:35'!
test03cannotListACartIfThereIsNotACartWIthTheAskedId
|interface |

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
interface createCartForClient:(testObjectsFactory validUser) withPassword: (testObjectsFactory validPassword).							
	self
		should: [interface listCart: 2]
		raise: Error withMessageText: Store invalidCartErrorDescription.
! !

!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 08:12:15'!
test04cannotAddToCartIfThereIsNotACartWithTheAskedId
|interface |

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
							
	self
		should: [interface addToCart: 2 theProduct: (testObjectsFactory itemSellByTheStore) withAmount: 1.]
		raise: Error withMessageText: Store invalidCartErrorDescription.
! !

!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 14:14:22'!
test06CannotCheckoutCartWithInvalidID
|interface  |

	interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
	
	self
		should: [interface checkOutCart: 1 debitingFrom: (testObjectsFactory notExpiredCreditCard ) withProcessor: self .]
		raise: Error withMessageText: Store invalidCartErrorDescription.

	
! !

!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 10:24:27'!
test08ListingPurchasesRaiseAndErrorIfAuthenticatorDoesNotValidateCredentials
|interface |

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
							
							
	self
		should: [interface listPurchasesOfUser: (testObjectsFactory validUser) withPassword:  (testObjectsFactory invalidPassword ) .]
		raise: Error withMessageText: Authenticator wrongCredentialsErrorDescription.
	

! !

!InternalRestInterfaceTest methodsFor: 'tests-errors' stamp: 'AS 12/3/2020 13:15:18'!
test10CheckingOutACartRemovesItFromTheListOfValidCarts

|interface user password cartID |

	interface := InternalRestInterface forStore: testObjectsFactory defaultStore.
		
	user:= testObjectsFactory validUser.
	password :=testObjectsFactory validPassword .
							
	cartID :=interface createCartForClient:user withPassword: password.
	
	interface addToCart: cartID theProduct: (testObjectsFactory itemSellByTheStore ) withAmount: 2.						
	
	interface checkOutCart:  cartID debitingFrom: testObjectsFactory notExpiredCreditCard withProcessor: self.

	self
		should: [interface listCart: cartID ]
		raise: Error withMessageText: Store invalidCartErrorDescription.

! !


!InternalRestInterfaceTest methodsFor: 'tests-different ID' stamp: 'AS 12/3/2020 14:22:08'!
test14twoCartsCreatedOneAfterTheOtherShouldHaveDifferentId

|interface user password cartID1 cartID2|

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.

user:= (testObjectsFactory validUser).
password:=(testObjectsFactory validUser).

cartID1:= interface createCartForClient: user withPassword: password .

cartID2:= interface createCartForClient: user withPassword: password .


self deny: cartID1=cartID2.

! !

!InternalRestInterfaceTest methodsFor: 'tests-different ID' stamp: 'AS 12/3/2020 14:56:57'!
test15twoCheckoutsOneAfterTheOtherShouldHaveDifferentNumber

|interface user password cartID checkoutNumber1 checkOutNumber2|

interface := InternalRestInterface forStore: testObjectsFactory defaultStore.

user:= (testObjectsFactory validUser).
password:=(testObjectsFactory validUser).

cartID:= interface createCartForClient: user withPassword: password .

	interface addToCart: cartID theProduct: (testObjectsFactory itemSellByTheStore ) withAmount: 2.						

checkoutNumber1:=interface checkOutCart:  cartID debitingFrom: testObjectsFactory notExpiredCreditCard withProcessor: self.

cartID:= interface createCartForClient: user withPassword: password .

	interface addToCart: cartID theProduct: (testObjectsFactory itemSellByTheStore ) withAmount: 2.						

checkOutNumber2:=interface checkOutCart:  cartID debitingFrom: testObjectsFactory notExpiredCreditCard withProcessor: self.




self deny: checkoutNumber1=checkOutNumber2.

! !


!classDefinition: #Authenticator category: #TusLibros!
Object subclass: #Authenticator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Authenticator methodsFor: 'Authenticate' stamp: 'AS 12/3/2020 04:17:40'!
authenticateUser: aUser withPassword: aPassword
self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Authenticator class' category: #TusLibros!
Authenticator class
	instanceVariableNames: ''!

!Authenticator class methodsFor: 'Error Description' stamp: 'AS 12/3/2020 07:01:12'!
wrongCredentialsErrorDescription
^'There is not an user with that combination of user and password'.! !


!classDefinition: #AuthenticatorSimulator category: #TusLibros!
Authenticator subclass: #AuthenticatorSimulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticatorSimulator methodsFor: 'as yet unclassified' stamp: 'AS 12/3/2020 07:09:28'!
authenticateUser: aUser withPassword: aPassword

((aUser~='invalidUser' ) and: (aPassword~='invalidPassword' )) ifTrue: [^true] ifFalse: [self error: self class wrongCredentialsErrorDescription]


! !


!classDefinition: #Cart category: #TusLibros!
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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'AS 12/3/2020 05:41:10'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'AS 12/3/2020 06:16:30'!
contents
	^ items! !

!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'AS 12/3/2020 05:43:45'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.
	
	items add: anItem withOccurrences: aQuantity 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #InternalRestInterface category: #TusLibros!
Object subclass: #InternalRestInterface
	instanceVariableNames: 'store clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalRestInterface methodsFor: 'interfaceOperations' stamp: 'AS 12/3/2020 11:55:29'!
addToCart: aCartId theProduct: aProduct withAmount: anAmount
store addToCart: aCartId theProduct: aProduct withAmount: anAmount atTime: (clock value).
! !

!InternalRestInterface methodsFor: 'interfaceOperations' stamp: 'AS 12/3/2020 14:26:30'!
checkOutCart: aCartId debitingFrom: aCreditCard withProcessor: aMerchantProcessor
^store checkOutCart: aCartId debitingFrom: aCreditCard withProcessor: aMerchantProcessor atTime: (clock value)

! !

!InternalRestInterface methodsFor: 'interfaceOperations' stamp: 'AS 12/3/2020 11:42:18'!
createCartForClient: aUser withPassword: aPassword
^store createCartForClient: aUser withPassword: aPassword atTime: (clock value).! !

!InternalRestInterface methodsFor: 'interfaceOperations' stamp: 'AS 12/3/2020 11:26:38'!
listCart: aCartId
^store listCart: aCartId atTime: (clock value).! !

!InternalRestInterface methodsFor: 'interfaceOperations' stamp: 'AS 12/3/2020 11:26:14'!
listPurchasesOfUser: aUserId withPassword: aPassword
^store listPurchasesOfUser: aUserId withPassword: aPassword! !


!InternalRestInterface methodsFor: 'initialize' stamp: 'AS 12/3/2020 11:19:57'!
initializeForStore:  aStore.

store:=aStore .
clock:=[DateAndTime now].! !


!InternalRestInterface methodsFor: 'change clock' stamp: 'AS 12/3/2020 13:47:46'!
changeClockTo: aClousure
clock:=aClousure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InternalRestInterface class' category: #TusLibros!
InternalRestInterface class
	instanceVariableNames: ''!

!InternalRestInterface class methodsFor: 'as yet unclassified' stamp: 'AS 12/3/2020 03:45:54'!
forStore: aStore

^self new initializeForStore: aStore .! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #Store category: #TusLibros!
Object subclass: #Store
	instanceVariableNames: 'authenticator catalogue nextIdavailableCart nextNumberAvailableTransaction salesBook cartsByID userPurchases totalCostOfUserPurchases timeOfLastUseCartsByID userOfCartById'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Store methodsFor: 'initialization' stamp: 'AS 12/3/2020 14:29:52'!
initializeWithAuthenticator: aAuthenticator withACatalogue: aCatalogue
authenticator :=aAuthenticator.
catalogue :=aCatalogue .

nextIdavailableCart := 1.
nextNumberAvailableTransaction:=1.

salesBook := OrderedCollection new.

cartsByID := Dictionary new.
timeOfLastUseCartsByID := Dictionary new.
userOfCartById := Dictionary new.

userPurchases := Dictionary new.
totalCostOfUserPurchases := Dictionary new.
! !


!Store methodsFor: 'nextID' stamp: 'AS 12/3/2020 14:30:09'!
increaseNextIdavailableCart
nextIdavailableCart := nextIdavailableCart + 1.

! !

!Store methodsFor: 'nextID' stamp: 'AS 12/3/2020 14:31:05'!
increaseNextNumberAvailableTransaction
nextNumberAvailableTransaction := nextNumberAvailableTransaction + 1.

! !


!Store methodsFor: 'operations' stamp: 'AS 12/3/2020 11:56:30'!
addToCart: aCartId theProduct: aProduct withAmount: anAmount  atTime: aTime.

(cartsByID includesKey: aCartId) ifTrue: [
	
	(((timeOfLastUseCartsByID at: aCartId) +30 minutes ) < aTime) ifTrue: [self error: self class cartExpiredErrorDescription].
	
	timeOfLastUseCartsByID at: aCartId put: aTime.
	
	^(cartsByID at: aCartId) add: anAmount of: aProduct .
	] 
	ifFalse:[
		self error: self class invalidCartErrorDescription .
	]

! !

!Store methodsFor: 'operations' stamp: 'AS 12/3/2020 14:33:46'!
checkOutCart: aCartId debitingFrom: aCreditCard withProcessor: aMerchantProcessor atTime: aTime
|cashier saleValue userOfCart transactionNumber|

(cartsByID includesKey: aCartId) ifTrue: [
	
	(((timeOfLastUseCartsByID at: aCartId) +30 minutes ) < aTime) ifTrue: [self error: self class cartExpiredErrorDescription].
	
	timeOfLastUseCartsByID at: aCartId put: aTime.
	
	cashier:= Cashier
		toCheckout: (cartsByID at: aCartId )
		charging:  aCreditCard
		throught: aMerchantProcessor
		on:  (aTime)
		registeringOn: (salesBook ).
		
		saleValue:= cashier checkOut.
		userOfCart:= userOfCartById at: aCartId .
		
		totalCostOfUserPurchases at: userOfCart  put: (totalCostOfUserPurchases at: userOfCart)+saleValue.
		(userPurchases at: userOfCart) addAll: ((cartsByID at: aCartId ) contents ).
		
	cartsByID removeKey: aCartId .
		timeOfLastUseCartsByID removeKey: aCartId.
		
		
		transactionNumber:=nextNumberAvailableTransaction .
	
	self increaseNextNumberAvailableTransaction .
	
	^transactionNumber.
	] 
	ifFalse:[
		self error: self class invalidCartErrorDescription .
	]
! !

!Store methodsFor: 'operations' stamp: 'AS 12/3/2020 14:30:09'!
createCartForClient: aUser withPassword: aPassword atTime: aTime
|authenticationResult iDOfCart|
authenticationResult := authenticator authenticateUser: aUser withPassword: aPassword.
authenticationResult ifTrue: [ 
	iDOfCart:=nextIdavailableCart .
	cartsByID at: iDOfCart put: (Cart acceptingItemsOf: catalogue) .
	timeOfLastUseCartsByID at: iDOfCart put: aTime.
	userOfCartById at: iDOfCart put: aUser.
	self increaseNextIdavailableCart .
	
	(totalCostOfUserPurchases includesKey: aUser) ifFalse: [
		totalCostOfUserPurchases at: aUser  put: 0.
		(userPurchases at: aUser put: Bag new).
	].

	
	
	^iDOfCart.
	].! !

!Store methodsFor: 'operations' stamp: 'AS 12/3/2020 11:45:44'!
listCart: aCartId atTime: aTime

(cartsByID includesKey: aCartId) ifTrue: [
	
	(((timeOfLastUseCartsByID at: aCartId) +30 minutes ) < aTime) ifTrue: [self error: self class cartExpiredErrorDescription].
	
	timeOfLastUseCartsByID at: aCartId put: aTime.
	
	^(cartsByID at: aCartId) contents.
	] 
	ifFalse:[
		self error: self class invalidCartErrorDescription .
	]! !

!Store methodsFor: 'operations' stamp: 'AS 12/3/2020 14:11:51'!
listPurchasesOfUser: aUser withPassword: aPassword

|authenticationResult|
authenticationResult := authenticator authenticateUser: aUser withPassword: aPassword.

authenticationResult ifTrue: [ 
	(userPurchases includesKey: aUser) ifTrue: [^(userPurchases at: aUser)->(totalCostOfUserPurchases at: aUser) ]
	ifFalse: [^((Bag new)->0). ]

	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Store class' category: #TusLibros!
Store class
	instanceVariableNames: ''!

!Store class methodsFor: 'as yet unclassified' stamp: 'AS 12/3/2020 11:36:31'!
cartExpiredErrorDescription
^'more than 30 minutes passes since the cart was last used'! !

!Store class methodsFor: 'as yet unclassified' stamp: 'AS 12/3/2020 07:45:43'!
invalidCartErrorDescription
^'There is not a cart with the asked ID'! !

!Store class methodsFor: 'as yet unclassified' stamp: 'AS 12/3/2020 02:50:26'!
withAuthenticator: aAuthenticator withACatalogue: aCatalogue
^self new initializeWithAuthenticator: aAuthenticator withACatalogue: aCatalogue.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'user and pasword' stamp: 'AS 12/3/2020 06:53:50'!
invalidPassword
^'invalidPassword'! !

!StoreTestObjectsFactory methodsFor: 'user and pasword' stamp: 'AS 12/3/2020 06:54:32'!
invalidUser
^'invalidUser'! !

!StoreTestObjectsFactory methodsFor: 'user and pasword' stamp: 'AS 12/3/2020 03:42:45'!
validPassword
^'validPassword'! !

!StoreTestObjectsFactory methodsFor: 'user and pasword' stamp: 'AS 12/3/2020 06:54:23'!
validUser
^'validUser'! !


!StoreTestObjectsFactory methodsFor: 'authenticator' stamp: 'AS 12/3/2020 04:44:13'!
defaultAuthenticator
^AuthenticatorSimulator new.
	
! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'AS 12/3/2020 03:51:51'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalogue! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'AS 12/3/2020 03:51:51'!
defaultCatalogue
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'store' stamp: 'AS 12/3/2020 03:53:23'!
defaultStore

^Store withAuthenticator: (self defaultAuthenticator) withACatalogue: (self defaultCatalogue)
! !

