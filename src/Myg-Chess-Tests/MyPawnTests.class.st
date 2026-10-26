Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

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
