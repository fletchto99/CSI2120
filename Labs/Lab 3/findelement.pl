element(chlorine,'Cl').
element(helium,'He').
element(hydrogen,'H').
element(nitrogen,'N').
element(oxygen,'O').

findElement() :- repeat, 
                writef('Elements in the Perodic table\r\nSymbol to look up: '), 
                read(Symbol),
                findElement(Symbol).

findElement(Symbol) :- not(element(_, Symbol)), 
                writef('%w is not in th database\r\nExiting', [Symbol]).
findElement(Symbol) :- element(Name, Symbol), 
                writef('%w is the symbol for %w\r\n', [Symbol, Name]),
                fail.