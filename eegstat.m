function [res1, res2] = eegstat(data, channels1, channels2, trialside, filterfrequency, lambda, FFTL, downsample )
% EEGSTAT beräknar energinivå och koordinat för maxpunkt i varje valt trial
% (sida 1 eller 2) för channels1 och channels2, och returnerar dessa i två
% matriser
% filterfrequency används inte just nu dock

% Behandlar antalet parametrar
if nargin<1
    'Error: No data input';
end
if nargin<8
    downsample=8;
end
if nargin<7
    FFTL=1024;
end
if nargin<6
    lambda=8;
end

if nargin<5
    filterfrequency=2;
end


%------hitta s1 och s2 -------
[S1, S2] = findS1S2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2

%---- ger Stest rätt trials utifrån den sida vald i parametrarna----
Stest = S1;
if trialside == 2
    Stest = S2;
end

%-----behandling av data--------------


ch1matrix = zeros(length(Stest),563); %skapar två matriser för att spara medelvärdena för alla aktuella trials
ch2matrix = zeros(length(Stest),563); %563 eftersom det blir längden (antal sampel) efter nedsampling

%medelvärdesbildning av kanaler för alla trials i Stest samt nedsampling:

for i = 1:length(Stest)
    
    sidech1 = avgDataChannel(data.trial, channels1, Stest(i));
    sidech2 = avgDataChannel(data.trial, channels2, Stest(i));
    
   
    ch1matrix(i,:) = resamplingtrial(sidech1, 1, downsample);
    ch2matrix(i,:) = resamplingtrial(sidech2, 1, downsample);
    
 
    
end

fs = round((4501/8)/9); %hur många sampel per sekund efter nedsampling.

%--------Skapar S och SRS-----

NN=length(Stest); % Number of realizations.
N=round(4501/downsample); % Signal length

Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);

xvalues = -2:(9/(N-1)):7; % få x-axel i rätt sekunder

res1 = zeros(length(Stest),3); %resultat för sida 1 sparas här, returneras i slutet
res2 = zeros(length(Stest),3); %resultat för sida 2

%-------LOOP--------

for n = 1:2 % loopar två gånger, för båda kanalerna
    
    for j = 1:length(Stest) % kollar på alla aktuella trials
        
        for i=1:NN % fyller i Xmat
            
            if n == 1 % kollar om den är på sida 1 eller 2
                Xmat(:,i) = ch1matrix(j,:);
            else
                Xmat(:,i) = ch2matrix(j,:);
            end
            
            for k = 1:NN % skapar S och SRS
                [SRS(:,:,k),S(:,:,k),TI,FI] = screassignspectrogram(Xmat(:,k),lambda,FFTL);
            end
            
            TI=TI/fs;
            FI=FI*fs;
            
            %[df, dt] = findsigma(lambda, FFTL);
            
            if n == 1
                res1(j,:) = findmax(S, xvalues, FI);
            else
                res2(j,:) = findmax(S, xvalues, FI);
                
            end
        end
    end
end
