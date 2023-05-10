function [vS, hS, vSRS, hSRS] = eegstat(data, channels1, channels2, trialside, filterfrequency, lambda, FFTL, downsample )
% EEGSTAT beräknar energinivå och koordinat för maxpunkt i varje valt trial
% (sida 1 eller 2) för channels1 och channels2, och returnerar dessa i fyra
% matriser

%-----behandlar antalet parametrar-----
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


%----ger Stest rätt trials utifrån den sida vald i parametrarna----
Stest = S1;
if trialside == 2
    Stest = S2;
end

NN = length(Stest); % Number of realizations.

%--------Skapar S och SRS-----

N=round(4501/downsample); % Signal length
fs = round((4501/8)/9); %hur många sampel per sekund efter nedsampling.

Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);

[df, dt] = findsigma(lambda, FFTL); %hitta df dt
xvalues = -2:(9/(N-1)):7; % få x-axel i rätt sekunder

vS = zeros(NN,4); %S-resultat för sida 1 sparas här, returneras i slutet
hS = zeros(NN,4); %S-resultat för sida 2
vSRS = zeros(NN,4); %SRS-resultat för sida 1 sparas här, returneras i slutet
hSRS = zeros(NN,4); %SRS-resultat för sida 2

%---------för channel 1:-----------------

for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels1, Stest(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, filterfrequency, fs);

end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;

%------lagrar resultat i matriser-----
for i = 1:NN
    [z1, y1, x1] = findmax(S(:,:,i), TI, FI);
    
    vS(i,1) = z1;
    vS(i,2) = y1;
    vS(i,3) = x1;
    vS(i,4) = energy_of_square(S(:,:,i), dt, df, 1, vS(i,3), vS(i,2));
    
    
    [z2, y2, x2] = findmax(SRS(:,:,i), TI, FI);
    vSRS(i,1) = z2;
    vSRS(i,2) = y2;
    vSRS(i,3) = x2;
    vSRS(i,4) = energy_of_square(SRS(:,:,i), dt, df, 1, vSRS(i,3), vSRS(i,2));
end


%--------för channel 2:--------- 

for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels2, Stest(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, filterfrequency, fs);
end


for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;
%------lagrar resultat i matriser-----
for i = 1:NN
    
    [z3, y3, x3] = findmax(S(:,:,i), TI, FI);
    hS(i,1) = z3;
    hS(i,2) = y3;
    hS(i,3) = x3;
    hS(i,4) = energy_of_square(S(:,:,i), dt, df, 1, hS(i,3), hS(i,2));
    
    [z4, y4, x4] = findmax(SRS(:,:,i), TI, FI);
    hSRS(i,1) = z4;
    hSRS(i,2) = y4;
    hSRS(i,3) = x4;
    hSRS(i,4) = energy_of_square(SRS(:,:,i), dt, df, 1, hSRS(i,3), hSRS(i,2));
end
