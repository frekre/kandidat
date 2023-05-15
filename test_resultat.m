%kalla på resultat

[vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2]=resultmaker(data, {'C5'}, {'C6'});
%% visualisera resultat

axparam = [0 0.9*10^6 0 10];
titel = "subject 10";

resultdrawer(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, titel);
%%
heading = 'Frequency and time distribution t-f coordinates used for energy-comp';
tfStat(vS1, vS2, vSRS1, vSRS2, heading);