function [indexch, maxchannel] = findEssentialChannels(data, trial, side)
%FINDESSENTIALCHANNELS Finds the channels that express the highest change
%in potential around the expected reaction time.
%data: which subject we collect information from
%trial: which trial we are investogating
%side: which side should be activated by the trial.

channels1 = ['1', '3', '5', '7' ];
channels2 = ['2', '4', '6', '8' ];

%vi testar över ena sidan. på sida 2 så slutar alla kanaler med 2 4 6 8
%sida 1 hara kanaler med 1 3 5 7
half = channels1;

if side ==2
    half = channels2;
end

maxchannel = zeros(1, 4501);
testchannel = zeros(1, 4501);

indexch = 0;

%loopar igenom alla kanaler på angiven side och kollar vilken som har högst
%medelvärde mellan tid 0 och 1.
for i= 1:length(data.cfg.channel)
    if contains(data.cfg.channel(i,1), half(1)) ||  contains(data.cfg.channel(i,1), half(2)) || contains(data.cfg.channel(i,1), half(3))|| contains(data.cfg.channel(i,1), half(4))
        testchannel = data.trial{1, trial}(i,:);
        if mean(testchannel(1, 1000:1500))> mean(maxchannel(1, 1000:1500))
            maxchannel = testchannel;
            indexch = i;
        end
        
    end
end

end

