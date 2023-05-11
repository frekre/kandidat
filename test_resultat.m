
close all
clear all

%ladda upp rätt data
load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj13.mat', 'data')

%kalla på resultat
resultmaker(data, {'FC3'}, {'FC4'});
