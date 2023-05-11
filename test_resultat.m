%kalla på resultat
%innan: gå in i metod, fixa axlar + titel

[vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2]=resultmaker(data, {'FC3'}, {'FC4'});
%%

axparam = [0 8*10^6 0 11];
titel = "subject 13";

resultdrawer(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, axparam, titel);