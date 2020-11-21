!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
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

!CartTest methodsFor: 'tests' stamp: 'CM 11/21/2020 18:27:51'!
test09

	| cart |
	
	cart := self createCart.
	
	self assert: cart totalPrice equals: 0! !

!CartTest methodsFor: 'tests' stamp: 'CM 11/21/2020 18:28:51'!
test10

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	
	self assert: cart totalPrice equals: self itemSellByTheStorePrice.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'CM 11/21/2020 18:36:56'!
defaultCatalog
	
	|catalog|
	catalog := Dictionary new.
	
	catalog add: self itemSellByTheStore -> self itemSellByTheStorePrice.
	^catalog.
	! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!CartTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:29:04'!
itemSellByTheStorePrice
	^ 3.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:16:57'!
createCart

	^ Cart acceptingItemsOf: self defaultCatalog.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:18:23'!
createCashier
	
	| merchantProcesor |
	merchantProcesor := M1 behavingLike: [] .
	^ Cashier for: merchantProcesor.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:16:51'!
createCashierWith: aMerchantProcesor
	
	^ Cashier for: aMerchantProcesor.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:29:58'!
createTarjeta

	^ Tarjeta expiringOn: Date today month.
! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:33:17'!
createTarjetaVencida

	^ Tarjeta expiringOn: Date today month previous.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:41:05'!
defaultCatalog
	
	|catalog|
	catalog := Dictionary new.
	
	catalog add: self itemSellByTheStore -> self itemSellByTheStorePrice.
	^catalog.
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:19:44'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:19:53'!
itemSellByTheStorePrice
	
	^ 3! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:18:10'!
test01
	
	| cart tarjeta cashier |
	cart := self createCart.
	tarjeta := self createTarjeta.
	
	cashier := self createCashier.
	
	self should: [
			cashier checkout: cart with: tarjeta
		]  raise: Error withMessageText: 'No se puede hacer checkout con un carrito vacio'
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:20:49'!
test02
	
	| cart tarjeta cashier receipt |
	
	cart := self createCart.
	tarjeta := self createTarjeta.
	cashier := self createCashier.
	
	cart add: self itemSellByTheStore .
	
	receipt := cashier checkout: cart with: tarjeta.
	
	self assert: receipt equals: self itemSellByTheStorePrice .
	
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:25:48'!
test03
	
	| cart tarjeta cashier receipt |
	
	cart := self createCart.
	tarjeta := self createTarjeta.
	cashier := self createCashier.
	
	cart add: 2 of: self itemSellByTheStore .
	
	receipt := cashier checkout: cart with: tarjeta.
	
	self assert: receipt equals: self itemSellByTheStorePrice * 2.	
	
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:44:15'!
test04
	
	| cart tarjeta cashier |
	
	cart := self createCart.
	tarjeta := self createTarjetaVencida.
	cashier := self createCashier.
	
	self should: [
			cashier checkout: cart with: tarjeta
		] raise: Error withMessageText: 'La tarjeta esta vencida'
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:24:34'!
test05CuandoElMerchantProcesorNoAnda
	
	| cart tarjeta cashier |
	
	cart := self createCart.
	cart add: self itemSellByTheStore . 
	
	tarjeta := self createTarjeta.
	cashier := self createCashierWith: (M1 behavingLike: [ self error: 'No se puede procesar la venta' ]).
	
	self should: [
			cashier checkout: cart with: tarjeta
		] raise: Error withExceptionDo: [ :error | 
			self assert: (cashier sales isEmpty).
			self assert: error messageText equals: 'No se puede procesar la venta'.
		]

	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:27:06'!
test06CuandoElMerchantProcesorAndaLaVentaSeRegistra
	
	| cart tarjeta cashier receipt |
	
	cart := self createCart.
	cart add: self itemSellByTheStore . 
	
	tarjeta := self createTarjeta.
	cashier := self createCashier.
	
	receipt := cashier checkout: cart with: tarjeta.
	self assert: (cashier sales includes: receipt ).
	! !


!classDefinition: #TarjetaTest category: 'TusLibros'!
TestCase subclass: #TarjetaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TarjetaTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:08:18'!
createExpiredTarjeta.

	^ Tarjeta expiringOn: Date today month previous.
! !

!TarjetaTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:29:36'!
createNonExpiredTarjeta.

	^ Tarjeta expiringOn: Date today month.
! !

!TarjetaTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:08:49'!
test01

	| tarjeta |
	
	tarjeta := self createExpiredTarjeta.
	
	self assert: (tarjeta isExpiredBy: Date today).! !

!TarjetaTest methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:09:06'!
test02

	| tarjeta |
	
	tarjeta := self createNonExpiredTarjeta.
	
	self deny: (tarjeta isExpiredBy: Date today).! !


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


!Cart methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 18:40:11'!
totalPrice

	self isEmpty ifTrue: [ ^0 ].
	^ items sum: [ :item | catalog at: item ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'merchantProcesor sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:28:09'!
checkout: aCart with: aTarjeta

	| totalToDebit |
	(aTarjeta isExpiredBy: Date today) ifTrue: [ ^ self error: 'La tarjeta esta vencida' ].

	aCart isEmpty ifTrue: [ ^ self error: 'No se puede hacer checkout con un carrito vacio'. ].
	
	totalToDebit := aCart totalPrice.
	
	merchantProcesor debit: aTarjeta for: totalToDebit	.
	
	sales add: totalToDebit.
	
	^ totalToDebit.
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:28:40'!
initializeWith: aMerchantProcesor
	
	sales := OrderedCollection new.
	merchantProcesor := aMerchantProcesor! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:27:36'!
sales
	^ sales.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:55:20'!
for: aMerchantProcesor
	
	^ self new initializeWith: aMerchantProcesor! !


!classDefinition: #M1 category: 'TusLibros'!
Object subclass: #M1
	instanceVariableNames: 'behaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!M1 methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:14:36'!
debit: aTarjeta for: anAmount
	
	^ behaviour value.
	! !

!M1 methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:14:21'!
initializeWithBehaviour: aBlock
	
	behaviour := aBlock.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'M1 class' category: 'TusLibros'!
M1 class
	instanceVariableNames: ''!

!M1 class methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 20:13:56'!
behavingLike: aBlock
	
	^ self new initializeWithBehaviour: aBlock.! !


!classDefinition: #Tarjeta category: 'TusLibros'!
Object subclass: #Tarjeta
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:10:57'!
initializeExpiringOn: aMonth

	expirationDate := aMonth.! !

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:26:05'!
isExpiredBy: aDate

	^ aDate start > expirationDate end.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tarjeta class' category: 'TusLibros'!
Tarjeta class
	instanceVariableNames: ''!

!Tarjeta class methodsFor: 'as yet unclassified' stamp: 'CM 11/21/2020 19:12:30'!
expiringOn: aMonth
	
	^ self new initializeExpiringOn: aMonth.! !
