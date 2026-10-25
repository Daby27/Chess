Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| oneStep twoSteps startRank targets |
	self isWhite
		ifTrue: [
			oneStep := square up.
			startRank := $2 ]
		ifFalse: [
			oneStep := square down.
			startRank := $7 ].
	targets := OrderedCollection new.
	(oneStep notNil and: [ oneStep hasPiece not ]) ifFalse: [ ^ targets ].
	targets add: oneStep.
	square file = startRank ifTrue: [
		twoSteps := self isWhite
			            ifTrue: [ oneStep up ]
			            ifFalse: [ oneStep down ].
		(twoSteps notNil and: [ twoSteps hasPiece not ]) ifTrue: [
			targets add: twoSteps ] ].
	^ targets
]
