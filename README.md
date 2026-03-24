<h1> Evidence 1 - Lexical Analysis </h1>
Santiago Martin del Campo Soler - A01713396 
Date: March - 24 - 2026

<h2> Description </h2>
According to Robert Sebesta, lexical analysis is the initial phase of a language processing system, acting as the front end of the syntax analyzer. It operates at the lowest level of a program's structure by analyzing sequences of characters.
<br> <br>
A lexical analyzer functions as a pattern matcher that reads an input string and groups characters into meaningful units called lexemes. These lexemes correspond to fundamental elements of a language, such as identifiers, reserved words, operators, numeric values, and punctuation symbols.
<br> <br>
Although this project does not implement a full lexical analyzer, it follows a similar principle by recognizing specific patterns within input strings. Therefore, this project focuses on the design and implementation of a deterministic finite automaton (DFA) capable of validating whether a given sequence of characters belongs to a predefined set of Elvish words from J.R. R. Tolkien famos book series "The Lord of The Rings".
<br> <br>
The following set of words is recognized by the DFA:
<br> <br>
<ul>
    <li><b> Amandil </b>- Sindarin word for 'Priest'.</li>
    <li><b> Amarth </b>- Sindarin word for 'Doom'.</li>
    <li><b> Ambarona </b>- Combination of Quenya words meaning 'Worlds-birth' used by Treebeard the Ent.</li>
    <li><b> Amon </b>- Sindarin word meaning 'Mountain' or 'Hill'.</li>
    <li><b> Ampa </b>- Quenya word for 'Hook'.</li>
</ul>
<h2> Model</h2>
The language defined by the DFA is restricted to these words. Since the automaton is designed to recognize a finite set of strings, the alphabet can be defined as:

### Alphabet (Σ)

<p align="center"><i> <b>Σ </b> = {a , m , n , d , i , l , r , t , h , b , o , p }</i></p>

<br> <br>
The following diagram represents the structure of the deterministic finite automaton (DFA), including its states and transitions:
<img width="1357" height="608" alt="DFA" src="https://github.com/user-attachments/assets/61a9d2f6-6352-445d-bd4c-342eb3f5c3a3" />


The automaton begins at the initial state q0 and transitions to q1 upon reading 'a', and then to q2 after reading 'm'. These transitions represent the shared prefix among all valid words.

From state q2, the automaton branches into multiple paths depending on the next input symbol. Each branch corresponds to a different word, allowing the DFA to efficiently recognize multiple patterns.

Each valid word leads to a unique accepting state. If the input string reaches one of these states after processing all symbols, it is accepted; otherwise, it is rejected.
<h2> Implementation</h2>
The automaton is represented as a knowledge base in Prolog to support the lexical analysis process. Each transition of the DFA is encoded as a logical rule that specifies the current state, the input symbol, and the corresponding next state. This representation allows the automaton to be evaluated through recursive predicates, as shown below:
<h2> Tests </h2>
<h2> Analysis </h2>
<h3> Time Complexity </h3>
<h3> Space Complexity </h3>
<h2> References </h2>
