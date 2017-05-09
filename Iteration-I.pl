% LIST WOMEN

	women([lise, signe, karen]).



% LIST MEN

	men([peter, morten, jesper]).





 % PREFERENCES (WOMEN)

	% lise
		prefere(lise, morten, 1).
		prefere(lise, peter, 2).
		prefere(lise, jesper, 3).

	% signe
		prefere(signe, peter, 1).
		prefere(signe, jesper, 2).
		prefere(signe, morten, 3).

	% karen
		prefere(karen, peter, 1).
		prefere(karen, morten, 2).
		prefere(karen, jesper, 3).




 % PREFERENCES (MEN) 

	% peter
		prefere(peter, signe, 1).
		prefere(peter, karen, 2).
		prefere(peter, lise, 3).

	% morten
		prefere(morten, lise, 1).
		prefere(morten, karen, 2).
		prefere(morten, signe, 3).

	% jesper
		prefere(jesper, lise, 1).
		prefere(jesper, karen, 2).
		prefere(jesper, signe, 3).





% EN FUNKTION DER TAGER 3 PERSONER IND, 1 KVINDE/MAND (X) OG TO GIVNE 'RANKEDE' PERSONER (Y, Z) AF DET MODSATTE KØN, FOR DERNÆST AT SAMMENLIGNE DERES 'RANKING' (N_N) I FORHOLD TIL HINANDEN.


	preference(X,Y,Z) :-
		prefere(X,Y,N_1),
		prefere(X,Z, N_2),
		N_1 < N_2.




 % EN 'DOBBELT’-FUNKTION DER TAGER 2 PAR IND OG TJEKKER DERES 'RANKINGS' I FORHOLD TIL HINANDEN OG HVEM DE HVER ISÆR 'BURDE' DANNE PAR MED


	unstable_check(pair(X1, Y1), pair(X2, Y2)) :-
		preference(X1, Y2, Y1),
		preference(Y2, X1, X2).
	unstable_check(pair(X1, Y1), pair(X2, Y2)) :-
		preference(Y1, X2, X1),
		preference(X2, Y1, Y2).






 % Eksempel 1
	% unstable_check(pair(peter, signe), pair(jesper, lise)) :-
	%	preference(peter, lise, signe) :- false
	%	preference(lise, peter, jesper):- false	%
	% unstable_check(pair(peter, signe), pair(jesper, lise)) :-
	%	preference(signe, jesper, peter) :- false
	%	preference(jesper, signe, lise) :- false
	% NOT UNSTABLE

 % Eksempel 2
	% unstable_check(pair(jesper, signe), pair(peter, lise)) :-
	%	preference(jesper, lise, signe) :- true
	%	preference(lise, jesper, peter):- true	%
	% unstable_check(pair(jesper, signe), pair(peter, lise)) :-
	%	preference(signe, peter, jesper) :- true
	%	preference(peter, signe, lise) :- true
	% UNSTABLE



	% UNSTABLE MED LISTE AF PAR
 %	unstable([pair(X1, Y1), pair(X2, Y2)]) :-
	%	 X1 \== X2,
		% Y1 \== Y2,
		 % unstable_check(pair(X1, Y1), pair(X2, Y2)).



	% UNSTABLE MED GENERALISERET LISTE AF PAR

	unstable(L) :-
		member(pair(X1, Y1), L),
		member(pair(X2, Y2), L),
		 X1 \== X2,
		 unstable_check(pair(X1, Y1), pair(X2, Y2)).

 % STRATEGI:
        % 1. PermutÈr alle kvinderne
	% 2. Lav ny liste af permuterede kvinder
	% 3. Lav par fra de to lister
        % 4. Check om unstable



 % DEFINITION AF AT VÆRE NOT-UNSTABLE.

        not(P) :-
		\+P.

 % CREME.

        stableMarriges(L) :-
		men(X),
		women(Y),
	        permutation(Y, Y1),
		getMarried(X,Y1,L),
		not(unstable(L)).




 % TAGER EN LISTE OG PERMUTERER DEN TIL EN NY LISTE.

        permutation([], []). % STANDARD TILFÆLDET. SIKRER, AT FUNKTIONEN STOPPER.
        permutation(X, [Y|Ys]) :-
		append(Y, X, Z),
		permutation(Z, Ys). % REKURSIVT KALD


 % TAGER ET ELEMENT OG SÆTTER DET BAG PÂ EN LISTE.

        append(X, [X|Xs], Xs). % STANDARD TILFÊLDET. SIKRER AT FUNKTIONEN STOPPER
        append(X, [Y|Ys], [Y|Z]) :-
		append(X, Ys, Z). % REKURSIVT KALD


 % SÂ ER DER FEST!

	getMarried([],[],[]). % STANDARD TILFÊLDET. SIKRER AT FUNKTIONEN STOPPER
	getMarried([X|Xs], [Y|Ys], [pair(X,Y)|XYs]) :-
		getMarried(Xs, Ys, XYs). % REKURSIVT KALD
