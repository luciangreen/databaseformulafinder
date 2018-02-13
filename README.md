# databaseformulafinder
Database Formula Finder

/**

An object can be human-like algorithm

Database formula finder

A 123
B 234
C 345

A^B^C=3

?- dbff1([[a,1,2,3]],[[a,1,2,3]],[1,2,3],F).
F = [a] 

?- dbff1([[a, 1], [b, 1, 2]],[[a, 1], [b, 1, 2]], [1],F).
F = [a, and, b] 
F = [b, and, a] 

?- dbff1([[a, 1], [b, 1, 2],[c,3]],[[a, 1], [b, 1, 2],[c,3] ], [1,2,3],F).
F = [[b, or, a], or, c] 
F = [b, or, [c, or, a]] 

?- dbff1([[a, 1], [b, 1, 2],[c,1,3]],[[a, 1], [b, 1, 2],[c,1,3] ], [1],F).
F = [[a, and, c], and, b] 
F = [[a, or, c], and, b] 
F = [a, and, [b, and, c]] 
F = [a, and, [b, or, c]] 
F = [[a, and, b], and, c] 
F = [[a, or, b], and, c] 
F = [a, and, [c, and, b]] 
F = [a, and, [c, or, b]] 
F = [[b, and, c], and, a] 
F = [[b, or, c], and, a] 
F = [b, and, [a, and, c]] 
F = [b, and, [a, or, c]] 
F = [[b, and, a], and, c] 
F = [[b, or, a], and, c] 
F = [b, and, [c, and, a]] 
F = [b, and, [c, or, a]] 
F = [[c, and, b], and, a] 
F = [[c, or, b], and, a] 
F = [c, and, [a, and, b]] 
F = [c, and, [a, or, b]] 
F = [[c, and, a], and, b] 
F = [[c, or, a], and, b] 
F = [c, and, [b, and, a]] 
F = [c, and, [b, or, a]] 

?- dbff1([[a, 1], [b, 1, 2],[c,1,3]],[[a, 1], [b, 1, 2],[c,1,3] ], [1,3],F).
F = [[a, and, b], or, c] 
F = [c, or, [a, and, b]] 

**/
