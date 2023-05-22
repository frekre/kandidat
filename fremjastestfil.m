
close all
clear all
rng('default') % For reproducibility

% NN should be 100-1000 in your final simulations, but start with a smaller number!

NN=220; % Number of realizations.
SNR=9; % SNR (signal to noise ration)-level in dB, defined as average signal powers to noise variance
DA=1; % Rayleigh distribution parameter for amplitude variation

% Setup
Fs=125;

N=512; % Signal length
FFTL=512; % FFT-length
lambda=8; % Parameter of the spectrogram window and scaled reassigned spectrogram

% Parameters for a 1-component signal. The component located at t=120 and f=120/FFTL is the important signal to be detected.
% Several components can also be simulated. Then use vectors, e.g. Tvect=[50 120 180].

Cvect=[8]; % Gaussian component parameter.
Avect=[1]+DA*random('Rayleigh',1,NN,1); % Rayleigh distribution giving a stochastic amplitude.
Tvect=[120];  % Fixed time-point of the component.
Fvect=[80]/FFTL; % Fixed frequency value.
% The time- and frequency location is fixed for easier evaluation.
% In an application these parameters are probably varying, but the positions are estimated.

Xmat=zeros(N,NN);
S=zeros(FFTL/2,N,NN);
SRS=zeros(FFTL/2,N,NN);


% Simulated signals

for i=1:NN
    [Xmat(:,i),T] = gaussdata(N,Tvect,Fvect,Avect(i,:),Cvect);
end

Xmat=real(Xmat); % Real-valued signals without noise

% Calculation of noise standard deviation

ASP=(mean(sum(Xmat(:,:).^2))); % Average Signal Power
stdwn=ASP*10.^(-SNR/10); % SNR=10*log10((ASP)/(stdwn^2));
wnoise=stdwn*randn(N,NN); % Gaussian white noise matrices with variance stdwn^2

% Signal+disturbance simulation

Ymat=Xmat +wnoise ; %lägg till wnoise för att få brus

% Scaled reassigned spectrograms and spectrograms using a Gaussian window with parameter lambda

for i=1:NN
    [SRS(:,:,i),S(:,:,i),TI,FI] = screassignspectrogram(Ymat(:,i),lambda,FFTL);
end

TI=TI/Fs;
FI=FI*Fs;

%------VISUALISERING-------
figure
mesh(TI, FI, SRS(:,:,1));
xlabel('time')
ylabel('frequency')
zlabel('energy')

figure
mesh(TI, FI, S(:,:,1))
xlabel('time')
ylabel('frequency')
zlabel('energy')

%-------HITTA MAX i Z------
Z= SRS(:,:,1);
Zmax = max(Z(:));

[Zmax,Idx] = max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

x_cord = TI(ZmaxCol);
y_cord =FI(ZmaxRow);

%----TESTAR FUNKTIONER FÖR ATT GÖRA EN RUTA OCH SUMMERAZ-LED------
[ztest, ytest, xtes] = findmax(SRS, TI, FI); %ANVÄNDS EJ I ENERGISÖK

%hitta standardavvikelse för frekvens och tid för att täck in 99 procent.
[df, dt] = findsigma(lambda, FFTL);

%-----testar funktioner----
[x, y] = findcord(SRS, 5);
TestA = SRS(x-2:x+2, y-2:y+2, 1);

%---HITTA ENERGI-----
energy = energy_of_square(SRS, dt, df, 1)
mean_energy = avg_energy(SRS, dt, df, NN)
%%
testenergy = avg_energy(S, dt, df, NN, 2, 20)

%[indexlow, indexhigh, df] = freqtoindex(y_cord, FI, 0.1);

%[x,y]=findcord(SRS)

%life hacks:
%skriv format long (return) och sen variabeln  i konsolen för att få alla decimaler
%plot(S)
