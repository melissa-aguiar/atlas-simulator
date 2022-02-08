clear, close

amp    = 1023;  %Amplitude m�xima
med    = 30;    %M�dia da distribui��o exponencial
ocp    = 30;    %Ocupa��o do sinal
rdo    = 1;     %Desvio padr�o do ru�do em ADC counts
fas    = 0;     %Desvio de fase do sinal
Ntrn   = 3.5e3; %Quantidade de amostras de treino
Ntst   = 3.5e3; %    || ... teste

for ocp = 10:5:90
    
    [eng,pos] = simdistuni(Ntrn,ocp,amp);
    [snl,eng] = conv_desvio(eng,0,pos);
    snl       = snl + randn(rdo,length(snl));
    save(['uniformdist_train_' num2str(ocp)],...
        'eng','snl');
end

for ocp = 10:5:90
    
    [eng,pos] = simdistexp(Ntst,ocp,med);
    [snl,eng] = conv_desvio(eng,0,pos);
    snl       = snl + randn(rdo,length(snl));
    save(['exponencialdist_test_' num2str(ocp)],...
        'eng','snl');
end

