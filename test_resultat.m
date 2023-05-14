%kalla på resultat

[vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2]=resultmaker(data, {'C5'}, {'C6'});
%% visualisera resultat

axparam = [0 0.5*10^6 0 10];
titel = "subject 10";

resultdrawer(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, titel);
