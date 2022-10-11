% Q5

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022

fprintf('\n Q5 \n\n')
%%
%Add your code here

mass = 1500; % mass of turbine blade kg
velo = 120; %m/s
radius = 70.5/2;
mass_h = 500;
radius_h = 1/2;
force_r = 0.2;
c_f = 0.001; % friction coefficient 
ini_vel = 30;
fin_vel = 0;


% q5a)
F = (mass * velo^2)/radius;

fprintf("The force exerted is %.5f N\n",F)

% q5b)
i_h = 0.5*mass_h*radius_h^2; % central housing moment
i_b = (1/12)*mass*(radius/radius_h)^2; % blade moment 

i_total = i_h + 3*i_b; % total moment

fprintf("The moment of inertia is %.5f kgm^2\n",m_total)

% q5c)
mass_total = 3*mass + mass_h;
g = 9.81;
ke_f = mass_total * g * c_f;
fprintf("The expected friction force is %.5f N\n",ke_f)

% q5d)
torque = force_r * ke_f;
r_decel = torque/i_total;
fprintf("The rotational deceleration is %.10f rad/s^2\n",r_decel)

% q5e)
new_velo = ini_vel/radius;
time = (v-new_velo)./r_decel;

fprintf("The time taken to decelerate to rest is %.10f s\n",time)

% q5f)
heat = 0.5*i_total*(new_velo)^2;

fprintf("The total energy dissipated as heat is %.10f J\n",heat)

%Print results

