%testfil för att testa att summera data från neurofilerna. 
load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%testing function from sim on neuro
% testspec=data.trial{1,1};
% [x, y, zmax] = findcord(testspec, 1)

%-----inputs to test:--------
%trial = 1; 
downsample = 8; 
%channelvector = [18, 19, 27]; %skapas av findChannels
xvalues = -2:(9/562):7; % få x-axel i sekunder 

%------hitta s1 och s2 och ch1 ch2 -------
[S1, S2] = findS1S2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2

channels1 = findChannels(data, {'FT7', 'FC5', 'T7', 'C5', 'TP7', 'CP5'});
channels2 = findChannels(data, {'FC6', 'FT8', 'C6', 'T8', 'CP6', 'TP8'});

%-----behandling av data--------------
%medelvärdesbildning av kanaler för en trial samt nedsampling: 

alpha = avgDataChannel(data.trial, channels1, S1(1)); 
beta = avgDataChannel(data.trial, channels2, S1(1));

downsampledalpha = resamplingtrial(alpha, 1, downsample);
downsampledbeta = resamplingtrial(beta, 1, downsample);

%------VISUALISERING--------
figure 
plot(xvalues, downsampledalpha(1,:), 'g')
title('Sida 1 och 2 under ett 1-trial');
xlabel('s');
ylabel('mv');
legend('sida 1');
hold on
plot(xvalues, downsampledbeta(1,:))
legend('sida1', 'sida2');
hold off


%figure 
%mesh(testspec);


%-------JOSSES KOD-------
[S1, S2] = findS1S2(data);
downsample = 8;
trialno = length(S1); %eller S2
 
channel = 59;
 
NN=trialno; % Number of realizations.
Fs = 500/downsample; 
 
N=round(4501/downsample); % Signal length
FFTL=1024; % FFT-length
lambda=8; % Parameter of the spectrogram window and scaled reassigned spectrogram
 
 
Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);
 
for i=1:NN
    trial_data = resamplingtrial(data.trial{S1(i)}(channel,:), 1, downsample); % eller S2(i)
    Xmat(:,i) = trial_data;
end
 
 
% Scaled reassigned spectrograms and spectrograms using a Gaussian window with parameter lambda
 
for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end
 
TI=TI/Fs;
FI=FI*Fs;
 
% (obs tillägg) 
% Visualisering
 
figure
mesh(xvalues, FI, SRS(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));

