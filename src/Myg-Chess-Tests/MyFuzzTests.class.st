Class {
	#name : 'MyFuzzTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyFuzzTests >> testRandomBoardsGiveLegalMoves [

	| names classes |
	"Les 64 noms de cases : a1, a2 ... h8"
	names := OrderedCollection new.
	$a asciiValue to: $h asciiValue do: [ :column |
		1 to: 8 do: [ :rank |
			names add: column asCharacter asString , rank asString ] ].
	"Les pièces tirées au hasard (sans le roi)"
	classes := { MyPawn. MyRook. MyBishop. MyKnight. MyQueen }.

	100 timesRepeat: [
		| board placed |
		board := MyChessBoard empty.
		placed := OrderedCollection new.
		"On pose 10 pièces au hasard, de couleur au hasard, sur 10 cases différentes"
		(names asArray shuffled first: 10) do: [ :name |
			| piece |
			piece := classes atRandom perform: #( white black ) atRandom.
			board at: name put: piece.
			placed add: piece ].
		"Pour chaque pièce, chaque case permise doit exister,
		et être vide ou occupée par une pièce adverse"
		placed do: [ :piece |
			piece legalTargetSquares do: [ :target |
				self assert: target notNil.
				self assert: (target hasPiece not or: [
						 target contents color ~= piece color ]) ] ] ]
]
