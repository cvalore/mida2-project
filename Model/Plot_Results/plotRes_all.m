function plotRes_all(model_index, out)
%% close others
close all
clc
%% plot trajectory
plotRes(model_index, out);
%% plot position and velocities
plotPosVel(model_index, out);
%% plot yaw angle, yaw rate and body slip angle
plotAngles(model_index, out);
%% plot tyres slip angles
plotTyreSlips(model_index, out);
%% plot vel acc and power
plotVelAccPowerMass(model_index, out);
%% plot forces and wear
plotForcesWear(model_index, out);
%% plot Fz on tyres
plotFzTyres(model_index, out);
%% plot banking
plotBanking(model_index, out);