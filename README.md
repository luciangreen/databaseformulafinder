# Database Formula Finder

* Finds database formulas in terms of "and" and "or" from data.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

# 1. Install manually

Download <a href="http://github.com/luciangreen/databaseformulafinder/">this repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","databaseformulafinder").
halt
```

# Running

* In Shell:
`cd databaseformulafinder`
`swipl`
`['databaseformulafinder.pl'].`

```
dbff(Columns,Result,Formula).
Columns - Column names and data
Result - The result to work the formula out from
Formula - The worked-out formula

?- dbff([[a,1,2,3]],[1,2,3],F).
F = [a] 

?- dbff([[a, 1], [b, 1, 2]], [1],F).
F = [a, and, b] 
F = [b, and, a] 

?- dbff([[a, 1], [b, 1, 2],[c,3]], [1,2,3],F).
F = [[b, or, a], or, c] 
F = [b, or, [c, or, a]] 

?- dbff([[a, 1], [b, 1, 2],[c,1,3]], [1],F).
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

?- dbff([[a, 1], [b, 1, 2],[c,1,3]], [1,3],F).
F = [[a, and, b], or, c] 
F = [c, or, [a, and, b]] 
```
