% Q1

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022

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

%part b 
% replace wind speeds that are less than 0 to 0
for i = 1:size(wind_ararat)
    if wind_ararat(i) < 0
        wind_ararat(i) = 0;
    end

    if wind_boco(i) < 0
        wind_boco(i) = 0;
    end

    if wind_silver(i) < 0
        wind_silver(i) = 0;
    end
end

% transpose the matrices to make it easier to work with 
wind_ararat = wind_ararat.';
wind_boco = wind_boco.';
wind_silver = wind_silver.';

%store index where changes happens
index_ararat = [];
index_boco = [];
index_silver = [];
counter = 1;

% duplicate data before cleaned to compare 
wind_ararat_old = wind_ararat;
wind_boco_old = wind_boco;
wind_silver_old = wind_silver;

% clean ararat data
for i = 1:length(wind_ararat)
    if i+3 < length(wind_ararat) && i >= 4
        v_avg = mean(wind_ararat([i-3:i-1, i+1:i+3]));
 % find the hourly average by averaging from the top 3 and bottom 3 points
        if wind_ararat(i)/v_avg > 1.7 || wind_ararat(i)/v_avg < 0.3
            wind_ararat(i) = v_avg;
            index_ararat(counter) = i;
            counter = counter + 1;
        end
    end
end
counter = 1; %reset counter
% clean boco data
for i = 1:length(wind_boco)
    if i+3 < length(wind_boco) && i >= 4
        v_avg = mean(wind_boco([i-3:i-1, i+1:i+3])); % find the hourly average by averaging from the top 3 and bottom 3 points
        if wind_boco(i)/v_avg > 1.7 || wind_ararat(i)/v_avg < 0.3
            wind_boco(i) = v_avg;
            index_boco(counter) = i;
            counter = counter + 1;
        end
    end
end
counter = 1; %reset counter

% clean silverton data
for i = 1:length(wind_silver)
    if i+3 < length(wind_silver) && i >= 4
        v_avg = mean(wind_silver([i-3:i-1, i+1:i+3])); % find the hourly average by averaging from the top 3 and bottom 3 points
        if wind_silver(i)/v_avg > 1.7 || wind_silver(i)/v_avg < 0.3
            wind_silver(i) = v_avg;
            index_silver(counter) = i;
            counter = counter + 1;
        end
    end
end
counter = 1; %reset counter

% transpose the matrices to make it easier to work with 
wind_ararat = wind_ararat.';
wind_boco = wind_boco.';
wind_silver = wind_silver.';

% create output file 
fid = fopen('cleaned_data.txt','w');
formatspec = 'Change logged at Location: Ararat Time: %d Old: %4.2f New: %4.2f\n';
fprintf(fid,formatspec,time(index_ararat),wind_ararat_old(index_ararat),wind_ararat(index_ararat));

fclose(fid);


