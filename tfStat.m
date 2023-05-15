function [] = tfStat(S1, S2, SRS1,SRS2, heading)
%TFSTAT draws histograms of the time and frequency distribution of the .
%max values from the diff-spectrogram. 
%S1: spectrogram trial 1
%SRS1: SRS trial 1
%S2: spectrogram trial 2
%SRS2: SRS trial 2

figure 
subplot(2,2,1)
h1 = histfit(S1(:,2), 10);
axis([-10 20 0 40]);
hold on
h2 = histfit(SRS1(:,2), 10);
axis([-10 20 0 40]);
xlabel('Hertz');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('S', 'S-dist', 'SRS', 'SRS-dist');
title('Frequency at max 1-trial');
hold off

subplot(2,2,3)
h1 = histfit(S1(:,3), 10);
axis([-1 3 0 40]);
hold on
h2 = histfit(SRS1(:,3),10);
axis([-1 3 0 40]);
xlabel('sek');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('S', 'S-dist', 'SRS', 'SRS-dist');
title('Time at max, 1-trial');
hold off

subplot(2,2,2)
h1 = histfit(S2(:,2), 10);
axis([-10 20 0 40]);
hold on
h2 = histfit(SRS2(:,2), 10);
axis([-10 20 0 40]);
xlabel('Hertz');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('S', 'S-dist', 'SRS', 'SRS-dist');
title('Frequency at max, 2-trial');
hold off

subplot(2,2,4)
h1 = histfit(S2(:,3), 10);
axis([-1 3 0 40]);
hold on
h2 = histfit(SRS2(:,3), 10);
axis([-1 3 0 40]);
xlabel('sek');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
legend('S', 'S-dist', 'SRS', 'SRS-dist');
title('Time at max, 2-trial');
hold off
sgtitle(heading);




% %------trial 1-------
% %frequency
% meanfqS1 = mean(S1(:,2));
% meanfqSRS1 = mean(SRS1(:,2));
% stdfqS1 = std(S1(:,2));
% stdfqSRS1 = std(SRS1(:,2));
% 
% %time
% meantS1 = mean(S1(:,3));
% meantSRS1 = mean(SRS1(:,3));
% stdtS1 = std(S1(:,3));
% stdtSRS1 = std(SRS1(:,3));
 

% %--------trial 2-------
% %frequency
% meanfqS2 = mean(S2(:,2));
% meanfqSRS2 = mean(SRS2(:,2));
% stdfqS2 = std(S2(:,2));
% stdfqSRS2 = std(SRS2(:,2));
% 
% %time
% meantS2 = mean(S2(:,3));
% meantSRS2 = mean(SRS2(:,3));
% stdtS2 = std(S2(:,3));
% stdtSRS2 = std(SRS2(:,3));

end

