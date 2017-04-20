/*
*   sde3.pro: verifies semantic correctness of fuzzy set membership function representation.
*   Copyright (C) 2017  Nick Barrs
*
*   This file is part of SDE3.
*
*   SDE3 is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   This program is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
*   Feel free to contact me with questions/concerns at any time
*   via e-mail at nbarrs@g.clemson.edu
*   via paper mail at 111 Cochran Rd Apt 702B Clemson, SC 29631
*/

mu(Input) :- 
    f0(Input),
    f1(Input),
    f2(Input),
    f3(Input),
    f4(Input),
    f5(Input),
    f6(Input),
    f7(Input).

f0(((_,_), [(_,_)|_])) :- 
    true.

f1(((A,B), [(_,_)|_])) :- 
    integer(A), 
    integer(B), 
    A=<B.

f2(((_,_), [])) :-
    !, true.

f2(((A,B), [(X,_)|L])) :- 
    integer(X),
    X>=A,
    X=<B,
    f2(((A,B), L)).

f3(((_,_), L)) :-
    not(list_empty(L)).

f4(((A,_), [(X,_)|_])) :-
    A =:= X.

f5(((_,_), [])) :-
    !, true.

f5(((A,B), [(_,Y)|L])) :-
    Y>=0,
    Y=<1.0,
    f5(((A,B), L)).

f6(((_,B), [(X,_)])) :-
    !, B =:= X.

f6(((A,B), [(_,_)|L])) :-
    f6(((A,B), L)).

f7b((_, [])) :-
    !, true.

f7b((P, [(X,_)|L])) :-
    P =:= X,
    Z is X+1,
    f7b((Z, L)).

f7(((_,_), [(X,_)|L])) :-
    Z is X+1,
    f7b((Z, L)).

list_empty([]) :-
    true.

list_empty([_|_]) :-
    false.
