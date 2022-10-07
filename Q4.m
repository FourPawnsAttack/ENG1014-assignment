% Q4

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022

fprintf('\n Q4 \n\n')
%%
%Add your code here
data_file = importdata('performance_measures.txt').data;
windspeed = data_file(:,1);
cp = data_file(:,2); % performance index

%Print results

%You should have produced one figure window by the end of this task.
% plot 

figure(5)
plot(windspeed,cp,'rs')
