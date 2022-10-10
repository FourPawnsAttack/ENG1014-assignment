function P = PowerFunc(W,Wc,Wcut,fy1,fy2)
%POWERFUNC Summary of this function goes here
% Detailed explanation goes here
% W is the windspeed
% Wc is the cut-in windspeed
% Wcut is the cut-out windspeed
% Wf is the cut-off windspeed
% Cp is the performance index


%p = 0.5 * Cp * p * A * W.^3
p = 1.225; % density of air
A = pi * ((70.5/2)-0.5)^2;
P = [];



if W < Wc
    P = 0;
elseif W > Wcut
    P = 0;

else
    cp = fy1(W);
    power = 0.5 .* cp .* p .* A .* W.^3;
    P = power;
    if W > 20 
        cp = fy2(W);
        power = 0.5 .* cp .* p .* A .* W.^3;
        P = power;
    else
        cp = 44.85;
        power = 0.5 .* cp .* p .* A .* W.^3;
        P = power;
    end

end

