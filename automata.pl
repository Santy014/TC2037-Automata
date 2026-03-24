% Transición Fija 
move(q0, q1, a).
move(q1, q2, m).

% Tramcisiones Restantes por palabra
% Amandil
move(q2, q3, a).
move(q3, q4, n).
move(q4, q5, d).
move(q5, q6, i).
move(q6, q7, l).


% Amarth
move(q2, q3, a).
move(q3, q8, r).
move(q8, q9, t).
move(q9, q10, h).

% Ambarona
move(q2, q11, b).
move(q11, q12, a).
move(q12, q13, r).
move(q13, q14, o).
move(q14, q15, n).
move(q15, q16, a).

% Amon
move(q2, q17, o).
move(q17, q18, n).

% Ampa
move(q2, q19, p).
move(q19, q20, a).

% Estados finales aceptables
accepting_state(q7).   % amandil
accepting_state(q10).  % amarth
accepting_state(q16).  % ambarona
accepting_state(q18).  % amon
accepting_state(q20).  % ampa

% Recorrer Automata
go_over_automaton(ListToCheck) :-
	automaton_check(ListToCheck, q0). 

% Verificar estado final Automata
automaton_check([], State) :-
	accepting_state(State).

% Checar automata 
automaton_check([Symbol|Rest], State) :-
    move(State, NextState, Symbol),
    automaton_check(Rest, NextState).


