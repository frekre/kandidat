function [] = resultdrawer(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, title)

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
legend('Channel 1', 'Channel 1 kernel', 'Channel 2', 'Channel 2 kernel');
subtitle('1-trial, S');
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
legend('Channel 1', 'Channel 1 kernel', 'Channel 2', 'Channel 2 kernel');
subtitle('2-trial och S');
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
legend('Channel 1', 'Channel 1 kernel', 'Channel 2', 'Channel 2 kernel');
subtitle('1-trial och SRS');
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
legend('Channel 1', 'Channel 1 kernel', 'Channel 2', 'Channel 2 kernel');
subtitle('2-trial och SRS');
hold off
sgtitle(title);
end

