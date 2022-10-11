% Q6

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022 

fprintf('\n Q6 \n\n')
%%
%Add your code here
% call PowerFunc and outputs vector P containing power
P = PowerFunc(windspeed,Wc,Wcut,fy1,fy2);
index_april = [];
%Print results
for i = 1:length(time_month)
    if time_month(i) == 4
        index_april(i) = i;
    end
end
index_april = nonzeros(index_april); % clean data


%You should have produced one figure window by the end of this task.
figure(6)