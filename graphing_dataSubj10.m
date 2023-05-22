%sample frequency 500 hz
xvalues = -2:0.002:7; %skapa x-värden

%medelvärdesbilda alla trials för en kanal:
sumtrials = zeros(60,4501);
sumtrials(1 , :) = data.trial{1,1}(1 , :);

figure;
plot(xvalues, sumtrials(1, :));
title('ej medelvärdesbildad');  % bara för att...

for channel = 1:60
    
    for ind = 2: 352
        sumtrials(channel, :) = sumtrials(channel, :) + data.trial{1,ind}(channel , :);
        
    end
    
end
averagedres = sumtrials./352;

figure;
plot(xvalues, averagedres(1, :), 'g');
title('Medelvärde av trials för två kanaler');
xlabel('s');
ylabel('mv');
hold on
plot(xvalues, averagedres(54, :), 'r');
hold off

beta = avgDataChannel(data.trial, [1,3,4]);

sumchannels = zeros(1,4501);

for i = 1:60
    sumchannels = sumchannels + sumtrials(i, :)./21120;
end

figure;
plot(xvalues, sumchannels, 'b');
title('Summan av medelvärdet för alla kanaler för alla trials');
xlabel('s');
ylabel('mv');
