"
PDF-1.3
"
Class {
	#name : #PDFDataComment,
	#superclass : #PDFDataType,
	#instVars : [
		'comment'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataComment class >> text: aTextComment [
	^ self new comment: aTextComment
]

{ #category : #accessing }
PDFDataComment >> comment [
	^ comment
]

{ #category : #accessing }
PDFDataComment >> comment: anObject [
	comment := anObject
]

{ #category : #printing }
PDFDataComment >> printOn: aStream [
	aStream nextPut: $%; nextPutAll: comment asString
]