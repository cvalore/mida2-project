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
ref_vel = 50;
init_vel = 30;
slope = 3
;
start = 0;
initial_output = 0;

Fx_input_const = get_param('Model3/Controller/Fx_input_const[N]','PortHandles');
Fx_input_step = get_param('Model3/Controller/Fx_input_step[N]','PortHandles');
Fx_input_ramp = get_param('Model3/Controller/Fx_input_ramp[N]','PortHandles');
PID_vel = get_param('Model3/Controller/PID_vel','PortHandles');
delta_input_const = get_param('Model3/Controller/delta_input_const[deg]','PortHandles');
delta_input_sin = get_param('Model3/Controller/delta_input_sin[deg]','PortHandles');
delta_input_ramp = get_param('Model3/Controller/delta_input_ramp[deg]','PortHandles');

fxInputBlock = get_param('Model3/Controller/Fx','PortHandles');
fxInputBlockLine = get_param('Model3/Controller/Fx','LineHandles');
deltaInputBlock = get_param('Model3/Controller/toRad','PortHandles');
deltaInputBlockLine = get_param('Model3/Controller/toRad','LineHandles');
if (fxInputBlockLine.Inport(1) ~= (-1))
    delete_line(fxInputBlockLine.Inport(1));
end
if (deltaInputBlockLine.Inport(1) ~= (-1))
    delete_line(deltaInputBlockLine.Inport(1));
end
set_param('Model3/Controller/Fx_input_const[N]', 'Commented', 'on');
set_param('Model3/Controller/Fx_input_ramp[N]', 'Commented', 'on');
set_param('Model3/Controller/Fx_input_step[N]', 'Commented', 'on');
set_param('Model3/Controller/delta_input_sin[deg]', 'Commented', 'on');
set_param('Model3/Controller/delta_input_const[deg]', 'Commented', 'on');
set_param('Model3/Controller/delta_input_ramp[deg]', 'Commented', 'off');
set_param('Model3/Controller/v_ref[ms^-1]', 'Commented', 'off');
set_param('Model3/Controller/error', 'Commented', 'off');
set_param('Model3/Controller/PID_vel', 'Commented', 'off');

add_line('Model3/Controller',PID_vel.Outport(1),fxInputBlock.Inport(1));
add_line('Model3/Controller',delta_input_ramp.Outport(1),deltaInputBlock.Inport(1));

set_param('Model3/Controller/v_ref[ms^-1]', 'Value', num2str(ref_vel));
set_param('Model3/Controller/delta_input_ramp[deg]', 'slope', num2str(slope));
set_param('Model3/Controller/delta_input_ramp[deg]', 'start', num2str(start));
set_param('Model3/Controller/delta_input_ramp[deg]', 'InitialOutput', num2str(initial_output));
%% set automatic figures on-off
set_param('Model3/POS_VEL', 'OpenAtSimulationStart', 'off');
set_param('Model3/ANGLES', 'OpenAtSimulationStart', 'off');
set_param('Model3/TYRE_SLIPS', 'OpenAtSimulationStart', 'off');
set_param('Model3/LATERAL_FORCES', 'OpenAtSimulationStart', 'off');
set_param('Model3/POWER_MASS', 'OpenAtSimulationStart', 'off');
set_param('Model3/VEL_ACC_POWER', 'OpenAtSimulationStart', 'off');
set_param('Model3/TYRE_WEAR', 'OpenAtSimulationStart', 'off');
%% simulate
t_sim = 100;
set_param('Model3','Solver','ode15s','StopTime', int2str(t_sim));
out = sim('Model3', 'ReturnWorkspaceOutputs', 'on');

fxInputBlockLine = get_param('Model3/Controller/Fx','LineHandles');
delete_line(fxInputBlockLine.Inport(1));
add_line('Model3/Controller',Fx_input_const.Outport(1),fxInputBlock.Inport(1));
set_param('Model3/Controller/v_ref[ms^-1]', 'Commented', 'on');
set_param('Model3/Controller/error', 'Commented', 'on');
set_param('Model3/Controller/PID_vel', 'Commented', 'on');
set_param('Model3/Controller/Fx_input_const[N]', 'Commented', 'off');
deltaInputBlockLine = get_param('Model3/Controller/toRad','LineHandles');
delete_line(deltaInputBlockLine.Inport(1));
set_param('Model3/Controller/delta_input_ramp[deg]', 'Commented', 'on');
set_param('Model3/Controller/delta_input_const[deg]', 'Commented', 'off');
add_line('Model3/Controller',delta_input_const.Outport(1),deltaInputBlock.Inport(1));
%% plot all
plotRes_all;
