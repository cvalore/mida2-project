clear 
close all

% Pacejka magic formula
F = @(x,D,C,B,E) D*sin(C*atan(E*atan(B*x)+(1-E)*B*x));


%% Front tires
% Longitudinal force
lambda      = -1:0.01:1;           % [-]

delta_mux_notch=0.1;                 %[-] additive value due to notch setting

Clambda     = [0,100000,250000,400000,500000];         % [N]
Fzx         = [0,1000,2500,4000,5500];         % [N]
Kx          = [0.8,0.8,0.8,0.8,0.8];           % [-]
mux_max     = [2.21,2.145,2.08,2.015,1.95]+delta_mux_notch;    % [-]
lambda_opt  = [0.08,0.08,0.08,0.08,0.08];      % [-]



for i = 2:length(Fzx)
    Dx           = Fzx(i)*mux_max(i);
    Cx           = 1+(1-2/pi*asin(Kx(i)*mux_max(i)*Fzx(i)/Dx));
    Bx           = Clambda(i)/Dx/Cx;
    Ex           = (Bx*lambda_opt(i)-tan(pi/(2*Cx)))/(Bx*lambda_opt(i)-atan(Bx*lambda_opt(i)));

    Fx = F(lambda,Dx,Cx,Bx,Ex);
    
    figure(1)
    subplot 211
    hold on, grid on, box on
    plot(lambda,Fx,'DisplayName',['F_z = ' num2str(Fzx(i)) ' N'])
end

figure(1)
subplot 211
title('Front tires - Pure longitudinal force')
legend('Location','southeast')
xlabel('Longitudinal slip ratio [-]')
ylabel('Longitudinal force [N]')


% Lateral force
alpha     = (-20:0.1:20)*pi/180;           % [rad]

delta_muy_notch=0.1;                 %[-] additive value due to notch setting

Calpha     = [0,1000,2000,2500,2500,2347.4,2084.6,2000,2000]*180/pi;  % [N/rad] 
Fzy        = [0,1000,2000,3000,4000,5000,6000,10000,11000];           % [N] 
Ky         = [0.8,0.8,0.78,0.75,0.73,0.73,0.73,0.4,0.4];              % [-] 
muy_max    = [2.34,2.21,2.08,1.95,1.82,1.69,1.56,1.3,1.3]+delta_muy_notch;            % [-]
alpha_opt  = [4,4.5,5,6,7,7,7,4,4]*pi/180;                            % [rad]

for i = 2:length(Fzy)
    Dy           = Fzy(i)*muy_max(i);
    Cy           = 1+(1-2/pi*asin(Ky(i)*muy_max(i)*Fzy(i)/Dy));
    By           = Calpha(i)/Dy/Cy;
    Ey           = (By*alpha_opt(i)-tan(pi/(2*Cy)))/(By*alpha_opt(i)-atan(By*alpha_opt(i)));

    Fy = F(tan(alpha),Dy,Cy,By,Ey);
    
    figure(1)
    subplot 212
    hold on, grid on, box on
    plot(180/pi*alpha,Fy,'DisplayName',['F_z = ' num2str(Fzy(i)) ' N'])
end

figure(1)
subplot 212
title('Front tires - Pure lateral force')
legend('Location','southeast')
xlabel('Sideslip angle [deg]')
ylabel('Lateral force [N]')

%% Rear tires
% Longitudinal force
lambda      = -1:0.01:1;           % [-]

delta_mux_notch=0;                 %[-] additive value due to notch setting   

Clambda     = [0,180000,345000,500000,680000,750000];         % [N]
Fzx         = [0,1500,3000,4500,6000,7500];                   % [N]
Kx          = [0.7,0.7,0.7,0.7,0.7,0.7];                      % [-]
mux_max     = [2.275,2.21,2.145,2.08,2.015,1.95]+delta_mux_notch;             % [-]
lambda_opt  = [0.12,0.12,0.11,0.10,0.09,0.08];                % [-]

for i = 2:length(Fzx)
    Dx           = Fzx(i)*mux_max(i);
    Cx           = 1+(1-2/pi*asin(Kx(i)*mux_max(i)*Fzx(i)/Dx));
    Bx           = Clambda(i)/Dx/Cx;
    Ex           = (Bx*lambda_opt(i)-tan(pi/(2*Cx)))/(Bx*lambda_opt(i)-atan(Bx*lambda_opt(i)));

    Fx = F(lambda,Dx,Cx,Bx,Ex);
    
    figure(2)
    subplot 211
    hold on, grid on, box on
    plot(lambda,Fx,'DisplayName',['F_z = ' num2str(Fzx(i)) ' N'])
end

figure(2)
subplot 211
title('Rear tires - Pure longitudinal force')
legend('Location','southeast')
xlabel('Longitudinal slip ratio [-]')
ylabel('Longitudinal force [N]')


% Lateral force
alpha     = (-20:0.1:20)*pi/180;           % [rad]

delta_muy_notch=0;                 %[-] additive value due to notch setting

Calpha     = [0,2000,2900,3150,3100,3000,2000,2000]*180/pi;      % [N/rad] 
Fzy        = [0,1500,3000,4500,6000,7500,10000,11000];           % [N] 
Ky         = [0.8,0.8,0.78,0.75,0.73,0.73,0.73,0.73];            % [-] 
muy_max    = [2.7,2.55,2.4,2.25,2.1,1.95,1.5,1.5]+delta_muy_notch;               % [-]
alpha_opt  = [4,4.5,5,5.5,6,6.5,4,4]*pi/180;                     % [rad]

for i = 2:length(Fzy)
    Dy           = Fzy(i)*muy_max(i);
    Cy           = 1+(1-2/pi*asin(Ky(i)*muy_max(i)*Fzy(i)/Dy));
    By           = Calpha(i)/Dy/Cy;
    Ey           = (By*alpha_opt(i)-tan(pi/(2*Cy)))/(By*alpha_opt(i)-atan(By*alpha_opt(i)));

    Fy = F((alpha),Dy,Cy,By,Ey);
    
    figure(2)
    subplot 212
    hold on, grid on, box on
    plot(180/pi*alpha,Fy,'DisplayName',['F_z = ' num2str(Fzy(i)) ' N'])
end

figure(2)
subplot 212
title('Rear tires - Pure lateral force')
legend('Location','southeast')
xlabel('Sideslip angle [deg]')
ylabel('Lateral force [N]')
