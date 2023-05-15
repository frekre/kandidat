%Testing fieldtrip

figure
%ft_topoplotER(data.cfg, ft_timelockanalysis(data.cfg, data));
%ft_singleplotTFR(data.cfg, ft_freqanalysis(data.cfg, data))
ft_connectivitysimulation(data.cfg)
%source = ft_sourceanalysis(data.cfg, ft_timelockanalysis(data.cfg, data))