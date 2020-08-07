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
bankingON = 0;
slipstreamON = 0;
init_vel = 0.01;
force = 500;
steerAmpl = 20;
steerFreq = 0.22;

Fx_input_const = get_param('Model3/Controller/Fx_input_const[N]','PortHandles');
Fx_input_step = get_param('Model3/Controller/Fx_input_step[N]','PortHandles');
Fx_input_ramp = get_param('Model3/Controller/Fx_input_ramp[N]','PortHandles');
delta_input_const = get_param('Model3/Controller/delta_input_const[deg]','PortHandles');
delta_input_sin = get_param('Model3/Controller/delta_input_sin[deg]','PortHandles');
fxInputBlock = get_param('Model3/Controller/Fx','PortHandles');
fxInputBlockLine = get_param('Model3/Controller/Fx','LineHandles');
deltaInputBlock = get_param('Model3/Controller/toRad','PortHandles');
deltaInputBlockLine = get_param('Model3/Controller/toRad','LineHandles');
delete_line(fxInputBlockLine.Inport(1));
delete_line(deltaInputBlockLine.Inport(1));
set_param('Model3/Controller/Fx_input_const[N]', 'Commented', 'off');
set_param('Model3/Controller/Fx_input_ramp[N]', 'Commented', 'on');
set_param('Model3/Controller/Fx_input_step[N]', 'Commented', 'on');
set_param('Model3/Controller/delta_input_sin[deg]', 'Commented', 'off');
set_param('Model3/Controller/delta_input_const[deg]', 'Commented', 'on');
add_line('Model3/Controller',Fx_input_const.Outport(1),fxInputBlock.Inport(1));
add_line('Model3/Controller',delta_input_sin.Outport(1),deltaInputBlock.Inport(1));

set_param('Model3/Controller/Fx_input_const[N]', 'Value', num2str(force));
set_param('Model3/Controller/delta_input_sin[deg]', 'Amplitude', num2str(steerAmpl));
set_param('Model3/Controller/delta_input_sin[deg]', 'Frequency', num2str(steerFreq));
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