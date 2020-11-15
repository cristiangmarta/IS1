!classDefinition: #AccountReportTest category: 'Portfolio-Solucion'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReportTest methodsFor: 'portfolio tree report' stamp: 'CM 11/15/2020 18:28:31'!
test012

	| report angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount expected |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with:myAccount with: childrenPortfolio.

	report := OrderedCollection with: 'Portfolio de la familia' 
							with: '    Cuenta mia' 
							with: '    Portfolio de hijos' 
							with: '        Cuenta de Juan' 
							with: '        Cuenta de Angeles'.
	expected := (AccountTreeReport for: familyPortfolio) printReport.
	self assert: report equals: expected .
! !

!AccountReportTest methodsFor: 'portfolio tree report' stamp: 'CM 11/15/2020 18:45:22'!
test013

	| report angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount expected |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	
	Deposit register: 100 on: myAccount .
	Withdraw register: 20 on: johnsAccount .
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with:myAccount with: childrenPortfolio.

	report := OrderedCollection with: 'Portfolio de la familia' 
							with: '    Cuenta mia' 
							with: '        Deposito de 100'
							with: '        Balance  100'.
	report							
							add: '    Portfolio de hijos' ;
							add: '        Cuenta de Juan' ;
							add: '            Extraccion de 20' ;
							add: '            Balance = -20' ;
							add: '        Cuenta de Angeles';
							add: '        Balance = -20';
							add: '    Balance = 80'.
							
	expected := (AccountTreeSummaryReport for: familyPortfolio) printReport.
	self assert: report equals: expected .
! !


!AccountReportTest methodsFor: 'net transfer report' stamp: 'CM 11/15/2020 15:19:02'!
test07

	| account netTransfer |
	
	account := ReceptiveAccount new.
	netTransfer := 0.

	self assert: netTransfer equals: (AccountNetTransferReport for: account) printReport .
! !

!AccountReportTest methodsFor: 'net transfer report' stamp: 'CM 11/15/2020 15:21:27'!
test08

	| account netTransfer |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	netTransfer := 0.
	
	self assert: netTransfer equals: (AccountNetTransferReport for: account) printReport .! !

!AccountReportTest methodsFor: 'net transfer report' stamp: 'CM 11/15/2020 15:22:19'!
test09

	| account1 account2 netTransfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 50 from: account1 to: account2.
	
	netTransfer := 50.
	
	self assert: netTransfer equals: (AccountNetTransferReport for: account2) printReport .! !

!AccountReportTest methodsFor: 'net transfer report' stamp: 'CM 11/15/2020 15:22:48'!
test10

	| account1 account2 netTransfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 50 from: account1 to: account2.
	
	netTransfer := -50.
	
	self assert: netTransfer equals: (AccountNetTransferReport for: account1) printReport .! !

!AccountReportTest methodsFor: 'net transfer report' stamp: 'CM 11/15/2020 15:23:44'!
test11

	| account netTransfer |
	
	account := ReceptiveAccount new.
	
	Withdraw register: 50 on: account.
	
	netTransfer := 0.
	
	self assert: netTransfer equals: (AccountNetTransferReport for: account) printReport .! !


!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:11'!
test01 

	| account summary |
	
	account := ReceptiveAccount new.
	summary := OrderedCollection with: 'Balance = 0'.

	self assert: summary equals: (AccountSummaryReport for: account) printReport .
! !

!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:15'!
test02 

	| account summary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	summary := OrderedCollection with: 'Deposito de 100' with: 'Balance = 100'.

	self assert: summary equals: (AccountSummaryReport for: account) printReport .
! !

!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:18'!
test03

	| account summary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 on: account.
	
	summary := OrderedCollection with: 'Extraccion de 100' with: 'Balance = -100'.

	self assert: summary equals: (AccountSummaryReport for: account) printReport .
! !

!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:20'!
test04

	| account1 account2 summary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 50 from: account1 to: account2.
	
	summary := OrderedCollection with: 'Transferencia entrante de 50' with: 'Balance = 50'.

	self assert: summary equals: (AccountSummaryReport for: account2) printReport .
! !

!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:23'!
test05

	| account1 account2 summary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 50 from: account1 to: account2.
	
	summary := OrderedCollection with: 'Transferencia saliente de 50' with: 'Balance = -50'.

	self assert: summary equals: (AccountSummaryReport for: account1) printReport .
