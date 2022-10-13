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
Ws_opt = windspeed(13);

for i = 1:12

    % extract monthly data
    month_index = find(time_month == i);

    % time taken throughout the month
    num_intervals = length(month_index) - 1;
    num_seconds = num_intervals*600;
    
    % calling PowerFunc
    powervect = PowerFunc(wind_ararat(month_index),Wc,Wcut,fy1,fy2,Ws_opt,Wf);
    power = powervect;
    time = linspace(0,num_seconds,length(power));

    % calculating integral
    energy(i) = comp_trap_vector(time,power);

end
energy_apr = energy(4);
fprintf("The energy generated in April is %.5fJ \n",energy_apr)


%You should have produced one figure window by the end of this task.
figure(6)
month = 1:1:12;
hold on
bar(month,energy)
xticks(1:1:13);
xlabel("Month"); ylabel("Power Generated (J)")
xticklabels({'January','February','March','April','May','June','July','August','September','October','November','December'})

fprintf("The trend of power generated increases from January to March then it decreases till October and starts increasing. \n")
fprintf("The max power generated is around 2.3 x 10^11 W at March\n")
fprintf("The min power generated is around 2.2 x 10^10 W at March\n")
fprintf("When compared to figure 1, it can be seen that there are consistent high winds during March which explains the higher power generation.\n")
fprintf("This is because wind speed is related to power generation.\n")


