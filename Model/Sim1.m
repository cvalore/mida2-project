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
%Fx_input = find_system(modelName,'Name','Fx_input');
%delta_input = find_system(modelName,'Name','delta_input');
%Fx = get_param(Fx_input, 'Value');
bankingON = 1;
init_vel = 20;
set_param('Model3/Controller/Fx_input', 'Value', '100');
set_param('Model3/Controller/delta_input', 'Value', '0');
%% set automatic figures on-off
set_param('Model3/POS_VEL', 'OpenAtSimulationStart', 'off');
set_param('Model3/ANGLES', 'OpenAtSimulationStart', 'off');
set_param('Model3/TYRE_SLIPS', 'OpenAtSimulationStart', 'off');
set_param('Model3/LATERAL_FORCES', 'OpenAtSimulationStart', 'off');
set_param('Model3/POWER_MASS', 'OpenAtSimulationStart', 'off');
set_param('Model3/VEL_ACC_POWER', 'OpenAtSimulationStart', 'off');
set_param('Model3/TYRE_WEAR', 'OpenAtSimulationStart', 'off');
%% simulate
t_sim = 30;
set_param('Model3','Solver','ode15s','StopTime', int2str(t_sim));
out = sim('Model3', 'ReturnWorkspaceOutputs', 'on');
%% plot all
plotRes_all;