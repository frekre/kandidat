function [] = resultmaker(data, channel1, channel2)
%RESULTMAKER plots the result for S and SRS of both left and right side 
% of subject and chosen channels 
% data: subject
%channel1: cell vector of chosen channels for side 1
%channel2: cell vector of chosen channels for side 2

channels1 = findChannels(data, channel1);
channels2 = findChannels(data, channel2);


filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS1, hS1, vSRS1, hSRS1, Sdiff1, SRSdiff1, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);
trialside = 2;
[vS2, hS2, vSRS2, hSRS2, Sdiff2, SRSdiff2, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);

%anpassa själv?
axparam = [0 8*10^6 0 20];

figure 
subplot(2,2,1)
h1= histfit(vS1(:,4), 70, 'kernel');
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hS1(:,4), 70, 'kernel');
axis(axparam)
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 1 trial och S');
hold off

subplot(2,2,2)
h1= histfit(vS2(:,4), 70, 'kernel');
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hS2(:,4), 70, 'kernel');
axis(axparam)
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 2 trial och S');
hold off

subplot(2,2,3)
h1= histfit(vSRS1(:,4), 70, 'kernel');
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hSRS1(:,4), 70, 'kernel');
axis(axparam)
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 1 trial och SRS');
hold off

subplot(2,2,4)
h1= histfit(vSRS2(:,4), 70, 'kernel');
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
hold on
h2 = histfit(hSRS2(:,4), 70, 'kernel');
axis(axparam)
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('vänster', 'vänster kernel', 'höger', 'höger kernel');
subtitle('sida 2 trial och SRS');
hold off
sgtitle("Subjekt 13");
% Get the axis limits of the largest plot
largestAxis = max([subplot(2, 2, 1), subplot(2, 2, 2), subplot(2, 2, 3), subplot(2, 2, 4)]);

% Set the axis limits of all subplots
axis(largestAxis, 'manual');

end

