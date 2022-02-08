%% Fun��o utilizada para gerar os dados truth para simula��es 
%devemos passar para esta fun��o:
%N_amostras= n�mero de amostras � serem geradas
%p_luminos= porcentagem de luminosidade
% retorna os pulsos sorteados e um vetor com a posi��o de cada pulso

function [S_truth,posicao] = simdistuni(N_amostras,p_luminos,amplitude_max)
%% gerando o sinal truth
p_luminos = p_luminos/100;                                        % fa�o o calculo da porcentagem da luminosidade
S_truth   = zeros(1,N_amostras);                                  % crio um vetor de zeros para receber os impulsos de amplitudes sorteadas 
posicao   = randperm(N_amostras,ceil(length(S_truth)*p_luminos)); % sorteio a posi��o das amostras "OBS:REQUER UM MINIMO DE UM PULSO por conta do rand "
amp_aleatoria = amplitude_max*rand(length(posicao),1);            % sorteio a amplitude na distribui��o uniforme

% amp_aleatoria = exprnd(media_exp,length(posicao),1);            % sorteio a amplitude na distribui��o exponencial 
% amp_distr_exp_aleatoria=ones(1,length(posicao));                % coloco a amplitude dos impulsos tudo 1

    for i = 1:length(posicao)
         S_truth(posicao(i)) = amp_aleatoria(i);
    end

end