%Program för statistik: 

%close all
%clear all

%load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%CHANNELS from left and right side:
channels1 = findChannels(data, {'C3'});
channels2 = findChannels(data, {'C4'});

filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS1, hS1, vSRS1, hSRS1, Sdiff1, SRSdiff1, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);
trialside = 2;
[vS2, hS2, vSRS2, hSRS2, Sdiff2, SRSdiff2, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);
%-------statistiska värden-----------
% %vänster kanaler från sida 1
% vSmean = mean(vS(:,1))
% vSstd = std(vS(:,1))
% vSRSmean = mean(vSRS(:,1))
% vSRSstd = std(vSRS(:,1))

% figure
% normplot(vS(:,1));

% %höger kanaler från sida 2
% hSmean = mean(hS(:,1));
% hSstd = std(hS(:,1));
% hSRSmean = mean(hSRS(:,1));
% hSRSstd = std(hSRS(:,1));
% 
% %energi i rutor: 
% 
% %vänster kanaler från sida 1
% vSmeansq = mean(vS(:,4));
% vSstdsq = std(vS(:,4));
% vSRSmeansq = mean(vSRS(:,4));
% vSRSstdsq = std(vSRS(:,4));
% 
% %höger kanaler från sida 2
% hSmeansq = mean(hS(:,4));
% hSstdsq = std(hS(:,4));
% hSRSmeansq = mean(hSRS(:,4));
% hSRSstdsq = std(hSRS(:,4));

%%
figure
subplot(2,1,1)
normplot(vS(:,2));
subtitle('Normplot av frekvens för max från S')
subplot(2,1,2)
normplot(vSRS(:,2));
subtitle('Normplot av frekvens för max från SRS')
sgtitle('Stimuli i vänster öra, vänstra kanaler')
%% Fyra olika i ett fönster

figure
subplot(2,2,1)
histogram(vS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - vänster')
subplot(2,2,3)
histogram(vSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Normplot av energi i ruta från SRS - vänster')
sgtitle('Stimuli i vänster öra')   

subplot(2,2,2)
histogram(hS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - höger')
subplot(2,2,4)
histogram(hSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från SRS - höger')
%sgtitle('Stimuli i vänster öra, högra kanaler')  
%% höger o vänster i samma S

figure
histogram(vS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - vänster o höger')
% [f1, x1] = ksdensity(vS(:,4));
% hold on
% plot(x,f, 'b')
hold on
histogram(hS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
legend('vänster', 'höger');
%subtitle('Histogram av energi i ruta från S - höger')
hold off
%% höger o vänster i samma SRS

figure
histogram(vSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från SRS - vänster o höger')
%sgtitle('Stimuli i vänster öra')   
hold on
histogram(hSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
legend('vänster', 'höger');
%subtitle('Normplot av energi i ruta från SRS - höger')
hold off

% Set the title
% xlabel('Values')                    % Set the x-axis label
% ylabel('Frequency')                 % Set the y-axis label

%% få in linje i histogram
%mean = mean(vS(:,4));

figure
histogram(vS(:,4), 'NumBins', 70)
axis([0 18*10^5 0 9])
hold on 
[f1, x1] = ksdensity(vS(:,4));
plot(x1,numel(vS(:,4))*f1, 'b')

hold off

%% testar histfit S

figure 
subplot(2,2,1)
h1= histfit(vS1(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hS1(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 1 trial och S');
hold off

subplot(2,2,2)
h1= histfit(vS2(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hS2(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 2 trial och S');
hold off

subplot(2,2,3)
h1= histfit(vSRS1(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hSRS1(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 1 trial och SRS');
hold off

subplot(2,2,4)
h1= histfit(vSRS2(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hSRS2(:,4), 70, 'kernel');
axis([0 2.5*10^6 0 18])
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 2 trial och SRS');
hold off

%%
figure
mesh(TI, FI, Sdiff1(:,:,1));
%%
figure
mesh(TI, FI, vS1(:,:,1));
figure
mesh(TI, FI, hS1(:,:,1));
