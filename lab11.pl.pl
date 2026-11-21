
% Lab 11

:- dynamic letter/1.

% Initial letters
start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    nl,
    write('Welcome to the Name Game!'),
    nl,
    menu.

% Display the menu
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1 - Display the current set of letters'), nl,
    write('2 - Add a letter'), nl,
    write('3 - Add a letter at the top'), nl,
    write('4 - Add a letter at the bottom'), nl,
    write('5 - Delete a letter'), nl,
    write('6 - Delete all letters'), nl,
    write('7 - Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    option(Choice).

% Option 1: Display letters
option(1) :-
    findall(X, letter(X), Letters),
    write('Current letters: '),
    writeln(Letters),
    menu.

% Option 2: Add a letter
option(2) :-
    write('Enter a letter: '),
    read(X),
    ( letter(X) ->
        write('Letter already exists.'), nl
    ;
        assertz(letter(X)),
        write('Letter added.'), nl
    ),
    menu.

% Option 3: Add at the top
option(3) :-
    write('Enter a letter: '),
    read(X),
    retractall(letter(X)),
    asserta(letter(X)),
    write('Letter added at the top.'), nl,
    menu.

% Option 4: Add at the bottom
option(4) :-
    write('Enter a letter: '),
    read(X),
    retractall(letter(X)),
    assertz(letter(X)),
    write('Letter added at the bottom.'), nl,
    menu.

% Option 5: Delete a letter
option(5) :-
    write('Enter the letter to delete: '),
    read(X),
    ( retract(letter(X)) ->
        write('Letter deleted.'), nl
    ;
        write('Letter not found.'), nl
    ),
    menu.

% Option 6: Delete all letters
option(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

% Option 7: Exit
option(7) :-
    write('Goodbye!'), nl.

% Invalid option
option(_) :-
    write('Invalid choice. Try again.'), nl,
    menu.
