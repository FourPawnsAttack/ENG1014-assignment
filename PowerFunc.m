function P = PowerFunc(W,Wc,Wcut,fy1,fy2,Ws_opt,Wf)
%POWERFUNC Summary of this function goes here
% Detailed explanation goes here
% W is the windspeed
% Wc is the cut-in windspeed
% Wcut is the cut-out windspeed
% Wf is the cut-off windspeed
% Cp is the performance index


% other variables
rho = 1.225;                 % air density, kg/m^3
r = 34.75;                   % r = turbine blade length
A = pi*r^2;                  % swept area of turbine
Cp_max = 44.85;
% power equation
Power =@(W,Cp) 0.5*Cp/100*rho*A*W^3;     % power generated J/s
P = [];
% Calculating Cp for each W
for i = 1:length(W)
    if W(i) >= Wc && W(i) <= Wcut
        if W(i) >= Wc && W(i) <= Ws_opt
            Cp = fy1(W(i));
        elseif W(i) > Ws_opt && W(i) < Wf
            Cp = Cp_max;
        elseif W(i) >= Wf && W(i)<= Wcut
            Cp = fy2(W(i));
    
        end
        P(i) = Power(W(i),Cp);
    else
        P(i) = 0;
    end
end


