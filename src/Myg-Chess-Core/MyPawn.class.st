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

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [

	super moveTo: aSquare.
	(square == aSquare and: [
		 aSquare file = (self isWhite ifTrue: [ $8 ] ifFalse: [ $1 ]) ])
		ifTrue: [ self promoteOn: aSquare ]
]

{ #category : 'as yet unclassified' }
MyPawn >> promoteOn: aSquare [

	| queen |
	queen := self isWhite
		         ifTrue: [ MyQueen white ]
		         ifFalse: [ MyQueen black ].
	queen square: aSquare.
	aSquare contents: queen
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| oneStep twoSteps startRank diagonals targets |
	"Les blancs montent, les noirs descendent. On garde la case devant,
	la rangée de départ et les deux cases en diagonale devant le pion."
	self isWhite
		ifTrue: [
			oneStep := square up.
			startRank := $2 ]
		ifFalse: [
			oneStep := square down.
			startRank := $7 ].
	diagonals := {
		             (oneStep ifNotNil: #left).
		             (oneStep ifNotNil: #right) }.

	targets := OrderedCollection new.

	"Avancer : seulement si la case devant existe et est vide."
	(oneStep notNil and: [ oneStep hasPiece not ]) ifTrue: [
		targets add: oneStep.
		"Deux cases : seulement depuis la rangée de départ, si la case suivante est vide."
		square file = startRank ifTrue: [
			twoSteps := self isWhite
				            ifTrue: [ oneStep up ]
				            ifFalse: [ oneStep down ].
			(twoSteps notNil and: [ twoSteps hasPiece not ]) ifTrue: [
				targets add: twoSteps ] ] ].

	"Capturer : seulement en diagonale, sur une pièce de l'adversaire."
	diagonals do: [ :diagonal |
		(diagonal notNil and: [
			 diagonal hasPiece and: [ diagonal contents color ~= color ] ])
			ifTrue: [ targets add: diagonal ] ].

	^ targets
]
