!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:52:18'!
* aPeanoNumber
	^aPeanoNumber
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:47:38'!
+ aPeanoNumber
	^aPeanoNumber next
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 20:35:30'!
/ aPeanoNumber
	self < (aPeanoNumber * II) 
		ifTrue: [ ^I ]
		ifFalse: [ ^(self - aPeanoNumber / aPeanoNumber) next ]	.
	
	
	
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 20:41:40'!
< aPeanoNumber
	^self name size < aPeanoNumber name size! !

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:36:02'!
next
	^self createChildNamed: self name , 'I'
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 20:44:01'!
restaAlRevez: aPeanoNumber
	^aPeanoNumber previous
	! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:57:52'!
* aPeanoNumber
	^aPeanoNumber + (self previous * aPeanoNumber)! !

!II class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:48:25'!
+ aPeanoNumber
	^(aPeanoNumber + self previous) next! !

!II class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 20:44:24'!
- aPeanoNumber
	^aPeanoNumber restaAlRevez: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 19:36:37'!
previous
	^self parent! !

!II class methodsFor: 'as yet unclassified' stamp: 'CM 9/16/2020 20:44:20'!
restaAlRevez: aPeanoNumber
	^self previous restaAlRevez: aPeanoNumber previous! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIII category: #'Numeros de Peano'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIII category: #'Numeros de Peano'!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIII subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIII subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIII subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIII subclass: #IIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIII subclass: #IIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!
