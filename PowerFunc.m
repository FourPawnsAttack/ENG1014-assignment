function P = PowerFunc(W,Wc,Wf,cp)
%POWERFUNC Summary of this function goes here
% Detailed explanation goes here
% W is the windspeed
% Wc is the cut-in windspeed
% Wf is the cut-off windspeed
% Cp is the performance index


%p = 0.5 * Cp * p * A * W.^3
p = 1.225; % density of air
A = pi * (70.5/2)^2;


if W <= Wc
    P = 0;
elseif Wf <= W
    P = 0;
else 
    power = 0.5 .* cp .* p .* A .* W.^3;
    P = power;
end

end

