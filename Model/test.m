close all
%clear
clc

load s_indy_internal;
load banking_indy;


% x = s_indy_internal(1,1:size(s_indy_internal, 2)/2)';
% t = banking_indy(1,1:size(s_indy_internal, 2)/2)';

x_reg = s_indy_internal(1,:)';
t_reg = banking_indy(1,:)';

% x = zscore(x);
% t = zscore(t);

[xData, yData] = prepareCurveData( x_reg, t_reg );

% Set up fittype and options.
ft = 'linearinterp';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' )

% figure(1)
% hold on, grid on, box on
% plot(x', t', 'b--', 'DisplayName', 'data');
% %plot(x', y_res', 'r-', 'DisplayName', 'regression');
% plot( fitresult, xData, yData );
% legend('Location','northwest');
% xlabel('Ascissa curvilinea [m]');
% ylabel('Banking [deg]');
