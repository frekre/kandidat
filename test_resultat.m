%Ladda rätt subjekt
%kalla på resultat

[vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2] = resultmaker(data, {'C5'}, {'C6'});
%% visualisera resultat

axparam = [0 0.6*10^6 0 35];
titel = "Energy distribrution - Subject 15";

resultdrawer2(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, titel);
%%
heading = 'T-F distribution - Subject 11';
tfStat(vS1, vS2, vSRS1, vSRS2, heading);


%%
heading = 'Errorbar of energy distribution - Subject 11';
draw_errorbar(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, heading);