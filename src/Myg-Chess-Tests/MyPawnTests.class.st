Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testBlackPawnBecomesQueenOnLastRank [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn black).

	pawn moveTo: (board at: 'e1').

	self assert: (board at: 'e1') contents class equals: MyQueen.
	self deny: (board at: 'e1') contents isWhite
]

{ #category : 'tests' }
MyPawnTests >> testBlockedPawnCannotAdvance [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	"Une pièce juste devant bloque le pion, même si elle est adverse"
	board at: 'e5' put: MyPawn black.

	self assert: pawn legalTargetSquares isEmpty
]

{ #category : 'tests' }
MyPawnTests >> testPawnCanAdvanceTwoSquaresFromStart [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	self
		assertCollection: pawn legalTargetSquares
		hasSameElements: { (board at: 'e3'). (board at: 'e4') }
]

{ #category : 'tests' }
MyPawnTests >> testPawnCannotAdvanceTwoSquaresAfterMoving [

	| pawn board |
	board := MyChessBoard empty.
	"Un pion déjà avancé en e3 n'est plus sur sa rangée de départ"
	board at: 'e3' put: (pawn := MyPawn white).

	self
		assertCollection: pawn legalTargetSquares
		hasSameElements: { (board at: 'e4') }
]

{ #category : 'tests' }
MyPawnTests >> testPawnDoesNotEatSameColorOrEmptyDiagonal [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	"d5 contient une pièce blanche (interdit) et f5 est vide (interdit)"
	board at: 'd5' put: MyPawn white.

	self
		assertCollection: pawn legalTargetSquares
		hasSameElements: { (board at: 'e5') }
]

{ #category : 'tests' }
MyPawnTests >> testPawnEatsDiagonally [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	"Deux pièces noires en diagonale devant le pion"
	board at: 'd5' put: MyPawn black.
	board at: 'f5' put: MyPawn black.

	self
		assertCollection: pawn legalTargetSquares
		hasSameElements: {
				(board at: 'e5').
				(board at: 'd5').
				(board at: 'f5') }
]

{ #category : 'tests' }
MyPawnTests >> testPawnIsNotPromotedBeforeLastRank [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e5').

	self assert: (board at: 'e5') contents class equals: MyPawn
]

{ #category : 'tests' }
MyPawnTests >> testWhitePawnBecomesQueenOnLastRank [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e8').

	self assert: (board at: 'e8') contents class equals: MyQueen.
	self assert: (board at: 'e8') contents isWhite
]
