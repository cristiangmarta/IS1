!classDefinition: #CartTest category: #'20-TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '20-TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 09:05:33'!
test01NewCartIsEmpty

self assert: (Cart newCart) contentListed isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 10:00:57'!
test02AProductIsAddedToTheCartCorrectly
|cart|
cart:=Cart newCart.
cart add: 1 of: '97831484100' .
self assert: (cart) contentListed = (OrderedCollection with: '97831484100' with: 1).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 10:21:26'!
test03AddingTheSameItemTwoDIfferentTimesIncreaseItsQuantity
|cart|
cart:=Cart newCart.
cart add: 2 of: '97831484100' .
cart add: 4 of: '97831484100' .
self assert: (cart) contentListed = (OrderedCollection with: '97831484100' with: 6).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 10:21:33'!
test04MultipleProductsOfDifferentTypeAreAddedToTheCartCorrectly
|cart expectedContent contentListed|
cart:=Cart newCart.
cart add: 1 of: '97831484100' .
cart add: 1 of: '97831484101' .
cart add: 1 of: '97831484103' .
expectedContent:=(OrderedCollection with: '97831484103' with: 1 with: '97831484101' with: 1).
expectedContent add: '97831484100'.
expectedContent add: 1.

contentListed :=cart contentListed .

self assert: (contentListed=expectedContent ).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 10:21:40'!
test05MultipleCopiesOfTheSameProductsAreAddedToTheCartCorrectly
|cart expectedContent contentListed|
cart:=Cart newCart.
cart add: 2 of: '97831484100' .
cart add: 4 of: '97831484101' .
cart add: 1 of: '97831484103' .
expectedContent:=(OrderedCollection with: '97831484103' with: 1 with: '97831484101' with: 4).
expectedContent add: '97831484100'.
expectedContent add: 2.

contentListed :=cart contentListed .

self assert: (contentListed=expectedContent ).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'AS 11/19/2020 10:21:46'!
test06CanNotAddNotPositiveQuantitiesOfProductsToTheCar
|cart|
cart:=Cart newCart.
self should: [  cart add: 0 of: '97831484100']	
		raise: Error withMessageText: Cart canNotAddNegativeAmountsOfProducts.! !


!classDefinition: #Cart category: #'20-TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'cartContent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '20-TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'AS 11/19/2020 06:11:29'!
initializeNewCart
	cartContent:=Bag new! !



!Cart methodsFor: 'addingElements' stamp: 'AS 11/19/2020 09:28:12'!
add: aQuantity of: aISBN 

	(aQuantity >0) ifTrue: [cartContent add: aISBN withOccurrences: aQuantity.]
	 ifFalse:  [self error: self class canNotAddNegativeAmountsOfProducts ]
	! !


!Cart methodsFor: 'accessing' stamp: 'AS 11/19/2020 07:40:19'!
contentListed
|contents contentListed|
	contents:=cartContent contents .
	contentListed:=OrderedCollection new.
	contents keysDo: [ :key | contentListed add: key. 
					contentListed add: (contents at:key) ].
				
	^contentListed! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'20-TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AS 11/18/2020 22:29:34'!
newCart	
	^self new initializeNewCart! !


!Cart class methodsFor: 'error handling' stamp: 'AS 11/19/2020 09:51:07'!
canNotAddNegativeAmountsOfProducts
	^'The Quantity you add of a product must be positive'! !
