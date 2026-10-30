Class {
	#name : 'MyPlayerTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPlayerTests >> testCaptureMoveDoesNotEatTheKing [

	| board rook player |
	board := MyChessBoard empty.
	board at: 'e4' put: (rook := MyRook white).
	board at: 'e7' put: MyKing black.
	player := MyPlayer new.

	self assert: (player captureMoveIn: { rook }) isNil
]

{ #category : 'tests' }
MyPlayerTests >> testCaptureMoveFindsOpponentPiece [

	| board rook player |
	board := MyChessBoard empty.
	board at: 'e4' put: (rook := MyRook white).
	board at: 'e7' put: MyPawn black.
	player := MyPlayer new.

	self
		assert: (player captureMoveIn: { rook }) value
		equals: (board at: 'e7')
]

{ #category : 'tests' }
MyPlayerTests >> testCaptureMoveReturnsNilWhenNothingToEat [

	| board rook player |
	board := MyChessBoard empty.
	board at: 'e4' put: (rook := MyRook white).
	player := MyPlayer new.

	self assert: (player captureMoveIn: { rook }) isNil
]
