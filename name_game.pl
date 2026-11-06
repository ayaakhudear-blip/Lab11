:- dynamic letter/1.

name_game :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the Name Game.'), nl,
    menu.

menu :-
    nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '), read(Choice),
    ( Choice == 7 -> true ; action(Choice), menu ).

action(1) :- display_letters.
action(2) :- read_letter(Letter), assertz(letter(Letter)).
action(3) :- read_letter(Letter), asserta(letter(Letter)).
action(4) :- read_letter(Letter), assertz(letter(Letter)).
action(5) :-
    read_letter(Letter),
    ( retract(letter(Letter)) -> true
    ; write('Letter not found.'), nl ).
action(6) :- retractall(letter(_)).
action(Choice) :-
    \+ member(Choice, [1,2,3,4,5,6,7]),
    write('Invalid choice.'), nl.

read_letter(Letter) :-
    write('Enter a letter: '), read(Letter).

display_letters :-
    letter(Letter),
    write(Letter),
    fail.
display_letters :- nl.
