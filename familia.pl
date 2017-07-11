hombre(frank).
hombre(stanley).
hombre(colin).
hombre(david).
hombre(shane).
hombre(charlie).
hombre(tom).
hombre(chris).
hombre(peter).
hombre(todd).

mujer(joyce).
mujer(pauline).
mujer(karen).
mujer(janice).
mujer(jan).
mujer(lauren).
mujer(hayley).
mujer(katie).
mujer(amy-leigh).

padres(joyce, frank, david).
padres(joyce, frank, janice).
padres(joyce, frank, colin).

padres(pauline, stanley, chris).
padres(pauline, stanley, jan).

padres(karen, colin, shane).
padres(karen, colin, louren).

padres(janice, chris, hayley).
padres(janice, chris, katie).
padres(janice, chris, charlie).
padres(janice, chris, tom).

padres(jan, peter, todd).
padres(jan, peter, amy-leigh).

esposos(joyce, frank).
esposos(pauline, stanley).
esposos(karen, colin).
esposos(janice, chris).
esposos(peter, jan).



 /* X es abuelo de Y - No distingue genero*/
abuelo(X, Y) :- padres(J, K, Y),
    			( padres(_, X,J); padres(_, X,K)).

 /* X es padre de Y */
padre(X, Y) :- padres(_, X, Y), hombre(X).

 /* X es padre de Y */
madre(X, Y) :- padres(_, X, Y), mujer(X).

/* X es hermano de Y */
hermano(X, Y) :- padres(Padre, Madre, X),
    			 padres(Padre, Madre, Y),
    			 hombre(X).

/* X es hermana de Y */
hermana(X, Y) :- padres(Padre, Madre, X),
    			 padres(Padre, Madre, Y),
    			 mujer(X).

/* X es tio de Y */
tio(X, Y) :- padres(Padre, Madre, Y),
    		(hermano(X, Padre); hermano(X, Madre)).

/* X es tia de Y */
tia(X, Y) :- padres(Padre, Madre, Y),
    		(hermana(X, Padre); hermana(X, Madre)).

/* X es suegro de Y */
suegro(X, Y) :- esposos(Y, Pareja),
    			padre(X, Pareja).

/* X es suegro de Y */
suegra(X, Y) :- esposos(Y, Pareja),
    			madre(X, Pareja).

/* X es nuera de Y*/
/* Nuera es la esposa del hijo de una persona*/
nuera(X, Y) :-  mujer(X),
    			(padres(Y, _, Hijo);  padres(_, Y, Hijo)),
    			(esposos(X, Hijo); esposos(Hijo, X)  ).

/* X es yerno de Y*/
/* Yerno es el esposo de la hija de una persona.*/
yerno(X, Y) :-  hombre(X),
    			(padres(Y, _, Hija);  padres(_, Y, Hija)),
    			(esposos(X, Hija); esposos(Hija, X)).

/* X es Cuñado de Y*/
hermanoPolitico(X, Y) :- (esposos(Y, Hermano); esposos(Hermano, Y)),
    					 hermano(X, Hermano).

/* X es Cuñada de Y*/
hermanaPolitica(X, Y) :- (esposos(Y, Hermana); esposos(Hermana, Y)),
    					 hermana(X, Hermana).


/* X es primo de Y  - No distingue el genero*/
primo(X, Y) :- padres(Padre1, Madre1, X),
    		   padres(Padre2, Madre2, Y),
    		   (   (padres(Padre, Madre, Padre1),
    		   		padres(Padre, Madre, Padre2))
               ;   (padres(Padre, Madre, Madre1),
    		   		padres(Padre, Madre, Madre2))
               ;   (padres(Padre, Madre, Madre1),
    		   		padres(Padre, Madre, Padre2))
               ;   (padres(Padre, Madre, Madre2),
    		   		padres(Padre, Madre, Padre1))
               ).    
    
/* X es soltero - No distingue el genero*/
soltero(X) :- not(esposos(_, X)).hombre(frank).
hombre(stanley).
hombre(colin).
hombre(david).
hombre(shane).
hombre(charlie).
hombre(tom).
hombre(chris).
hombre(peter).
hombre(todd).

mujer(joyce).
mujer(pauline).
mujer(karen).
mujer(janice).
mujer(jan).
mujer(lauren).
mujer(hayley).
mujer(katie).
mujer(amy-leigh).

padres(joyce, frank, david).
padres(joyce, frank, janice).
padres(joyce, frank, colin).

padres(pauline, stanley, chris).
padres(pauline, stanley, jan).

padres(karen, colin, shane).
padres(karen, colin, louren).

padres(janice, chris, hayley).
padres(janice, chris, katie).
padres(janice, chris, charlie).
padres(janice, chris, tom).

padres(jan, peter, todd).
padres(jan, peter, amy-leigh).

esposos(joyce, frank).
esposos(pauline, stanley).
esposos(karen, colin).
esposos(janice, chris).
esposos(jan, peter).

 /* X es abuelo de Y */
abuelo(X, Y) :- padres(J, K, Y),
    			( padres(_, X,J); padres(_, X,K)).

 /* X es padre de Y */
padre(X, Y) :- padres(_, X, Y), hombre(X).

 /* X es padre de Y */
madre(X, Y) :- padres(_, X, Y), mujer(X).

/* X es hermano de Y */
hermano(X, Y) :- padres(Padre, Madre, X),
    			 padres(Padre, Madre, Y),
    			 hombre(X).

/* X es hermana de Y */
hermana(X, Y) :- padres(Padre, Madre, X),
    			 padres(Padre, Madre, Y),
    			 mujer(X).

/* X es tio de Y */
tio(X, Y) :- padres(Padre, Madre, Y),
    		(hermano(X, Padre); hermano(X, Madre)).

/* X es tia de Y */
tia(X, Y) :- padres(Padre, Madre, Y),
    		(hermana(X, Padre); hermana(X, Madre)).

/* X es suegro de Y */
suegro(X, Y) :- esposos(X, Pareja),
    			padre(Y, Pareja).

    

/* X es soltero */
soltero(X) :- not(esposos(_, X)).


