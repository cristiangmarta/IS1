!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:03'!
dividiteALaFraccion: unaFraccionADividir

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:06'!
dividiteAlEntero: unEnteroADividir

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:10'!
multiplicateALaFraccion: unaFraccionAMultiplicar

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:13'!
multiplicateAlEntero: unEnteroAMultiplicar

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:16:43'!
substraeteDeLaFraccion: unaFraccionDeLaCualSubstraer

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:17:30'!
substraeteDelEntero: unEnteroDelCualSubstraer

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:17'!
sumateALaFraccion: unaFraccionASumar

	self subclassResponsibility ! !

!Numero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:31:19'!
sumateAlEntero: unEnteroASumar

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 17:28:15'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 04:33:41'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:27:22'!
dividiteALaFraccion: unaFraccionADividir

	^ unaFraccionADividir numerator  / (unaFraccionADividir denominator * self).! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:27:52'!
dividiteAlEntero: unEnteroADividir

	^ Fraccion with: unEnteroADividir over: self.! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:28:01'!
multiplicateALaFraccion: unaFraccionAMultiplicar

	^ (unaFraccionAMultiplicar numerator * self ) / unaFraccionAMultiplicar denominator! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:28:12'!
multiplicateAlEntero: unEnteroAMultiplicar

	^ self class with: unEnteroAMultiplicar integerValue * value.! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:30:27'!
substraeteDeLaFraccion: unaFraccionDeLaCualSubstraer

	^ (unaFraccionDeLaCualSubstraer numerator - (self * unaFraccionDeLaCualSubstraer denominator)) / unaFraccionDeLaCualSubstraer denominator! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:30:35'!
substraeteDelEntero: unEnteroDelCualSubstraer

	^ self class with: unEnteroDelCualSubstraer integerValue - value ! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:30:46'!
sumateALaFraccion: unaFraccionASumar

	^ ((self * unaFraccionASumar denominator) + unaFraccionASumar numerator) / unaFraccionASumar denominator! !

!Entero methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:30:53'!
sumateAlEntero: unEnteroASumar

	^ self class with: value + unEnteroASumar integerValue! !


!Entero methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:25:38'!
* aMultiplier 
	
	^ aMultiplier multiplicateAlEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:26:08'!
+ anAdder 
	^anAdder sumateAlEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:05:57'!
- aSubtrahend 

	^ aSubtrahend substraeteDelEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:25:10'!
/ aDivisor 

	^ aDivisor dividiteAlEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'a 10/1/2020 06:52:09'!
fibonacci

^ self subclassResponsibility


		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'a 10/1/2020 06:08:37'!
initializeWith: aValue 
	
	value := aValue.! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'private -  fraction Initialization Aux' stamp: 'as 10/1/2020 08:45:06'!
AsDenominatorWithNumerator: Numerator
self subclassResponsibility.
	! !

!Entero methodsFor: 'private -  fraction Initialization Aux' stamp: 'as 10/1/2020 08:45:35'!
AsNumeratorWithDenominator: Denominator
	self subclassResponsibility .! !

!Entero methodsFor: 'private -  fraction Initialization Aux' stamp: 'as 10/1/2020 08:40:58'!
asNotZeroNumeratorWithDenominator: Denominator
| greatestCommonDivisor numerator denominator |
	greatestCommonDivisor := self greatestCommonDivisorWith: Denominator. 
	numerator := self // greatestCommonDivisor .
	denominator := Denominator // greatestCommonDivisor.
	
	

	
	^(denominator asDenominatorSkippingFractionCheckWithNumerator: numerator)
	
	
	! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:53:35'!
errorSiEsCero
	self subclassResponsibility ! !

!Entero methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:57:03'!
errorSiEsUno
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'a 10/1/2020 04:51:55'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
		aValue == 0 ifTrue: [ ^ Cero new initializeWith: aValue ].
	aValue == 1 ifTrue: [ ^ Uno new initializeWith: aValue ].
	aValue < 0 ifTrue: [ ^ Negativo new initializeWith: aValue ].
	aValue > 1 ifTrue: [ ^ MayorQueUno new initializeWith: aValue ].

! !


!Entero class methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:54:40'!
errorSiEsUno
	self subclassResponsibility ! !


!classDefinition: #Cero category: #'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 06:10:27'!
AsDenominatorWithNumerator: Numerator
^ self error: Fraccion canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 06:10:55'!
AsNumeratorWithDenominator: Denominator
	^self.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'a 10/1/2020 07:01:37'!
fibonacci	
	
	^Entero with: 1.
! !


!Cero methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 09:02:14'!
errorSiEsCero 
Fraccion error: 'una fraccion no puede ser cero'! !

!Cero methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:58:06'!
errorSiEsUno! !


