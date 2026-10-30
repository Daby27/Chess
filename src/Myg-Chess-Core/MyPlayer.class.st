Class {
	#name : 'MyPlayer',
	#superclass : 'Object',
	#instVars : [
		'color',
		'game'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPlayer >> black [

	self color: Color black
]

{ #category : 'as yet unclassified' }
MyPlayer >> captureMoveIn: aCollectionOfPieces [

	aCollectionOfPieces do: [ :piece |
		| captures |
		captures := piece legalTargetSquares select: [ :square |
			            square hasPiece and: [
				            square contents color ~= piece color and: [
					            square contents isKing not ] ] ].
		captures ifNotEmpty: [ ^ piece -> captures atRandom ] ].
	^ nil
]

{ #category : 'accessing' }
MyPlayer >> color [

	^ color
]

{ #category : 'accessing' }
MyPlayer >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyPlayer >> game [

	^ game
]

{ #category : 'accessing' }
MyPlayer >> game: anObject [

	game := anObject
]

{ #category : 'testing' }
MyPlayer >> isWhite [
	
	^ color = Color white
]

{ #category : 'accessing' }
MyPlayer >> king [
	
	^ self pieces detect: [ :p | p isKing ]
]

{ #category : 'accessing' }
MyPlayer >> pieces [

	^ game pieces select: [ :p | p notNil and: [ p color = self color ] ]
]

{ #category : 'playing' }
MyPlayer >> play [

	| pieces capture |
	pieces := self king isInCheck
		          ifTrue: [ OrderedCollection with: self king ]
		          ifFalse: [ self pieces copy asOrderedCollection ].

	"Nouveau : si une prise est possible, on la joue"
	capture := self captureMoveIn: pieces.
	capture ifNotNil: [
		game move: capture key to: capture value.
		^ self ].

	[ pieces notEmpty ] whileTrue: [
		| piece legalMoves |
		piece := pieces atRandom.
		pieces remove: piece.
		legalMoves := piece legalTargetSquares.
		legalMoves ifNotEmpty: [
			game move: piece to: legalMoves atRandom.
			^ self ] ].

	self halt: 'NO MOVES AVAILABLE!'
]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
