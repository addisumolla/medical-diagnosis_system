/*
INJIBARA UNIVERSITY COLLEGE OF ENGINEERING AND TECHNOLOGY 
DEPARTMENT OF COMPUTER SCIENCE ARTIFICIAL INTELEGENCE (AI)
Medical Diagnosis System in Prolog 
*/


go:-
    hypothesis(Disease),
    write('I believe you have: '),
    write(Disease),
    nl,
    write('Take care.'),
    nl,
    undo.

/* Hypotheses that should be tested */
hypothesis(cold) :- cold, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(measles) :- measles, !.
hypothesis(malaria) :- malaria, !.
hypothesis(unknown).

cold :-
    verify(headache),
    verify(runny_nose),
    verify(sneezing),
    verify(sore_throat),
    write('Advices and Suggestions:'), nl,
    write('1: Tylenol/tab'), nl,
    write('2: Panado1/tab'), nl,
    write('3: Nasal spray'), nl,
    write('Please wear warm clothes because'), nl.

flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache),
    write('Advices and Suggestions:'), nl,
    write('1: Tamiflu/tab'), nl,
    write('2: Pandol/tab'), nl,
    write('3: Zanamivir/tab'), nl,
    write('Please take a warm bath and do salt gargling because'), nl.

typhoid :-
    verify(headache),
    verify(abdominal_pain),
    verify(poor_appetite),
    verify(fever),
    write('Advices and Suggestions:'), nl,
    write('1: chloramplicol/tab'), nl,
    write('2: Amoxicillin/tab'), nl,
    write('3: Ciprofloxacin/tab'), nl,
    write('4: Azihtromycin/tab'), nl,
    write('Please do complete bed rest and take a soft diet because'), nl.

measles :-
    verify(fever),
    verify(runny),
    verify(rash),
    verify(conjuctivity),
    write('Advices and Suggestions:'), nl,
    write('1: Tylenol/tab'), nl,
    write('2: Aleve/tab'), nl,
    write('3: Advil/tab'), nl,
    write('4: Vitamin A'), nl,
    write('Please get rest and use more liquid because'), nl.

malaria :-
    verify(fever),
    verify(sweating),
    verify(headache),
    verify(nausea),
    verify(vomiting),
    verify(diarrhea),
    write('Advices and Suggestions:'), nl,
    write('1: Aralen/tab'), nl,
    write('2: Qualaquuin/tab'), nl,
    write('3: Plaquenil/tab'), nl,
    write('4: Mefloquine'), nl,
    write('Please do not sleep in open air and cover your full skin because'), nl.

/* How to ask questions */
ask(Question) :-
    write('Does the patient have the following symptom: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    (
        (Response == yes ; Response == y)
        ->
        assert(yes(Question))
        ;
        assert(no(Question)),
        fail
    ).

:- dynamic yes/1, no/1.

/* How to verify something */
verify(S) :-
    (yes(S) ->
    true ;
    (no(S) ->
    fail ;
    ask(S))).

/* Undo all yes/no assertions */
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
