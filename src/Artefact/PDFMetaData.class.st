Class {
	#name : #PDFMetaData,
	#superclass : #Object,
	#instVars : [
		'title',
		'subject',
		'author',
		'keywords',
		'creator',
		'producer'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFMetaData >> author [
	^ author
]

{ #category : #accessing }
PDFMetaData >> author: anObject [
	author := anObject
]

{ #category : #accessing }
PDFMetaData >> creator [
	^ creator
]

{ #category : #accessing }
PDFMetaData >> creator: anObject [
	creator := anObject
]

{ #category : #accessing }
PDFMetaData >> currentDateAndTimeInPDFFormat [
	"Answer a correct date and time for a PDF document : yyyymmddhhmmss"
	
	| str time hour minutes seconds |
	
	
	hour := Time now hours.
	str := hour asString.
	(hour < 12) ifTrue: [ str := '0' , str ].
	time := str.
	
 	minutes := Time now minutes.
	str := minutes asString.
	(minutes < 10) ifTrue: [ str := '0' , str ].
	time := time , str.
	
	seconds := Time now seconds.
	str := seconds asString.
	(seconds < 10) ifTrue: [ str := '0' , str ].
	time := time , str.
	
	^((Date today yyyymmdd copyWithRegex: '-' matchesReplacedWith: '') , time)
]

{ #category : #accessing }
PDFMetaData >> initialize [
	self author: ''.
	self creator: ''.
	self keywords: ''.
	self producer: 'Artefact'.
	self subject: ''.
	self title: ''
]

{ #category : #accessing }
PDFMetaData >> keywords [
	^ keywords
]

{ #category : #accessing }
PDFMetaData >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
PDFMetaData >> producer [
	^ producer
]

{ #category : #accessing }
PDFMetaData >> producer: anObject [
	producer := anObject
]

{ #category : #accessing }
PDFMetaData >> subject [
	^ subject
]

{ #category : #accessing }
PDFMetaData >> subject: anObject [
	subject := anObject
]

{ #category : #accessing }
PDFMetaData >> title [
	^ title
]

{ #category : #accessing }
PDFMetaData >> title: anObject [
	title := anObject
]