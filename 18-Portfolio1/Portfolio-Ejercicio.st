!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test01

	| portfolio |
	
	portfolio := PortfolioCollection new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 13:11:47'!
test011

	| portfolio |
	
	portfolio := PortfolioAccount with: ReceptiveAccount new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 13:13:25'!
test02

	| portfolio account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := PortfolioAccount with: account.
	
	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test022

	| portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio1 := PortfolioAccount with: account.
	portfolio2 := PortfolioCollection new.
	portfolio2 add: portfolio1.
	
	self assert: 100 equals: portfolio2 balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test03

	| portfolio1 portfolio2 portfolio3 account1 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 50 on: account1.
	portfolio1 := PortfolioAccount with: account1.
	
	portfolio2 := PortfolioCollection new.
	portfolio2 add: portfolio1.
	
	portfolio3 := PortfolioCollection new.
	portfolio3 add: portfolio2.
	
	self assert: 50 equals: portfolio3 balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 13:26:16'!
test04

	| portfolio account1 account2 deposit |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := PortfolioAccount with: account1.
	
	deposit := Deposit register: 100 on: account2.
	
	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test044

	| portfolio account1 deposit |
	
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioCollection new.
	
	deposit := Deposit register: 100 on: account1.
	
	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 13:27:50'!
