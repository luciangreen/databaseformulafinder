dbff1(Columns1,Columns2,Result,Formula1) :-
        member(Column,Columns1),
        Column=[Name|_Rest],
        delete(Columns2,Column,Columns3),
	Formula2=Name,
        dbff2(Columns1,Columns3,Result,Formula2,Formula3),
	list(Formula3,Formula1).
dbff2(_Columns1,[],_Result,Formula,Formula).
dbff2(Columns1,Columns2,Result,Formula1,Formula2) :-
	member(Column,Columns2),
	Column=[Name|_Rest],
	delete(Columns2,Column,Columns3),
	appendlogic(Formula1,Name,Formula3),
        dbff3(Columns1,Result,Formula3),
	dbff2(Columns1,Columns3,Result,Formula3,Formula2).
dbff3(Columns1,Result1,[Formula1,and,Formula2]) :-
        dbff3(Columns1,Result2,Formula1),
        dbff3(Columns1,Result3,Formula2),
        intersection1(Result2,Result3,[],Result1).
dbff3(Columns1,Result1,[Formula1,or,Formula2]) :-
        dbff3(Columns1,Result2,Formula1),
        dbff3(Columns1,Result3,Formula2),
        union(Result2,Result3,Result1).
dbff3(Columns,Result1,Formula1) :-
        member([Formula1|Result1],Columns).
appendlogic([Formula1,Operator,Formula2],Name2,Formula3) :-
	appendlogic(Formula1,Name2,Formula4),
	Formula3=[Formula4,Operator,Formula2].
appendlogic([Formula1,Operator,Formula2],Name2,Formula3) :-
        appendlogic(Formula2,Name2,Formula4),
        Formula3=[Formula1,Operator,Formula4].
appendlogic(Formula1,Name,Formula2) :-
	atom(Formula1),append([Formula1],[and,Name],Formula2).
appendlogic(Formula1,Name,Formula2) :-
	atom(Formula1), append([Formula1],[or,Name],Formula2).
unique1(_Remainders,[],UniqueRemainders,UniqueRemainders) :- !.
unique1(Remainders1,Remainder,UniqueRemainders1,UniqueRemainders2) :-
	delete(Remainders1,Remainder,Remainders2),
        append([Remainder],Remainders2,Remainders3),
	unique2(Remainders3,Remainders4,Remainders5,UniqueRemainders1,UniqueRemainders3),
        unique1(Remainders5,Remainders4,UniqueRemainders3,UniqueRemainders2).
unique2(Remainders1,Remainder1,Remainders2,UniqueRemainders1,UniqueRemainders2) :-
        Remainders1=[Remainder2,Remainder1|Remainders2],
	append(UniqueRemainders1,[Remainder2],UniqueRemainders2).
unique2(Remainders1,_Remainder1,Remainder2,UniqueRemainders1,UniqueRemainders2) :-
        Remainders1=[Remainder2],
        append(UniqueRemainders1,[Remainder2],UniqueRemainders2).	
intersection1([],_Result1,Result2,Result2).
intersection1(Result1,Result2,Result3,Result4) :-
        Result1=[Result6|Results1],
	intersection2(Result6,Result2,Result3,Result5),
        intersection1(Results1,Result2,Result5,Result4).
intersection2(Result1,Result2,Result7,Result3) :-
        member(Result1,Result2),
        append(Result7,[Result1],Result3).
intersection2(Result1,Result2,Result7,Result7) :-
        not(member(Result1,Result2)).
union(Result1,Result2,Result3) :-
        append(Result1,Result2,Result4),
	Result4=[Result5|Results],
        unique1(Results,Result5,[],Result3).
list(Formula1,Formula2) :-
	atom(Formula1),Formula2=[Formula1].
list(Formula,Formula) :-
	not(atom(Formula)).
