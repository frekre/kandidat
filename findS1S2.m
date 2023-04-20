function [S1,S2] = findS1S2(data)
%finds1s2 returnerar två summerade signaler från sida 1 och sida 2 
%där kanaler som representerar området har medelvärdesbildats 
%för en specifik trial
S1 = [];
S2= [];
for i=1:352
    
    if data.trialinfo{i, 1}.side(1,1) == 1
        S1(end+1)=i; 
    end

    if data.trialinfo{i, 1}.side(1,1)== 2
        S2(end+1) = i; 
    end
end


end

