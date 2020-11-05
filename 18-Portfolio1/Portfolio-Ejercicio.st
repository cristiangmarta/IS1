!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 10:57:54'!
test01

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:02:55'!
test02

	| portfolio account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio new.
	portfolio add: account.
	
	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:06:27'!
test03

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	portfolio add: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 50 on: account2.
	portfolio add: account2.
	
	self assert: 150 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:13:20'!
test04

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:19:46'!
test05

	| portfolio account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: account.
	portfolio := Portfolio new add: account.
		
	self assert: 1 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:27:53'!
test06

	| portfolio |
	
	portfolio := Portfolio new.
		
	self should: [ portfolio add: portfolio ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:31:40'!
test07

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: portfolio2.
			
	self should: [ portfolio2 add: portfolio1 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:38:24'!
test08

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio1 add: portfolio2.
	portfolio2 add: portfolio3.
					
	self should: [ portfolio3 add: portfolio1 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 12:40:08'!
test09

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	
	portfolio1 add: portfolio2.
	portfolio3 add: portfolio2.
					
	self should: [ portfolio1 add: portfolio3 ] raise: Error withMessageText: Portfolio xxErrorDescription! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:15'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'CM 11/5/2020 10:52:46'!
addTo: aBalance

	^ aBalance + value! !

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'CM 11/5/2020 10:53:06'!
addTo: aBalance

	^ aBalance - value! !

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 12:43:12'!
add: aReceptiveAccount 
	
	(aReceptiveAccount isKindOf: Portfolio) ifTrue: [
		aReceptiveAccount = self ifTrue: [ self error: self class xxErrorDescription ].
		(aReceptiveAccount includes: self) ifTrue: [ self error: self class xxErrorDescription ].
		accounts do: [ :account | 
			(aReceptiveAccount includes: account) ifTrue: [ self error: self class xxErrorDescription ].
		]
		
	].
	
	accounts add: aReceptiveAccount .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:12:44'!
balance

	^ accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:14:49'!
hasRegistered: aTransaction 

	^ accounts anySatisfy: [ :account | account hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:41:47'!
includes: aPortfolio

	^ (accounts includes: aPortfolio) or: (accounts anySatisfy: [ :account | 
		(account isKindOf: Portfolio) and: (account includes: aPortfolio).
	]).! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:07:44'!
initialize

	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:24:34'!
transactions

	^ accounts inject: OrderedCollection new into: [ :allTransactions :account | allTransactions addAll: account transactions ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CM 11/5/2020 11:28:33'!
xxErrorDescription
	
	^ 'No se puede tener ciclos' ! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'CM 11/5/2020 10:55:48'!
balance
	
	^ transactions inject: 0 into: [ :acum :aTransaction | 
		aTransaction addTo: acum
	].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
