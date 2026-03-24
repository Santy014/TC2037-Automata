:- consult('automata.pl').

% VALID WORDS TESTS (You get a True response)

word_amandil :-
    go_over_automaton([a,m,a,n,d,i,l]).

word_amarth :-
    go_over_automaton([a,m,a,r,t,h]).

word_ambarona :-
    go_over_automaton([a,m,b,a,r,o,n,a]).

word_amon :-
    go_over_automaton([a,m,o,n]).

word_ampa :-
    go_over_automaton([a,m,p,a]).

% INVALID WORDS TESTS (You get a false response)

% \+ represents negation, in this case it is used to verify that invalid inputs are correctly rejected by the automaton.
% amandi — incomplete word
word_invalid1 :- 
    \+ go_over_automaton([a,m,a,n,d,i]).

% amarthh — extra character at the end
word_invalid2 :- 
    \+ go_over_automaton([a,m,a,r,t,h,h]).

% ambaron — missing final character
word_invalid3 :- 
    \+ go_over_automaton([a,m,b,a,r,o,n]).

% amo — incomplete prefix
word_invalid4 :- 
    \+ go_over_automaton([a,m,o]).

% amp — missing final character
word_invalid5 :- 
    \+ go_over_automaton([a,m,p]).

% a — input too short
word_invalid6 :- 
    \+ go_over_automaton([a]).

% am — shared prefix only
word_invalid7 :- 
    \+ go_over_automaton([a,m]).

% amaa — invalid sequence
word_invalid8 :- 
    \+ go_over_automaton([a,m,a,a]).

% amoo — invalid repetition
word_invalid9 :- 
    \+ go_over_automaton([a,m,o,o]).

% [ ] — empty string
word_invalid10 :- 
    \+ go_over_automaton([]).

% GROUP TESTS

true_testCase :-
    write('Accepting automaton:'), nl,
    word_amandil,
    word_amarth,
    word_ambarona,
    word_amon,
    word_ampa,
    write('All valid tests passed.'), nl,
    !.

false_testCase :-
    write('Rejecting automaton:'), nl,
    word_invalid1,
    word_invalid2,
    word_invalid3,
    word_invalid4,
    word_invalid5,
    word_invalid6,
    word_invalid7,
    word_invalid8,
    word_invalid9,
    word_invalid10,
    write('All invalid tests passed.'), nl,
    !.
