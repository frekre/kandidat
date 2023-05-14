%testfil för att testa att summera data från neurofilerna. 
load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%-----inputs to test:--------
downsample = 8; 
xvalues = -2:(9/562):7; % få x-axel i sekunder 

%------hitta s1 och s2 och ch1 ch2 -------
[S1, S2] = findS1S2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2

channels1 = findChannels(data, {'C3'});
channels2 = findChannels(data, {'C4'});

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
title('Kanal från sida 1 och 2 under ett 1-trial');
xlabel('s');
ylabel('mv');
legend('kanal 1');
hold on
plot(xvalues, downsampledside2(1,:))
legend('kanal 1', 'kanal 2');
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
 
N=round(4501/downsample); % Signal length
FFTL=1024; % FFT-length
lambda=8; % Parameter of the spectrogram window and scaled reassigned spectrogram, påverkar fönsterlängden och dörmed upplösning i tid och frekvens. 
 
Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);
 
%FILTRERAD S OCH SRS: 
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels2, S1(i)), 1, downsample);
    Xmat(:,i) = highpass(trialdata, 2, fs);
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;
 
figure
mesh(xvalues, FI, SRS(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)");
zlabel("Energy (PSD)");
title("Example of Scaled Reassigned Spectrogram");
figure
mesh(xvalues, FI, S(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)");
zlabel("Energy (PSD)");
title("Example of spectrogram");

[zL, yL, xL] = findmax(SRS, TI, FI)
[zz, yy, xx] = findmax(SRS, xvalues, FI)

[df, dt] = findsigma(lambda, FFTL);

% for i = 1:NN
% %     hS(i, :) = findmax(S(:,:,i), TI, FI);
% %     hSRS(i,:) = findmax(SRS(:,:,i), TI, FI);
% %     hS(i,4) = energy_of_square(S(:,:,i), dt, df, 1, hS(i,3), hS(i,2));
% %     hSRS(i,4) = energy_of_square(SRS(:,:,i), dt, df, 1, hSRS(i,3), hSRS(i,2));
%     
%     [z3, y3, x3] = findmax(S(:,:,i), TI, FI);
%     testhS(i,1) = z3;
%     testhS(i,2) = y3;
%     testhS(i,3) = x3;
%     testhS(i,4) = energy_of_square(S(:,:,i), dt, df, 1, testhS(i,3), testhS(i,2));
%     
%     [z4, y4, x4] = findmax(SRS(:,:,i), TI, FI);
%     testhSRS(i,1) = z4;
%     testhSRS(i,2) = y4;
%     testhSRS(i,3) = x4;
%     testhSRS(i,4) = energy_of_square(SRS(:,:,i), dt, df, 1, testhSRS(i,3), testhSRS(i,2));
% end


%%
%OFILTRERAD
for i=1:NN
    trialdata = resamplingtrial(avgDataChannel(data.trial, channels1, S1(i)), 1, downsample);
    Xmat(:,i) = trialdata;
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;
 
figure
mesh(xvalues, FI, SRS(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));
xlabel("Time (s)");
ylabel("Frequency (Hz)")



%% Baslinje
%testar baselinie correction
trial = 1; 
channel = 2; 
xvalues = -2:(9/562):7;

%icke baslinecorrectad för jämförelse: 
signal = data.trial{1, trial}(channel, :);
%baselinecorrected: 
[signaltest, sum] = baselinecorrection(data, channel, trial);

%sampla ned båda
downsampledandbaselincorrectedsignal = resamplingtrial(signaltest, 1, 8);
downsampledchannel = resamplingtrial(signal, 1, 8);

%jämför visuellt: 
figure 
plot(xvalues, downsampledandbaselincorrectedsignal, 'g');
legend('baslinje-anpassad');
hold on
plot(xvalues, downsampledchannel, 'r');
legend('baslinje-anpassad', 'icke baslinje-anpassad');

%%
%----------TESTA FÖNSTER-----------
% lambda = 12;
% M=round(lambda*4);  
% H=exp(-0.5*([-M:M+1]'/lambda).^2);
% plot(H)

%---------HITTA ENRGI------------
%i det här fallet så hittar funktionen ett lokalt max på egen hand och
%summerar kring +-dt och +-df
% [df, dt] = findsigma(lambda, FFTL);
% mean_energy = avg_energy(S, dt, df, NN);
%% testa fieldtrip
%latency i data.cfg har vi lagt till själv för at specificera tid.
%
% test1 = cell(1, 352);  % Create a cell vector of size 352
% test1{1} = 1; 
% 
% for i = 2:352 
%     test1{i} = 0;
%     
% end

data.cfg.trials = 1:10;

%%
figure
ft_topoplotER(data.cfg, ft_timelockanalysis(data.cfg, data));
%title('Vid stimuli från höger öra')









