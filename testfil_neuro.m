%testfil för att testa att summera data från neurofilerna. 
load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%-----inputs to test:--------
downsample = 8; 
xvalues = -2:(9/562):7; % få x-axel i sekunder 

%------hitta s1 och s2 och ch1 ch2 -------
[S1, S2] = findS1S2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2

channels1 = findChannels(data, {'FT7', 'FC5', 'T7', 'C5', 'TP7', 'CP5'});
channels2 = findChannels(data, {'FC6', 'FT8', 'C6', 'T8', 'CP6', 'TP8'});

%-----behandling av data--------------

%medelvärdesbildning av kanaler för en trial samt nedsampling: 
side1 = avgDataChannel(data.trial, channels1, S1(1)); 
side2 = avgDataChannel(data.trial, channels2, S1(1));

downsampledside1 = resamplingtrial(side1, 1, downsample);
downsampledside2 = resamplingtrial(side2, 1, downsample);

%högpass filtrering 2 hertz (?)
fs = length(downsampledside1)/9; %hur många sampel per sekund efter nedsampling.
filteredside1 = highpass(downsampledside1, 2, fs);
filteredside2 = highpass(downsampledside2, 2, fs);


%------VISUALISERING--------
figure 
plot(xvalues, downsampledside1(1,:), 'g')
title('Sida 1 och 2 under ett 1-trial');
xlabel('s');
ylabel('mv');
legend('sida 1');
hold on
plot(xvalues, downsampledside2(1,:))
legend('sida1', 'sida2');
hold off

figure 
plot(xvalues, filteredside1(1,:), 'g')
title('Samma fast högpasssfiltrerade signaler');
xlabel('s');
ylabel('mv');
legend('sida 1');
hold on
plot(xvalues, filteredside2(1,:))
legend('sida1', 'sida2');
hold off

%--------S och SRS------

NN=length(S1); % Number of realizations.
Fs = fs; %kolla! sampel/sek
 
N=round(4501/downsample); % Signal length
FFTL=1024; % FFT-length
lambda=8; % Parameter of the spectrogram window and scaled reassigned spectrogram
 
Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);
 
%FILTRERAD S OCH SRS: 
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels1, S1(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, 2, fs);
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/Fs;
FI=FI*Fs;
 
figure
mesh(xvalues, FI, SRS(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")

%OFILTRERAD
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels1, S1(i)), 1, downsample);
    Xmat(:,i) = trialdata;
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/Fs;
FI=FI*Fs;
 
figure
mesh(xvalues, FI, SRS(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")

%mean_energy = avg_energy(S, NN); hur hitta dt df? innan använde vi lambda
%och K hur gör vi nu? antal sekunder * sampelfrekvens?
%ska vi göra testfilen till en stor function med data och kanal
%inmatningar? 
%



