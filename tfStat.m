function [] = tfStat(S1, S2, SRS1,SRS2)
%TFSTAT 


figure 
subplot(2,2,1)
h1 = histfit(S1(:,2));
hold on
h2 = histfit(SRS1(:,2));
xlabel('Hertz');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
title('Frequency at max, 1-trial');
hold off

subplot(2,2,2)
h1 = histfit(S1(:,3));
hold on
h2 = histfit(SRS1(:,3));
xlabel('sek');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
title('Time at max, 1-trial');
hold off

subplot(2,2,3)
h1 = histfit(S2(:,2));
hold on
h2 = histfit(SRS2(:,2));
xlabel('Hertz');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
title('Frequency at max, 2-trial');
hold off

subplot(2,2,4)
h1 = histfit(S2(:,3));
hold on
h2 = histfit(SRS2(:,3));
xlabel('sek');
ylabel('occurence');
h1(1).FaceColor = 'c';
h1(2).Color = 'b';
h1(1).FaceAlpha = 0.7;
h2(1).FaceColor = 'm';
h2(2).Color = 'r';
h2(1).FaceAlpha = 0.7;
title('Time at max, 2-trial');
hold off
sgtitle('Frequency and time distribution');




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

