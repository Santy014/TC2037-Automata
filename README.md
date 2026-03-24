<h1> Evidence 1 - Implementation of Lexical Analysis </h1>
Santiago Martin del Campo Soler - A01713396 
Date: March - 24 - 2026

<h2> Description </h2>
According to Robert Sebesta, lexical analysis is the initial phase of a language processing system, acting as the front end of the syntax analyzer. It operates at the lowest level of a program's structure by analyzing sequences of characters.
<br> <br>
A lexical analyzer functions as a pattern matcher that reads an input string and groups characters into meaningful units called lexemes. These lexemes correspond to fundamental elements of a language, such as identifiers, reserved words, operators, numeric values, and punctuation symbols.
<br> <br>
Although this project does not implement a full lexical analyzer, it follows a similar principle by recognizing specific patterns within input strings. Therefore, this project focuses on the design and implementation of a deterministic finite automaton (DFA) capable of validating whether a given sequence of characters belongs to a predefined set of Elvish words taken from J.R.R. Tolkien's "The Lord of the Rings", specifically from the Sindarin and Quenya languages.
<br> <br>
The following set of words is recognized by the DFA:
<br><br>
<ul>
    <li><b> Amandil </b>- Sindarin word for 'Priest'.</li>
    <li><b> Amarth </b>- Sindarin word for 'Doom'.</li>
    <li><b> Ambarona </b>- Combination of Quenya words meaning 'Worlds-birth' used by Treebeard the Ent.</li>
    <li><b> Amon </b>- Sindarin word meaning 'Mountain' or 'Hill'.</li>
    <li><b> Ampa </b>- Quenya word for 'Hook'.</li>
</ul>

The language is restricted to the set of words defined above. Since the automaton is designed to recognize a finite set of strings, the alphabet (Σ) can be defined as follows:
<p align="center"><i> <b>Σ </b> = {a , m , n , d , i , l , r , t , h , b , o , p }</i></p>

<h3> Regular Expression</h3>
Regular expressions are formal constructs used to specify patterns in strings, typically relying on operators such as union, concatenation, and iteration. Formally, a regular expression operates over a set of input symbols to define a language, which is a set of strings that match a particular pattern.
<br><br>
The language defined above can be represented by the following regular expression:
<br><br>

```regexp
^am(andil|arth|barona|on|pa)$
```

<h2> Model</h2>
<br> <br>
The following diagram represents the structure of the deterministic finite automaton (DFA), including its states and transitions:
<br> <br>
<img width="1357" height="608" alt="DFA" src="https://raw.githubusercontent.com/Santy014/TC2037-Automata/refs/heads/main/DFA.png" />

The transitions represented on the DFA are the following: 

| Current State | Input | Next State |
|--------------|------|-----------|
| q0 | a | q1 |
| q1 | m | q2 |
| q2 | a | q3 |
| q3 | n | q4 |
| q4 | d | q5 |
| q5 | i | q6 |
| q6 | l | q7 |
| q3 | r | q8 |
| q8 | t | q9 |
| q9 | h | q10 |
| q2 | b | q11 |
| q11 | a | q12 |
| q12 | r | q13 |
| q13 | o | q14 |
| q14 | n | q15 |
| q15 | a | q16 |
| q2 | o | q17 |
| q17 | n | q18 |
| q2 | p | q19 |
| q19 | a | q20 |

The automaton begins at the initial state q0 and transitions to q1 upon reading 'a', and then to q2 after reading 'm'. These transitions represent the shared prefix among all valid words.

From state q2, the automaton branches into multiple paths depending on the next input symbol. Each branch corresponds to a different word, allowing the DFA to efficiently recognize multiple patterns.

Each valid word leads to a unique accepting state. If the input string reaches one of these states after processing all symbols, it is accepted; otherwise, it is rejected.


<h2> Implementation</h2>
The automaton is represented as a knowledge base in Prolog to support the lexical analysis process. Each transition of the DFA is encoded as a logical rule that specifies the current state, the input symbol, and the corresponding next state. This representation allows the automaton to be evaluated through recursive predicates, as shown below:

```prolog
move(q0, q1, a).
move(q1, q2, m).
```
Each valid word in the language leads to a distinct accepting state. Therefore, multiple accepting states are explicitly defined in the knowledge base:
```prolog
accepting_state(q7).  % Acceptance state for amandil
accepting_state(q10). % Acceptance state for amarth
accepting_state(q16). % Acceptance state for ambarona
accepting_state(q18). % Acceptance state for amon
accepting_state(q20). % Acceptance state for ampa
```
The evaluation of the automaton is performed through a recursive process. First, a helper predicate initializes the evaluation from the initial state:
```prolog
go_over_automaton(ListToCheck) :-
    automaton_check(ListToCheck, q0).
```
The base case verifies whether the automaton has reached an accepting state after consuming all input symbols:
```prolog
automaton_check([], State) :-
    accepting_state(State).
```

The recursive rule processes the input list one symbol at a time, transitioning between states according to the defined rules:
```prolog
automaton_check([Symbol|Rest], State) :-
    move(State, NextState, Symbol),
    automaton_check(Rest, NextState).
```
<h2>Tests</h2>

<p>
To validate the correctness of the deterministic finite automaton (DFA), a set of test cases was designed to evaluate both accepted and rejected inputs. Both accepted and rejected cases were tested to verify the automaton's behavior.
</p>

<h3>Accepted Test Cases</h3>

<p>The following inputs correspond to valid words defined in the language and were successfully recognized by the automaton:</p>

<ul>
  <li><b>amandil</b></li>
  <li><b>amarth</b></li>
  <li><b>ambarona</b></li>
  <li><b>amon</b></li>
  <li><b>ampa</b></li>
</ul>

<h3>Rejected Test Cases</h3>

<p>The following inputs were tested to verify that the automaton correctly rejects invalid strings:</p>

<ul>
  <li><b>amandi</b> — incomplete word</li>
  <li><b>amarthh</b> — extra character at the end</li>
  <li><b>ambaron</b> — missing final character</li>
  <li><b>amo</b> — incomplete prefix</li>
  <li><b>amp</b> — missing final character</li>
  <li><b>a</b> — input too short</li>
  <li><b>am</b> — shared prefix only</li>
  <li><b>amaa</b> — invalid sequence</li>
  <li><b>amoo</b> — invalid repetition</li>
  <li><b>[  ]</b> — empty string</li>
</ul>

<h2> Analysis </h2>
<h3> Time Complexity </h3>
The time complexity of the deterministic finite automaton (DFA) is O(n), where n is the length of the input string. 
The automaton processes each symbol exactly once, performing a single transition per character. 
Since no backtracking or re-evaluation is required, the execution time grows linearly with the size of the input.
<br> 
<h3> Space Complexity </h3>
The space complexity is O(n), due to the recursive nature of the implementation in Prolog. 
Each recursive call processes one symbol from the input list, creating a call stack proportional to the length of the string. 
Therefore, the memory usage increases linearly with the input size.
<h2> References </h2>

Blondin, M. (2023). Automata theory : an algorithmic approach / Javier Esparza
          and Michael Blondin. The MIT Press. 
<br> <br>
John E. Hopcroft, Rajeev Motwani, and Jeffrey D. Ullman. 2001. Introduction to automata theory, languages, and computation, 2nd edition. SIGACT News 32, 1 (March 2001), 60–65. https://doi.org/10.1145/568438.568455

Concepts of programming languages / Robert W. Sebesta (Twelfth edition, Global
          edition). (2023). Pearson. 
