Class {
	#name : #PDFDataSymbol,
	#superclass : #PDFDataType,
	#instVars : [
		'symbol'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataSymbol class >> symbol: aSymbol [
	^ self new symbol: aSymbol; yourself
]

{ #category : #'as yet unclassified' }
PDFDataSymbol >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataSymbol: self
]

{ #category : #'as yet unclassified' }
PDFDataSymbol >> isPrintable [
	^ true
]

{ #category : #accessing }
PDFDataSymbol >> printOn: aStream [
	aStream nextPut: $/; nextPutAll: symbol asString
]

{ #category : #accessing }
PDFDataSymbol >> symbol [
	^ symbol
]

{ #category : #accessing }
PDFDataSymbol >> symbol: anObject [
	symbol := anObject
]