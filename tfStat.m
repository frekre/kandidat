function [] = tfStat(S1, S2, SRS1,SRS2, heading)
%TFSTAT draws histograms of the time and frequency distribution of the .
%max values from the diff-spectrogram. 
%S1: spectrogram trial 1
%SRS1: SRS trial 1
%S2: spectrogram trial 2
%SRS2: SRS trial 2

bwf = 1; 
bwt = 0.12;

figure 
subplot(2,2,1)
h1 = histogram(S1(:,2));
axis([0 30 0 50]);
hold on
h2 = histogram(SRS1(:,2));
axis([0 30 0 50]);
xlabel('Hertz');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bwf;

h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bwf;

legend('S', 'SRS');
title('Frequency at max, Side 1');
hold off

subplot(2,2,3)
h1 = histogram(S1(:,3));
axis([0 2.75 0 40]);
hold on
h2 = histogram(SRS1(:,3));
axis([0 2.75 0 40]);
xlabel('sek');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bwt;

h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bwt;
legend('S', 'SRS');
title('Time at max, Side 1');
hold off

subplot(2,2,2)
h1 = histogram(S2(:,2));
axis([0 30 0 50]);
hold on
h2 = histogram(SRS2(:,2));
axis([0 30 0 50]);
xlabel('Hertz');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bwf;

h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bwf;
legend('S', 'SRS');
title('Frequency at max, Side 2');
hold off

subplot(2,2,4)
h1 = histogram(S2(:,3));
axis([0 2.75 0 40]);
hold on
h2 = histogram(SRS2(:,3));
axis([-0 2.75 0 40]);
xlabel('sek');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bwt;

h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bwt;
legend('S', 'SRS');
title('Time at max, Side 2');
hold off
sgtitle(heading);




end

