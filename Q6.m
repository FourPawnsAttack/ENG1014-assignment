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

%Print results
% get april indices
% clean data

index_indices = 1:1:52561;

index_jan = index_indices(time_month == 1);
index_feb = index_indices(time_month == 2);
index_mar = index_indices(time_month == 3);
index_apr = index_indices(time_month == 4);
index_may = index_indices(time_month == 5);
index_jun = index_indices(time_month == 6);
index_jul = index_indices(time_month == 7);
index_aug = index_indices(time_month == 8);
index_sep = index_indices(time_month == 9);
index_oct = index_indices(time_month == 10);
index_nov = index_indices(time_month == 11);
index_dec = index_indices(time_month == 12);

ararat_energy = PowerFunc(wind_ararat,Wc,Wcut,fy1,fy2);

t2 = 30* 24 * 60 *60;
time = linspace(0,t2,length(ararat_energy(index_apr)));

energy_apr = comp_trap_vector(time,ararat_energy(index_apr));
fprintf("The energy generated in April is %.5fJ \n",energy_apr)

power_jan = sum(ararat_energy(index_jan));
power_feb = sum(ararat_energy(index_feb));
power_mar = sum(ararat_energy(index_mar));
power_apr = sum(ararat_energy(index_apr));
power_may = sum(ararat_energy(index_may));
power_jun = sum(ararat_energy(index_jun));
power_jul = sum(ararat_energy(index_jul));
power_aug = sum(ararat_energy(index_aug));
power_sep = sum(ararat_energy(index_sep));
power_oct = sum(ararat_energy(index_oct));
power_nov = sum(ararat_energy(index_nov));
power_dec = sum(ararat_energy(index_dec));

%You should have produced one figure window by the end of this task.
figure(6)
plot(1,power_jan,'r*')
hold on
plot(2,power_feb,'r*')
hold on
plot(3,power_mar,'r*')
hold on
plot(4,power_apr,'r*')
hold on
plot(5,power_may,'r*')
hold on
plot(6,power_jun,'r*')
hold on
plot(7,power_jul,'r*')
hold on
plot(8,power_aug,'r*')
hold on
plot(9,power_sep,'r*')
hold on
plot(10,power_oct,'r*')
hold on
plot(11,power_nov,'r*')
hold on
plot(12,power_dec,'r*')
hold on
xticks(1:1:13)
xticklabels({'January','February','March','April','May','June','July','August','September','October','November','December'})