test05

	| portfolio account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: account.
	portfolio := PortfolioAccount with: account.
		
	self assert: 1 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test055

	| portfolio1 portfolio2 account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: account.
	portfolio1 := PortfolioAccount with: account.

	portfolio2 := PortfolioCollection new.	
	portfolio2 add: portfolio1 .
	
	self assert: 1 equals: portfolio2 transactions size.
	self assert: (portfolio2 transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test06

	| portfolio |
	
	portfolio := PortfolioCollection new.
		
	self should: [ portfolio add: portfolio ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test066

	| portfolio1 portfolio2 |
	
	portfolio1 := PortfolioAccount with: ReceptiveAccount new.
	portfolio2 := PortfolioCollection new.
		
	self should: [ portfolio1 add: portfolio2 ] raise: Error withMessageText: 'No se puede agregar un porfolio a un portfolioAccount'! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test07

	| portfolio1 portfolio2 |
	
	portfolio1 := PortfolioCollection new.
	portfolio2 := PortfolioCollection new.
	
	portfolio1 add: portfolio2.
			
	self should: [ portfolio2 add: portfolio1 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test08

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := PortfolioCollection new.
	portfolio2 := PortfolioCollection new.
	portfolio3 := PortfolioCollection new.
	
	portfolio1 add: portfolio2.
	portfolio2 add: portfolio3.
					
	self should: [ portfolio3 add: portfolio1 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test09

	| portfolio1 portfolio2 portfolio3 portfolio4 |
	
	portfolio1 := PortfolioCollection new.
	portfolio2 := PortfolioCollection new.
	portfolio3 := PortfolioCollection new.
	portfolio4 := PortfolioCollection new.
	
	portfolio1 add: portfolio2.
	portfolio3 add: portfolio4.
	portfolio4 add: portfolio2.
					
	self should: [ portfolio2 add: portfolio3 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test10

	| portfolio1 portfolio2 portfolio3 account |
	
	account := ReceptiveAccount new.
	
	portfolio1 := PortfolioCollection new.
	portfolio2 := PortfolioAccount with: account.
	portfolio3 := PortfolioAccount with: account.
	
	
	portfolio1 add: portfolio2.
				
	self should: [ portfolio1 add: portfolio3 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test11

	| portfolio1 portfolio2 portfolio3 portfolio4 account |
	
	account := ReceptiveAccount new.
	
	portfolio1 := PortfolioCollection new.
	portfolio4 := PortfolioCollection new.
	
	portfolio2 := PortfolioAccount with: account.
	portfolio3 := PortfolioAccount with: account.
	
	portfolio4 add: portfolio2.
	portfolio1 add: portfolio3.
				
	self should: [ portfolio1 add: portfolio4 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:05:20'!
test12

	| portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 account |
	
	account := ReceptiveAccount new.
	
	portfolio1 := PortfolioCollection new.
	portfolio4 := PortfolioCollection new.
	portfolio5 := PortfolioCollection new.	

	portfolio2 := PortfolioAccount with: account.
	portfolio3 := PortfolioAccount with: account.
	
	portfolio4 add: portfolio5.
	portfolio5 add: portfolio2.
	portfolio1 add: portfolio3.
				
	self should: [ portfolio1 add: portfolio4 ] raise: Error withMessageText: Portfolio xxErrorDescription! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CM 11/9/2020 15:20:57'!
test13

	| portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 account |
	
	account := ReceptiveAccount new.
	
	portfolio1 := PortfolioCollection new.
	portfolio2 := PortfolioCollection new.
	portfolio3 := PortfolioCollection new.	

	portfolio4 := PortfolioAccount with: account.
	portfolio5 := PortfolioAccount with: account.
	
	portfolio1 add: portfolio2.
	portfolio1 add: portfolio4.
	portfolio2 add: portfolio3.
	
	self should: [ portfolio3 add: portfolio5 ] raise: Error withMessageText: Portfolio xxErrorDescription! !


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
	instanceVariableNames: 'parentPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'CM 11/9/2020 15:05:57'!
addParent: aPortfolio

	parentPortfolios add: aPortfolio .! !

!Portfolio methodsFor: 'private' stamp: 'CM 11/9/2020 15:13:13'!
hasCommonAccountsWith: aPortfolio

	self subclassResponsibility .


	! !

!Portfolio methodsFor: 'private' stamp: 'CM 11/9/2020 15:05:57'!
sameTreeAs: aPortfolio 
	
	^ (self hasCommonAccountsWith: aPortfolio) or: (parentPortfolios anySatisfy: [ :aParentPortfolio | aParentPortfolio sameTreeAs: aPortfolio ])! !

!Portfolio methodsFor: 'private' stamp: 'CM 11/9/2020 15:13:33'!
zaraza: anAccount 
	
	self subclassResponsibility .! !


!Portfolio methodsFor: 'testing' stamp: 'CM 11/9/2020 12:56:33'!
hasRegistered: aTransaction

	self subclassResponsibility .! !


!Portfolio methodsFor: 'balance' stamp: 'CM 11/9/2020 12:56:21'!
balance

	self subclassResponsibility .! !


!Portfolio methodsFor: 'adding' stamp: 'CM 11/9/2020 12:56:16'!
add: aPortfolio

	self subclassResponsibility .! !


!Portfolio methodsFor: 'transactions' stamp: 'CM 11/9/2020 12:56:42'!
transactions

	self subclassResponsibility .! !


!Portfolio methodsFor: 'initialization' stamp: 'CM 11/9/2020 15:05:57'!
initialize

	parentPortfolios := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'CM 11/9/2020 13:18:17'!
xxErrorDescription
	
	^ 'No se puede tener ciclos' ! !


!classDefinition: #PortfolioAccount category: 'Portfolio-Ejercicio'!
Portfolio subclass: #PortfolioAccount
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioAccount methodsFor: 'private' stamp: 'CM 11/9/2020 14:27:52'!
hasCommonAccountsWith: aPortfolio

	^ aPortfolio zaraza: account.


	
	! !

!PortfolioAccount methodsFor: 'private' stamp: 'CM 11/9/2020 13:50:38'!
includes: anAccount
	
	^ anAccount zaraza: account.! !

!PortfolioAccount methodsFor: 'private' stamp: 'CM 11/9/2020 13:50:57'!
zaraza: anAccount
	
	^ anAccount = account.! !


!PortfolioAccount methodsFor: 'testing' stamp: 'CM 11/9/2020 12:58:31'!
hasRegistered: aTransaction
	
	^ account hasRegistered: aTransaction .! !


!PortfolioAccount methodsFor: 'initialization' stamp: 'CM 11/9/2020 15:14:04'!
initializeWith: anAccount
	
	account := anAccount.! !


!PortfolioAccount methodsFor: 'adding' stamp: 'CM 11/9/2020 12:57:48'!
add: aPortfolio
	
	self error: 'No se puede agregar un porfolio a un portfolioAccount'! !


!PortfolioAccount methodsFor: 'transactions' stamp: 'CM 11/9/2020 12:58:12'!
transactions
	
	^ account transactions.! !


!PortfolioAccount methodsFor: 'balance' stamp: 'CM 11/9/2020 12:58:02'!
balance
	
	^ account balance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioAccount class' category: 'Portfolio-Ejercicio'!
PortfolioAccount class
	instanceVariableNames: ''!

!PortfolioAccount class methodsFor: 'instance creation' stamp: 'CM 11/9/2020 13:00:25'!
with: anAccount
	
	^ self new initializeWith: anAccount.! !


!classDefinition: #PortfolioCollection category: 'Portfolio-Ejercicio'!
Portfolio subclass: #PortfolioCollection
	instanceVariableNames: 'portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioCollection methodsFor: 'testing' stamp: 'CM 11/9/2020 15:05:45'!
hasRegistered: aTransaction 

	^ portfolios anySatisfy: [ :aPortfolio | aPortfolio hasRegistered: aTransaction ].! !


!PortfolioCollection methodsFor: 'transactions' stamp: 'CM 11/9/2020 15:05:45'!
transactions

	^ portfolios inject: OrderedCollection new into: [ :allTransactions :aPortfolio | allTransactions addAll: aPortfolio transactions ].! !


!PortfolioCollection methodsFor: 'private' stamp: 'CM 11/9/2020 15:05:45'!
hasCommonAccountsWith: aPortfolio

	^ (self includes: aPortfolio) or: (portfolios anySatisfy: [ :pe | aPortfolio hasCommonAccountsWith: pe])! !

!PortfolioCollection methodsFor: 'private' stamp: 'CM 11/9/2020 15:05:45'!
includes: aPortfolio
	
	^ (aPortfolio = self) or: (portfolios includes: aPortfolio) or: (portfolios anySatisfy: [ :aPortfolioEntry | 
		aPortfolioEntry includes: aPortfolio.
	]).! !

!PortfolioCollection methodsFor: 'private' stamp: 'CM 11/9/2020 15:05:45'!
zaraza: anAccount

	^ portfolios anySatisfy: [ :portfolio | portfolio zaraza: anAccount ]! !


!PortfolioCollection methodsFor: 'initialization' stamp: 'CM 11/9/2020 15:05:45'!
initialize

	super initialize.
	portfolios := OrderedCollection new.
	! !


!PortfolioCollection methodsFor: 'balance' stamp: 'CM 11/9/2020 15:05:45'!
balance

	^ portfolios sum: [ :aPortfolio | aPortfolio balance ] ifEmpty: [ 0 ].! !


!PortfolioCollection methodsFor: 'adding' stamp: 'CM 11/9/2020 15:25:33'!
add: aPortfolio 
	"
	(aPortfolio includes: self) ifTrue: [ self error: self class xxErrorDescription ].
	"
	(aPortfolio sameTreeAs: self) ifTrue: [ self error: self class xxErrorDescription ].
	(self sameTreeAs: aPortfolio) ifTrue: [ self error: self class xxErrorDescription ].
	
	(self hasCommonAccountsWith: aPortfolio) ifTrue: [ self error: self class xxErrorDescription ].
	
	portfolios add: aPortfolio .
	aPortfolio addParent: self.! !


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
