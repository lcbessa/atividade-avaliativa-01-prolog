%fatos
informacoes(Nacionalidade, Animal, MarcaCigarro, Bebida, Cor).

%regras (Pergunta a responder)
donoDaZebra(Dono) :- 
    casas(Casas), 
    pessoa(informacoes(Dono,zebra,_,_,_), Casas).

bebeAgua(QuemBebe) :- 
    casas(Casas), 
    pessoa(informacoes(QuemBebe,_,_,agua,_), Casas).
    

casas(Casas) :-	
    length(Casas, 5),                                                       %  1. Existem cinco casas.
	pessoa(informacoes(ingles,_,_,_,red), Casas),                                       %  2. O Inglês vive na casa vermelha.
	pessoa(informacoes(espanhol,cachorro,_,_,_), Casas),                                %  3. O Espanhol tem um cachorro.
	pessoa(informacoes(_,_,_,cafe,verde), Casas),                                       %  4. Café é a bebida da casa verde.
	pessoa(informacoes(ucraniano,_,_,cha,_), Casas),                                    %  5. O Ucraniano bebe chá.
	proximidade(informacoes(_,_,_,_,marfim),informacoes(_,_,_,_,verde), Casas),        %  6. A casa verde está à direita da casa marfim.
	pessoa(informacoes(_,caramujos, oldGold,_,_), Casas),                               %  7. O fumante de Old Gold tem caramujos de estimação.
	pessoa(informacoes(_,_,kools,_,amarelo), Casas),                                    %  8. Cigarros Kools são consumidos na casa amarela.
	Casas = [_,_,informacoes(_,_,_,leite,_),_,_],                                       %  9. Leite é a bebida da casa do meio.
	Casas = [informacoes(noruegues,_,_,_,_)|_],                                         % 10. O norueguês vive na primeira casa.
	proximidade(informacoes(_,raposa,_,_,_), informacoes(_,_,chesterfield,_,_), Casas), % 11. O homem que fuma Chesterfields vive na casa vizinha do homem que tem uma raposa.
	proximidade(informacoes(_,_,kool,_,_), informacoes(_,cavalo,_,_,_), Casas),         % 12. Kools  é o cigarro da casa vizinha à casa onde existe um cavalo.
	pessoa(informacoes(_,_,luckyStrike,sucoDeLaranja,_), Casas),                        % 13. O fumante de Lucky Strike bebe suco de laranja.
	pessoa(informacoes(japones,_,parliaments,_,_), Casas),                              % 14. O Japonês fuma Parliaments.
	proximidade(informacoes(noruegues,_,_,_,_), informacoes(_,_,_,_,azul), Casas),      % 15. O Norueguês é vizinho da casa azul.
	pessoa(informacoes(_,_,_,agua,_), Casas),		                                    % Quem bebe água?
	pessoa(informacoes(_,zebra,_,_,_), Casas).		                                    % Quem é o dono da zebra?

proximidade(A, B, C) :- append(_, [A,B|_], C).
proximidade(A, B, C) :- append(_, [B,A|_], C).