/* ----------------------------------------------------------
   Lógica para Engenharia de Computação
   Racha Cuca - Festa junina - muito dificil.
   16/01/2023
   https://rachacuca.com.br/logica/problemas/festa-junina/
   
   Modelo de resposta:
    festa(mae(_,_,_,_,_,_),
     mae(_,_,_,_,_,_),
     mae(_,_,_,_,_,_),
     mae(_,_,_,_,_,_),
     mae(_,_,_,_,_,_)).
     
    Gabriel Henrick Ribeiro De Sousa
    12211ECP010
    ----------------------------------------------------------
   */
   
   
resolve(Sol) :-
    Sol = festa(_,_,_,_,_),
    
    % A mãe que levou Suspiro para a festa nasceu no estado cuja capital é Maceió.
    membro(A,Sol),
    comida(A,suspiro),
    estado(A,alagoas),
    
    % A mãe do garoto mais velho está em algum lugar à direita da mulher do vestido Azul.
    algum_lugar_a_direita(B,C,Sol),
    idade(B,11),
    vestido(C,azul),
    
    % Luiz está na terceira posição.
    terceira(D,Sol),
    filho(D,luiz),
    
    % Luciana está ao lado da mãe de Tales.
    aolado(E,F,Sol),
    nome_mae(E,luciana),
    filho(F,tales),
    
    % A mulher do vestido Verde está exatamente à esquerda da mulher que nasceu na Bahia.
    exatamente_a_esquerda(G,H,Sol),
    vestido(G,verde),
    estado(H,bahia),
    
    % Quem levou Cuscuz está na segunda posição.
    segunda(I,Sol),
    comida(I,cuscuz),
    
    % O filho da Luciana tem 10 anos.
    idade(E,10),
    membro(E,Sol),
    
    % Roberto está exatamente à direita de quem levou Suspiro para a festa.
    exatamente_a_direita(K,L,Sol),
    filho(K,roberto),
    comida(L,suspiro),
    
    % Valentina está exatamente à esquerda de Eduarda.
    exatamente_a_esquerda(N,O,Sol),
    nome_mae(N,valentina),
    nome_mae(O,eduarda),
    
    % A mulher do vestido Azul está ao lado da mãe do filho de 9 anos.
    aolado(P,Q,Sol),
    vestido(P,azul),
    idade(Q,9),
    
    %Quem levou Arroz doce está exatamente à esquerda da mãe que nasceu em Alagoas.
    exatamente_a_esquerda(R,S,Sol),
    comida(R,arrozdoce),
    estado(S,alagoas),
    
    % A mãe do filho de 8 anos está em algum lugar à direita da mulher do vestido Verde.
    algum_lugar_a_direita(T,U,Sol),
    idade(T,8),
    vestido(U,verde),
    
    % A mão de Francisco está exatamente à esquerda da mãe de Luiz.
    exatamente_a_esquerda(V,W,Sol),
    filho(V,francisco),
    filho(W,luiz),
    
    % A mulher do vestido Amarelo está exatamente à esquerda da mãe do filho de 11 anos.
    exatamente_a_esquerda(X,Y,Sol),
    vestido(X,amarelo),
    idade(Y,11),
    
    % Fátima está ao lado da mãe que nasceu em Alagoas.
     aolado(Z,Z1,Sol),
     nome_mae(Z,fatima),
     estado(Z1,alagoas),
     
    % A mulher que nasceu no Ceará está exatamente à esquerda da mulher que nasceu no estado cuja capital é Aracaju.
    exatamente_a_esquerda(Z2,Z3,Sol),
    estado(Z2,ceara),
    estado(Z3,sergipe),
    
    % A mãe de Roberto levou Pamonha para a festa.
    membro(Z4,Sol),
    filho(Z4,roberto),
    comida(Z4,pamonha),
    
    % A mulher do vestido Vermelho está ao lado da mulher que nasceu em Sergipe.
    aolado(Z5,Z6,Sol),
    vestido(Z5,vermelho),
    estado(Z6,sergipe),
    
    % A Valentina está na terceira posição.
    terceira(Z7,Sol),
    nome_mae(Z7,valentina),
    
    % A mãe do José está em algum lugar à direita da mulher do vestido Verde.
    algum_lugar_a_direita(Z8,G,Sol),
    filho(Z8,jose),
    
    %fechamento
    membro(X1,Sol),
    vestido(X1,branco),
    
    membro(X2,Sol),
    nome_mae(X2,maria),
    
    membro(X3,Sol),
    comida(X3,pe_de_moleque),
    
    membro(X4,Sol),
    estado(X4,paraiba),
    
    membro(X5,Sol),
    idade(X5,7).


membro(X,festa(X,_,_,_,_)).
membro(X,festa(_,X,_,_,_)).
membro(X,festa(_,_,X,_,_)).
membro(X,festa(_,_,_,X,_)).
membro(X,festa(_,_,_,_,X)).


segunda(X,festa(_,X,_,_,_)).
terceira(X,festa(_,_,X,_,_)).

vestido(mae(X,_,_,_,_,_),X).
nome_mae(mae(_,X,_,_,_,_),X).
filho(mae(_,_,X,_,_,_),X).
idade(mae(_,_,_,X,_,_),X).
comida(mae(_,_,_,_,X,_),X).
estado(mae(_,_,_,_,_,X),X).

exatamente_a_esquerda(X,Y,festa(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,festa(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,festa(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,festa(_,_,_,X,Y)).
exatamente_a_direita(X,Y,Festa) :-
   exatamente_a_esquerda(Y,X,Festa).


algum_lugar_a_direita(X,Y,festa(Y,X,_,_,_)).
algum_lugar_a_direita(X,Y,festa(Y,_,X,_,_)).
algum_lugar_a_direita(X,Y,festa(Y,_,_,X,_)).
algum_lugar_a_direita(X,Y,festa(Y,_,_,_,X)).
algum_lugar_a_direita(X,Y,festa(_,Y,X,_,_)).
algum_lugar_a_direita(X,Y,festa(_,Y,_,X,_)).
algum_lugar_a_direita(X,Y,festa(_,Y,_,_,X)).
algum_lugar_a_direita(X,Y,festa(_,_,Y,X,_)).
algum_lugar_a_direita(X,Y,festa(_,_,Y,_,X)).
algum_lugar_a_direita(X,Y,festa(_,_,_,Y,X)).


aolado(X,Y,festa(X,Y,_,_,_)).
aolado(X,Y,festa(Y,X,_,_,_)).
aolado(X,Y,festa(_,X,Y,_,_)).
aolado(X,Y,festa(_,Y,X,_,_)).
aolado(X,Y,festa(_,_,X,Y,_)).
aolado(X,Y,festa(_,_,Y,X,_)).
aolado(X,Y,festa(_,_,_,X,Y)).
aolado(X,Y,festa(_,_,_,Y,X)).