! !

!AccountReportTest methodsFor: 'summary report' stamp: 'CM 11/15/2020 14:55:26'!
test06

	| portfolio account summary |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	Deposit register: 50 on: account.
	
	summary := OrderedCollection with: 'Deposito de 50' with: 'Balance = 50'.

	self assert: summary equals: (AccountSummaryReport for: portfolio) printReport .
! !


!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/9/2020 06:00:12'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/9/2020 06:02:30'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account.
		
	self assert: 1 equals: account transactions size .
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 13:25:11'!
test01TransferExtractsFromSenderAndAddsToReceiver

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 100 from: account1 to: account2.
		
	self assert: -100 equals: account1 balance .	
	self assert: 100 equals: account2 balance .
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 13:38:15'!
test02CanNavigateFromTransferToAccountTransactions

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert: (account1 transactions includes: transfer senderTransaction) .
	self assert: (account2 transactions includes: transfer receiverTransaction) .
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 13:48:27'!
test03CanNavigateFromAccountTransactionsToTransfer

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert: transfer equals: account1 transactions first associatedTransfer .
	self assert: transfer equals: account2 transactions first associatedTransfer .
	
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:19:39'!
test04IsNotPossibleToTransferFromAndToTheSameAccount

	| account1 |
	
	account1 := ReceptiveAccount new.
	
	self should: [
			Transfer register: 100 from: account1 to: account1
		] 
		raise: Error 
		withMessageText: Transfer noSelfTransfersAllowedErrorDescription .
		! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:20:14'!
test05IsNotPossibleToTransferNegativeValues

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should: [
			Transfer register: -100 from: account1 to: account2
		] raise: Error withMessageText: Transfer onlyPositiveTransfersErrorDescription .
		! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:20:42'!
test06IsNotPosibleDoATransferWithAValueOfZero

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should: [
			Transfer register: 0 from: account1 to: account2
		] raise: Error withMessageText: Transfer onlyPositiveTransfersErrorDescription .
		! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !



!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'CM 11/15/2020 16:00:23'!
initializeNamed: aName
	
	name := aName.
	! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'reportes' stamp: 'CM 11/15/2020 18:00:11'!
generateReportFor: anAccountSummaryReport 
	
	accounts do: [ :account |
			anAccountSummaryReport generateReportFor: account.
		].
	
	! !

!Portfolio methodsFor: 'reportes' stamp: 'CM 11/15/2020 17:45:03'!
name
	^ name.! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NR 11/9/2020 06:01:26'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio!!'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 16:00:32'!
