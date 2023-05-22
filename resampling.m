
%ange kanal, samplar ner för kanal för alla trials.
% channel = 1; %1-60
%
% sumtrials = zeros(60,4501);
% sumtrials(1 , :) = data.trial{1,1}(1 , :);
%
% for channel = 1:60
%
%     for ind = 2: 352
%      sumtrials(channel, :) = sumtrials(channel, :) + data.trial{1,ind}(channel , :);
%
%     end
%
% end
% averagedres = sumtrials./352;
%
% y = resample(averagedres(channel,:), 1 , 4)

%resamplar spec kanal för en viss data-subject, med faktor p/q


y = resamplingalltrials(data.trial, 1, 4, 1, 4);
xvalues = -2:0.002*4:7;
plotEEG(xvalues, y, 'Kanaler 1-4')


% xvalues = -2:0.002*4:7;
% figure
% plot(xvalues, y)
%

