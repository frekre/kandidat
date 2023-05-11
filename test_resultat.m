%kalla på resultat
%innan: gå in i metod, fixa axlar + titel

[vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2]=resultmaker(data, {'C3'}, {'C4'});
%%

axparam = [0 2*10^6 0 13];
titel = "subject 12 + lambda = 6";

resultdrawer(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, titel);