!classDefinition: #MayorQueUno category: #'Numero-Exercise'!
Entero subclass: #MayorQueUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'a 10/1/2020 07:05:27'!
fibonacci
|uno dos|
	uno:=Entero with: 1.
	dos:=Entero with: 2.
	
	^ (self - uno) fibonacci + (self - dos) fibonacci! !


!MayorQueUno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 06:12:31'!
AsDenominatorWithNumerator: Numerator
^ Numerator AsNumeratorWithDenominator: self.! !

!MayorQueUno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 08:07:27'!
AsNumeratorWithDenominator: Denominator

^self asNotZeroNumeratorWithDenominator: Denominator.
! !

!MayorQueUno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 08:00:52'!
asDenominatorSkippingFractionCheckWithNumerator: Numerator

^Fraccion new initializeWith: Numerator over: self! !


!MayorQueUno methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:58:43'!
errorSiEsCero! !

!MayorQueUno methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:58:47'!
errorSiEsUno! !


!classDefinition: #Negativo category: #'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 06:28:00'!
AsDenominatorWithNumerator: Numerator
^ Numerator negated AsNumeratorWithDenominator: self negated.! !

!Negativo methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 08:07:34'!
AsNumeratorWithDenominator: Denominator

^self asNotZeroNumeratorWithDenominator: Denominator.! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'a 10/1/2020 07:01:08'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription	
	! !


!Negativo methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:58:58'!
errorSiEsCero! !

!Negativo methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:59:02'!
errorSiEsUno! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 06:29:58'!
AsDenominatorWithNumerator: Numerator
^ Numerator.! !

!Uno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 08:07:40'!
AsNumeratorWithDenominator: Denominator

^self asNotZeroNumeratorWithDenominator: Denominator.! !

!Uno methodsFor: 'FractionCreation' stamp: 'a 10/1/2020 08:30:58'!
asDenominatorSkippingFractionCheckWithNumerator: Numerator

^Numerator! !


!Uno methodsFor: 'arithmetic operations' stamp: 'a 10/1/2020 07:00:58'!
fibonacci
Entero with: 1.
! !


!Uno methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 08:59:17'!
errorSiEsCero! !

!Uno methodsFor: 'private - errorhandlinghelper' stamp: 'as 10/1/2020 09:02:03'!
errorSiEsUno

Fraccion error: 'una fraccion no puede tener denominador 1 porque sino es un entero'! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:32:07'!
* aMultiplier 
	
	^ aMultiplier multiplicateALaFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:32:25'!
+ anAdder 
	^anAdder sumateALaFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:09:26'!
- aSubtrahend
	
	^ aSubtrahend substraeteDeLaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CM 9/30/2020 17:31:45'!
/ aDivisor 
	
	^ aDivisor dividiteALaFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'as 10/1/2020 09:03:50'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator errorSiEsCero .
	aDenominator errorSiEsUno .
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:32:56'!
dividiteALaFraccion: unaFraccionADividir

	^ (unaFraccionADividir numerator * denominator) / (unaFraccionADividir denominator * numerator)! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:33:10'!
dividiteAlEntero: unEnteroADividir

	^ (unEnteroADividir * self denominator)  / self numerator ! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:33:30'!
multiplicateALaFraccion: unEnteroAMultiplicar

	^ (numerator * unEnteroAMultiplicar numerator) / (denominator * unEnteroAMultiplicar denominator)! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:34:34'!
multiplicateAlEntero: unaFraccionAMultiplicar

	^ (unaFraccionAMultiplicar * self numerator) / self denominator! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:33:50'!
substraeteDeLaFraccion: unaFraccionDeLaCualSubstraer

	| newDenominator newNumerator |
	
	newNumerator := (denominator * unaFraccionDeLaCualSubstraer numerator) - (numerator * unaFraccionDeLaCualSubstraer denominator).
	newDenominator := denominator * unaFraccionDeLaCualSubstraer denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:33:55'!
substraeteDelEntero: unEnteroDelCualSubstraer

	^ ((unEnteroDelCualSubstraer * self denominator) - self numerator ) / self denominator ! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:34:03'!
sumateALaFraccion: unaFraccionASumar

	|newNumerator newDenominator|
	
	newNumerator := (numerator * unaFraccionASumar denominator) + (denominator * unaFraccionASumar numerator).
	newDenominator := denominator * unaFraccionASumar denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'private - inverse arithmetic operations' stamp: 'CM 9/30/2020 17:34:09'!
sumateAlEntero: unEnteroASumar

	^ ((unEnteroASumar * self denominator) + self numerator) / self denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'a 10/1/2020 06:33:39'!
with: aDividend over: aDivisor

	^aDivisor AsDenominatorWithNumerator: aDividend
	! !
