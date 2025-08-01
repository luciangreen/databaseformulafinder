# Database Formula Finder

* Finds database formulas in terms of "and" and "or" from data.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Check if `usr/local/bin` exists

```
ls -ld /usr/local/bin
```

* Create the directory if missing

```
sudo mkdir -p /usr/local/bin
```

* Link to swipl in Terminal

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

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
../
halt.
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
