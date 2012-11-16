Class {
	#name : #PDFCellElement,
	#superclass : #PDFFormatedTextElement,
	#instVars : [
		'linefeed',
		'rectElement'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #accessing }
PDFCellElement >> alignment [
	^ alignment ifNil: [ alignment := #CENTER ]
]

{ #category : #style }
PDFCellElement >> defaultMargin [
	^self page document pointsToUserUnit: 1
]

{ #category : #action }
PDFCellElement >> determineDecyForTextStyleWith: aFont [

	"Set right xy values for text"
	| height decy |

	height := (aFont scaledFontSize: (self page document scaleFactor)).
	
	"determining the vertical offset"
	(self verticalAlignment = #BOTTOM)
		ifTrue: [ decy := (self wh y - self margin) ]
		ifFalse: [ 
				(self verticalAlignment = #MIDDLE) ifTrue: [ decy := (self wh y  * 0.5) + (height * 0.3) ] ifFalse: [ decy := height + self margin ]
			].

	^decy 
]

{ #category : #accessing }
PDFCellElement >> dotted: anObject [
	self styleSheet dotted: anObject 
]

{ #category : #accessing }
PDFCellElement >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFCellElement >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #accessing }
PDFCellElement >> fillColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #fillColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #render }
PDFCellElement >> getStyles [
	
	"get the current position in the page if xy is not defined"
	| decx decy font |

	(self xy isNil) ifTrue: [ self xy: self page xy ] ifFalse: [ self page xy: self xy ].
	
	"set the position of the text element"
	font := self fontIfAbsent: (self page styleSheet).

	decx := self determineDecxForTextStyle: (self text) margin: (self margin) with: font.
	decy := self determineDecyForTextStyleWith: font. 
	
	"set the new current position and linefeed ?"
 	self page lasth: self wh y.	
	(self linefeed) 
		ifTrue: [ self page xy: (self page margins x) @ (self page xy y + self wh y) ] 
		ifFalse: [ self page xy: (self page xy x + self wh x) @ (self page xy y) ].
	
	"answer the style description"	

	^ OrderedCollection new 
		add: (rectElement styleSheet: (self styleSheet); xy: self xy; wh: self wh); 
		add: (PDFTextElement new styleSheet: (self styleSheet); text: (self text); xy: (decx + self xy x)@(self xy y + decy));  
		yourself.
]

{ #category : #'initialize-release' }
PDFCellElement >> initialize [
	super initialize.
	rectElement := PDFFilledRectElement new.
]

{ #category : #accessing }
PDFCellElement >> linefeed [
	^ linefeed ifNil: [ linefeed := false ]
]

{ #category : #accessing }
PDFCellElement >> linefeed: anObject [
	linefeed := anObject
]

{ #category : #accessing }
PDFCellElement >> thickness: aThickness [
	self styleSheet thickness: aThickness 
 
]

{ #category : #accessing }
PDFCellElement >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #MIDDLE ]
]

{ #category : #accessing }
PDFCellElement >> wh [
	"answer the with of the string if wh isn't defined"
	| font width height |
	
	^wh ifNil: [
		font := self fontIfAbsent: (self page styleSheet).
		width := (font getStringWidth: (self text) into: (self page document)) + (self margin * 2).
		height := (font scaledFontSize: (self page) document scaleFactor) roundDownTo: 0.001.
		wh :=  width@height
	]

]