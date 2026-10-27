Class {
	#name : 'MyChessSquareTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTests >> testRenderOnDarkSquare [

	| square |
	square := MyChessSquare black.
	self assert: (square renderPawn: MyPawn white) equals: 'p'.
	self assert: (square renderPawn: MyPawn black) equals: 'o'.
	self assert: (square renderBishop: MyBishop white) equals: 'b'.
	self assert: (square renderBishop: MyBishop black) equals: 'v'.
	self assert: (square renderKing: MyKing white) equals: 'k'.
	self assert: (square renderKing: MyKing black) equals: 'l'.
	self assert: (square renderKnight: MyKnight white) equals: 'n'.
	self assert: (square renderKnight: MyKnight black) equals: 'm'.
	self assert: (square renderQueen: MyQueen white) equals: 'q'.
	self assert: (square renderQueen: MyQueen black) equals: 'w'.
	self assert: (square renderRook: MyRook white) equals: 'r'.
	self assert: (square renderRook: MyRook black) equals: 't'
]

{ #category : 'tests' }
MyChessSquareTests >> testRenderOnLightSquare [

	| square |
	square := MyChessSquare white.
	self assert: (square renderPawn: MyPawn white) equals: 'P'.
	self assert: (square renderPawn: MyPawn black) equals: 'O'.
	self assert: (square renderBishop: MyBishop white) equals: 'B'.
	self assert: (square renderBishop: MyBishop black) equals: 'V'.
	self assert: (square renderKing: MyKing white) equals: 'K'.
	self assert: (square renderKing: MyKing black) equals: 'L'.
	self assert: (square renderKnight: MyKnight white) equals: 'N'.
	self assert: (square renderKnight: MyKnight black) equals: 'M'.
	self assert: (square renderQueen: MyQueen white) equals: 'Q'.
	self assert: (square renderQueen: MyQueen black) equals: 'W'.
	self assert: (square renderRook: MyRook white) equals: 'R'.
	self assert: (square renderRook: MyRook black) equals: 'T'
]
