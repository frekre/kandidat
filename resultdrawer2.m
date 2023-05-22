function [] = resultdrawer2(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, title)
% Ritar med histogram!

bw = 20000;

figure
subplot(2,2,1)
h1 = histogram(vS1(:,4));
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bw;
hold on
h2 = histogram(hS1(:,4));
axis(axparam)
h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bw;
legend('ch1-S1', 'ch2-S1');
subtitle('S1 (Metod S, Sida 1)');
hold off

subplot(2,2,2)
h1 = histogram(vS2(:,4));
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bw;
hold on
h2 = histogram(hS2(:,4));
axis(axparam)
h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bw;
legend('ch1-S2', 'ch2-S2');
subtitle('S2 (Metod S, Sida 2)');
hold off

subplot(2,2,3)
h1 = histogram(vSRS1(:,4));
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bw;
hold on
h2 = histogram(hSRS1(:,4));
axis(axparam)
h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bw;
legend('ch1-SRS1', 'ch2-SRS1');
subtitle('SRS1 (Metod SRS, Sida 1)');
hold off

subplot(2,2,4)
h1 = histogram(vSRS2(:,4));
axis(axparam)
xlabel('energy');
ylabel('occurence');
h1.FaceColor = 'c';
h1.FaceAlpha = 0.7;
h1.BinWidth = bw;
hold on
h2 = histogram(hSRS2(:,4));
axis(axparam)
h2.FaceColor = 'm';
h2.FaceAlpha = 0.7;
h2.BinWidth = bw;
legend('ch1-SRS2', 'ch2-SRS2');
subtitle('SRS2 (Metod SRS, Sida 2)');
hold off
sgtitle(title);
end