named: aName with: anAccount

	^(self new initializeNamed: aName)
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 16:00:36'!
named: aName with: anAccount with: anotherAccount

	^(self new initializeNamed: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'CM 11/15/2020 17:46:44'!
initializeNamed: aName

	name := aName.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'NR 11/9/2020 05:56:36'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reportes' stamp: 'CM 11/15/2020 18:00:05'!
generateReportFor: anAccountReport 

	transactions do: [ :transaction |
			transaction addToReport: anAccountReport
		].
	
	! !

!ReceptiveAccount methodsFor: 'reportes' stamp: 'CM 11/15/2020 17:44:43'!
name
	^ name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:46:15'!
named: aName
	
	^ self new initializeNamed: aName.! !


!classDefinition: #AccountReport category: 'Portfolio-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!


!classDefinition: #AccountNetTransferReport category: 'Portfolio-Solucion'!
AccountReport subclass: #AccountNetTransferReport
	instanceVariableNames: 'receptiveAccount reporteAcumulado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountNetTransferReport methodsFor: 'initialization' stamp: 'CM 11/15/2020 15:15:23'!
initializeFor: aReceptiveAccount 
	
	receptiveAccount := aReceptiveAccount.! !


!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:30:04'!
generateReportFor: anAccount
	
	anAccount generateReportFor: self.! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:43:40'!
printForAccount: anAccount! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:50:26'!
printForDeposit: aDeposit 
	! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:50:46'!
printForIncomingTransfer: aDeposit 
	
	reporteAcumulado := reporteAcumulado + aDeposit value.! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:50:56'!
printForOutgoingTransfer: aDeposit 
	
	reporteAcumulado := reporteAcumulado - aDeposit value.! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:51:00'!
printForWithdraw: aDeposit 
	! !

!AccountNetTransferReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:50:15'!
printReport
	
	reporteAcumulado := 0.
	receptiveAccount generateReportFor: self.
	
	^ reporteAcumulado.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountNetTransferReport class' category: 'Portfolio-Solucion'!
AccountNetTransferReport class
	instanceVariableNames: ''!

!AccountNetTransferReport class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 15:15:23'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountSummaryReport category: 'Portfolio-Solucion'!
AccountReport subclass: #AccountSummaryReport
	instanceVariableNames: 'account reporteAcumulado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReport methodsFor: 'initialization' stamp: 'CM 11/15/2020 15:49:24'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount.! !


!AccountSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:30:12'!
generateReportFor: anAccount
	
	anAccount generateReportFor: self.! !

!AccountSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:43:33'!
printForAccount: anAccount
	
	! !

!AccountSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:49:24'!
printReport

	reporteAcumulado := OrderedCollection new.
	
	account generateReportFor: self.
	
	reporteAcumulado add: 'Balance = ' , account balance asString.
	
	^ reporteAcumulado.! !


!AccountSummaryReport methodsFor: 'private - transactions' stamp: 'CM 11/15/2020 15:47:16'!
printForDeposit: aDeposit 
	
	reporteAcumulado add: 'Deposito de ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'private - transactions' stamp: 'CM 11/15/2020 15:44:00'!
printForIncomingTransfer: aDeposit 
	
	reporteAcumulado add: 'Transferencia entrante de ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'private - transactions' stamp: 'CM 11/15/2020 15:44:11'!
printForOutgoingTransfer: aDeposit 
	
	reporteAcumulado add: 'Transferencia saliente de ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'private - transactions' stamp: 'CM 11/15/2020 15:44:16'!
printForWithdraw: aDeposit 
	
	reporteAcumulado add: 'Extraccion de ', aDeposit value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryReport class' category: 'Portfolio-Solucion'!
AccountSummaryReport class
	instanceVariableNames: ''!

!AccountSummaryReport class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 14:54:28'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTreeReport category: 'Portfolio-Solucion'!
AccountReport subclass: #AccountTreeReport
	instanceVariableNames: 'account reporteAcumulado sangria'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTreeReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:22:23'!
generateReportFor: anAccount
	
	reporteAcumulado addAll: ((self class for: anAccount) printReport collect: [ :rep | '    ' , rep ]).
	
	! !

!AccountTreeReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 16:30:47'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount.! !

!AccountTreeReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:16:35'!
printReport

	
	reporteAcumulado := OrderedCollection new.
	
	reporteAcumulado add: account name.
	account generateReportFor: self.
	
	^ reporteAcumulado.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTreeReport class' category: 'Portfolio-Solucion'!
AccountTreeReport class
	instanceVariableNames: ''!

!AccountTreeReport class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 17:47:16'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTreeSummaryReport category: 'Portfolio-Solucion'!
AccountReport subclass: #AccountTreeSummaryReport
	instanceVariableNames: 'account reporteAcumulado sangria'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:28:55'!
generateReportFor: anAccount
	
	reporteAcumulado addAll: ((self class for: anAccount) printReport collect: [ :rep | '    ' , rep ]).
	
	! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:28:55'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount.! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:46:33'!
printForDeposit: aDeposit 
	
	reporteAcumulado add: '    Deposito de ', aDeposit value asString.! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:46:25'!
printForIncomingTransfer: aDeposit 
	
	reporteAcumulado add: '    Transferencia entrante de ', aDeposit value asString.! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:46:28'!
printForOutgoingTransfer: aDeposit 
	
	reporteAcumulado add: '    Transferencia saliente de ', aDeposit value asString.! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:46:31'!
printForWithdraw: aDeposit 
	
	reporteAcumulado add: '    Extraccion de ', aDeposit value asString.! !

!AccountTreeSummaryReport methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:39:51'!
printReport

	
	reporteAcumulado := OrderedCollection new.
	
	reporteAcumulado add: account name.
	account generateReportFor: self.
	reporteAcumulado add: 'Balance = ' , account balance asString.
	
	^ reporteAcumulado.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTreeSummaryReport class' category: 'Portfolio-Solucion'!
AccountTreeSummaryReport class
	instanceVariableNames: ''!

!AccountTreeSummaryReport class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 18:28:55'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #AccountCashTransactions category: 'Portfolio-Solucion'!
AccountTransaction subclass: #AccountCashTransactions
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountCashTransactions methodsFor: 'initialization' stamp: 'CM 11/15/2020 13:58:11'!
initializeFor: aValue

	value := aValue ! !


!AccountCashTransactions methodsFor: 'value' stamp: 'CM 11/15/2020 13:58:27'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountCashTransactions class' category: 'Portfolio-Solucion'!
AccountCashTransactions class
	instanceVariableNames: ''!

!AccountCashTransactions class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 13:59:03'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountCashTransactions class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 14:03:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountCashTransactions subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reportes' stamp: 'CM 11/15/2020 15:43:22'!
addToReport: anAccountSummaryReport 

	anAccountSummaryReport printForDeposit: self.! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountCashTransactions subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'balance' stamp: 'CM 11/15/2020 15:45:55'!
addToReport: anAccountSummaryReport 

	anAccountSummaryReport printForWithdraw: self.! !

!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!classDefinition: #AccountTransferTransaction category: 'Portfolio-Solucion'!
AccountTransaction subclass: #AccountTransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransferTransaction methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 13:53:22'!
associatedTransfer

	^ transfer .! !

!AccountTransferTransaction methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:00:50'!
initializeFor: aTransfer

	transfer := aTransfer .! !

!AccountTransferTransaction methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:00:27'!
value

	^ transfer value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferTransaction class' category: 'Portfolio-Solucion'!
AccountTransferTransaction class
	instanceVariableNames: ''!

!AccountTransferTransaction class methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:01:29'!
for: aTransfer

	^ self new initializeFor: aTransfer! !


!AccountTransferTransaction class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 14:03:37'!
on: account associatedTo: aTransfer

	| transaction |
	
	transaction := self for: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #IncomingTransfer category: 'Portfolio-Solucion'!
AccountTransferTransaction subclass: #IncomingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:46:07'!
addToReport: anAccountSummaryReport 

	anAccountSummaryReport printForIncomingTransfer: self.! !

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:04:22'!
affectBalance: aBalance

	^aBalance + self value ! !


!classDefinition: #OutgoingTransfer category: 'Portfolio-Solucion'!
AccountTransferTransaction subclass: #OutgoingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 15:46:17'!
addToReport: anAccountSummaryReport 

	anAccountSummaryReport printForOutgoingTransfer: self.! !

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'CM 11/15/2020 14:04:27'!
affectBalance: aBalance

	^aBalance - self value ! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'incomingTransfer outgoingTransfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'initialization' stamp: 'CM 11/15/2020 14:06:05'!
initializeFor: aValue from: aSenderAccount to: aReceiverAccount 

	value := aValue.
	incomingTransfer := IncomingTransfer on: aReceiverAccount associatedTo: self.
	outgoingTransfer := OutgoingTransfer on: aSenderAccount associatedTo: self.! !

!Transfer methodsFor: 'initialization' stamp: 'CM 11/15/2020 13:36:35'!
receiverTransaction

	^ incomingTransfer.! !

!Transfer methodsFor: 'initialization' stamp: 'CM 11/15/2020 13:36:41'!
senderTransaction

	^ outgoingTransfer .! !

!Transfer methodsFor: 'initialization' stamp: 'CM 11/15/2020 14:05:51'!
value

	^ value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'CM 11/15/2020 14:17:41'!
register: aValue from: aSenderAccount to: aReceiverAccount 
	
	aSenderAccount = aReceiverAccount ifTrue: [ ^ self error: self noSelfTransfersAllowedErrorDescription ] .
	aValue <= 0 ifTrue: [ ^ self error: self onlyPositiveTransfersErrorDescription ].
	
	^ self new initializeFor: aValue from: aSenderAccount to: aReceiverAccount
	! !


!Transfer class methodsFor: 'Error Messages' stamp: 'CM 11/15/2020 14:17:15'!
noSelfTransfersAllowedErrorDescription

	^ 'Sender''s account must be different from receiver''s account'.! !

!Transfer class methodsFor: 'Error Messages' stamp: 'CM 11/15/2020 14:18:40'!
onlyPositiveTransfersErrorDescription

	^ 'The value to transfer must be positive'.! !
