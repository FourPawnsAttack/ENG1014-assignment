% Q1

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name :
% ID   :
% Date Modified : 

fprintf('\n Q1 \n\n')
clc;close all; clear all;

%%
%Add your code here
d_f_ararat = importdata('ararat.txt');
d_f_boco = importdata('boco_rock.txt');
d_f_silver = importdata("silverton.txt");

time = d_f_ararat(:,1);
time_str = string(time(:,1)); %convert integer to string

% extract substring from time str: https://www.mathworks.com/help/matlab/ref/extractbetween.html
% then convert substring to double/numeric value 
time_year = str2double(extractBetween(time_str,1,4)); 
time_day = str2double(extractBetween(time_str,5,6));
time_month = str2double(extractBetween(time_str,7,8));
time_hour = str2double(extractBetween(time_str,9,10));
time_min = str2double(extractBetween(time_str,11,12));

wind_ararat = d_f_ararat(:,2);
wind_boco = d_f_boco(:,2);
wind_silver = d_f_silver(:,2);

combined = [time_year,time_day,time_month,time_hour,time_min,wind_ararat,wind_boco,wind_silver];

%Print results
%Print results
print_matrix = combined([1:4],:);
fprintf('%12s %12s %12s %12s %13s %16s %16s %16s\n','year','day','month','hour','minute','Ararat wind speed(m/s)','boco_rock wind speed(m/s)','silvertoon wind speed(m/s)')
fprintf('%12d %12d %12d %12d %12d %12.4f %23.4f %23.4f\n',print_matrix')


%Create output file
