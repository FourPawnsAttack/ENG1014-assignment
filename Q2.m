% Q2

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022

fprintf('\n Q2 \n\n')
%%
%Add your code here
% variables 
date_matrix = datenum(time_year,time_month,time_day); % convert date to single serial number
wind_all = [wind_ararat,wind_boco,wind_silver];
counter_ararat = 0;
counter_boco = 0;
counter_silver = 0;
counter_tie = 0;

% find the distribution of time when each each site has the largest wind speed
for i = 1:size(wind_ararat)
    % find the index where the max windspeed occurs
    [M,I] = max(wind_all(i,:));
    % find ties 
    if (wind_all(i,1) == wind_all(i,2) && I == 1) || (wind_all(i,2) == wind_all(i,3) && I == 2) || (wind_all(i,1) == wind_all(i,3) && I == 1)
        counter_tie = counter_tie + 1;
    elseif I == 1
        counter_ararat = counter_ararat + 1;
    elseif I == 2
        counter_boco = counter_boco + 1;
    elseif I == 3
        counter_silver = counter_silver + 1;
    end
end
counter_all = [counter_ararat,counter_boco,counter_silver,counter_tie];

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


%Plotting for (b)
% plot pie chart for part b
figure(2)

pie(counter_all)
title('Percentage of time each site had the largest wind speed')
legend('Ararat','Boco Rock','Silverton','Tie')

%Plotting for (c)

figure(3)



