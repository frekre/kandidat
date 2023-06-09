function [mean_energy_1, mean_energy_2, z1, y1, x1, z2, y2, x2] = eeganalysis(data, channels1, channels2, trialside, trialnum, filterfrequency, lambda, FFTL, downsample )
%Plots channels and spectograms of filtered and downsampled signals and
%returns the mean energy of the maximum peak in each side.
%[mean_energy_1, mean_energy_2, z1, y1, x1, z2, y2, x2] = eeganalysis(data, channels1, channels2, trialside, trialnum, filterfrequency, lambda, FFTL, downsample )
%
%data: input data from a data subject.
%channels1: vector of the numbers for the channels on the left (1) side
%channels2: vector of the numbers for the channels on the right (2) side
%trialside: the side in which the trial was conducted on, left or right (1
%or2)
%trialnum: is the number of the trial that you would like to analyse
%filterfrequency: highpass frequency in hertz.
%lambda: Gaussian window parameter
%FFTL: signal length
%downsample: parameter for downsampling signals.

%kollar inputs:
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
[S1, S2] = findSide1Side2(data); % vektorer innehållande vilka trials som va på sida 1 och vilka som va på sida 2
Stest = S1;
if trialside ==2
    Stest = S2;
end

%-----behandling av data--------------
%medelvärdesbildning av kanaler för en trial samt nedsampling:
side1 = avgDataChannel(data.trial, channels1, Stest(trialnum));
side2 = avgDataChannel(data.trial, channels2, Stest(trialnum));

downsampledside1 = resamplingtrial(side1, 1, downsample);
downsampledside2 = resamplingtrial(side2, 1, downsample);

%----högpass filtrering-----
fs = length(downsampledside1)/9; %hur många sampel per sekund efter nedsampling.
filteredside1 = highpass(downsampledside1, filterfrequency, fs);
filteredside2 = highpass(downsampledside2, filterfrequency, fs);


%------VISUALISERING--------
figure
plot(xvalues, downsampledside1(1,:), 'g')
title('Downsampled signals, left and right side');
xlabel('s');
ylabel('mv');
legend('side 1');
hold on
plot(xvalues, downsampledside2(1,:))
legend('side 1', 'side 2');
hold off

figure
plot(xvalues, filteredside1(1,:), 'g')
title('Downsampled and higpass-filtered signals, left and right');
xlabel('s');
ylabel('mv');
legend('side 1');
hold on
plot(xvalues, filteredside2(1,:))
legend('side 1', 'side 2');
hold off

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
    %Xmat(:,i) = trialdata;
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;

figure
mesh(xvalues, FI, SRS(:,:,1));
title('SRS, left side channels');
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));
title('S, left side channels');
xlabel("Time (s)");
ylabel("Frequency (Hz)")

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
    %Xmat(:,i) = trialdata;
end

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Xmat(:,i),lambda,FFTL);
end

TI=TI/fs;
FI=FI*fs;

figure
mesh(xvalues, FI, SRS(:,:,1));
title('SRS, right side channels');
xlabel("Time (s)");
ylabel("Frequency (Hz)")
figure
mesh(xvalues, FI, S(:,:,1));
title('S, right side channels');
xlabel("Time (s)");
ylabel("Frequency (Hz)")

%---------energi och max sida 2------------
mean_energy_2 = avg_energy(S, dt, df, NN);
[z2, y2, x2] = findmax(S, xvalues, FI);

end

