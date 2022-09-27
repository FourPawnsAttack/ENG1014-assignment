% Q2

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name :
% ID   :
% Date Modified : 

fprintf('\n Q2 \n\n')
%%
%Add your code here
date_matrix = datenum(time_year,time_month,time_day);
wind_all = [wind_ararat,wind_boco,wind_silver];
counter_ararat = 0;
counter_boco = 0;
counter_silver = 0;

% find the distribution of time when each each site has the largest wind speed
for i = 1:size(wind_ararat)
    [M,I] = max(wind_all(i,:));
    disp(I)
    if I == 1
        counter_ararat = counter_ararat + 1;
    elseif I == 2
        counter_boco = counter_boco + 1;
    elseif I == 3
        counter_silver = counter_silver + 1;
    end
end

%Print results

%You should have produced three figure windows by the end of this task.
%Plotting for (a)
figure(1)
subplot(3,1,1)
plot(date_matrix,wind_ararat,'LineWidth',1)
xlabel('Date'); ylabel('Wind Speed');
title('Wind Speed vs Time (Ararat)');
datetick('x')

subplot(3,1,2)
plot(date_matrix,wind_boco,'LineWidth',1)
datetick('x')
xlabel('Date'); ylabel('Wind Speed');
title('Wind Speed vs Time (Boco)');

subplot(3,1,3)
plot(date_matrix,wind_silver,'LineWidth',1)
datetick('x')
xlabel('Date'); ylabel('Wind Speed');
title('Wind Speed vs Time (Silverton)');

figure(2)





%Plotting for (b)
figure(3)
%Plotting for (c)
