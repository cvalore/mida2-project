clear
close all
clc

g=9.81;

%% Chassis parameter

mu_F=    29.5;           %[kg] front unsprung mass (by wheel)
mu_R=    36;             %[kg] rear unsprung mass (by wheel)
Ixx=    70;             %[kg m^2] TOTAL (chassis + loads) inertia (x axis)
Iyy=    527;            %[kg m^2] TOTAL (chassis + loads) inertia (x axis)
Izz=    606;            %[kg m^2] TOTAL (chassis + loads) inertia (x axis)

m_F= 1200/g;             %[kg] front mass (by wheel)
m_R= 1700/g;             %[kg] rear mass (by wheel)

m_passenger=70;         %[kg] passenger mass
m_fuel=58;              %[kg] fuel mass


ms=m_F*2+m_R*2-mu_F*2-mu_R*2;   %[kg] sprung mass
m=m_F*2+m_R*2+m_passenger+m_fuel; %[kg] TOTAL (chassis + loads) mass

L=3.120;                %[m] wheelbase
lr=1.353;               %[m] rear semi-wheelbase
lf=L-lr;                %[m] front semi-wheelbase

cog_ride_height_loaded=0.021;    %[m] height of the Z axis wrt ground (with LOADS)
h_cog=cog_ride_height_loaded+0.25;  %[m] COG height ? 

d_F= 0.8193*2;           %[m] front track width
d_R= 0.762*2;            %[m] rear track width


%% Aerodynamic coeff.

% F=0.2 rho S C v^2

S=1;                    %[m^2] frontal surface
Cl1=0.522;              %[-] front axle coefficient (@reference ride height)
Cl2=1.034;              %[-] front axle coefficient (@reference ride height)


Cd=0.725;               %[-] drag force parameter


%% Tire parameters

camber_static_FL=3;     %[deg] static camber front left tire
camber_static_FR=-3;    %[deg] static camber front right tire

camber_static_RL=2;     %[deg] static camber rear left tire
camber_static_RR=-2;    %[deg] static camber rear right tire

Jw_F=1.35;              %[mg m^2] front wheel inertia
Jw_R=1.8;               %[mg m^2] rear wheel inertia