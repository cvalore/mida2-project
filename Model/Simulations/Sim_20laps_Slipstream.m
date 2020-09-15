%% clear workspace
clear
clc
close all
%% initialization
Init
%% load model
modelName = 'Model3';
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName);
end
%% set inputs
slipstreamON = 1;
stressTestSelector = -1;
%% simulate
t_sim = 1500;
set_param('Model3','Solver','ode15s','StopTime', num2str(t_sim));
out = sim('Model3', 'ReturnWorkspaceOutputs', 'on');