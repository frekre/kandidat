function [mean_energy_1, mean_energy_2, z1, y1, x1, z2, y2, x2] = eegstat(data, channels1, channels2, trialside, trialnum, filterfrequency, lambda, FFTL, downsample)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if nargin<1
    'Error: No data input';
end
if nargin<9
    downsample=8;
end
if nargin<8
    FFTL=1024;
end
if nargin<7
    lambda=8;
end

if nargin<6
    filterfrequency=2;
end
if nargin<5
    trialnum=1;
end
if nargin<4
    trialside=1;
end

xvalues = -2:(9/562):7; % få x-axel i rätt sekunder 

%------hitta s1 och s2 -------
[S1, S2] = findS1S2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2
Stest = S1;
if trialside ==2
     Stest = S2;
end  

%-----behandling av data--------------
%medelvärdesbildning av kanaler för en trial samt nedsampling: 
side = avgDataChannel(data.trial, channels1, Stest(trialnum)); 

downsampled = resamplingtrial(side, 1, downsample);

%----högpass filtrering-----
fs = length(downsampled)/9; %hur många sampel per sekund efter nedsampling.

%--------S och SRS------

NN=length(Stest); % Number of realizations.
N=round(4501/downsample); % Signal length

Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);
 
%-------FILTRERAD S OCH SRS, sida 1: -------
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels1, Stest(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, filterfrequency, fs);
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;

%----energi och max sida 1-------
%i det här fallet så hittar funktionen ett lokalt max på egen hand och
%summerar kring +-dt och +-df
[df, dt] = findsigma(lambda, FFTL);
mean_energy_1 = avg_energy(S, dt, df, NN);
[z1, y1, x1] = findmax(S, xvalues, FI);

%------FILTRERAD S OCH SRS sida 2: ---------
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels2, Stest(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, filterfrequency, fs);
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;

%---------energi och max sida 2------------
mean_energy_2 = avg_energy(S, dt, df, NN);
[z2, y2, x2] = findmax(S, xvalues, FI);
end

