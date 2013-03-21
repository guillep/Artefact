Class {
	#name : #PDFHorizontalLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'testLayout'
	],
	#category : #'Artefact-Elements-Layouts-Test'
}

{ #category : #'as yet unclassified' }
PDFHorizontalLayoutTest >> setUp [ 
	testLayout := PDFHorizontalLayout new
]

{ #category : #'as yet unclassified' }
PDFHorizontalLayoutTest >> testPosition [
	| rect line |
	rect := PDFRectElement from: 10 mm @ 10 mm wh: 10 cm @ 3 cm.
	line := PDFLineElement from: 50 mm @ 15 mm wh: 24 mm @ 56 mm.
	testLayout
		from: 34 mm @ 78 mm;
		add: rect;
		add: line.
	testLayout defineElementPosition: rect with: nil styleSheet: nil.
	testLayout defineElementPosition: line with: nil styleSheet: nil.
	self assert: rect from equals: 34 mm @ 78 mm.
	self assert: line from equals: (34 mm + 10 cm + testLayout spacing) @ 78 mm
]