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

% Dawn 00:00 - 6:00 Morning 7:00 - 12:00 Afternoon 13:00 - 18:00 Night 19:00 - 23:00

% variables needed to find the index of the times 
index_dawn= [];
index_morning = [];
index_after = [];
index_night = [];

% index counters  
a = 1;
b = 1;
c = 1;
d = 1;
time = [1,2,3,4];

for i = 1:length(time_hour)
    
    if time_hour(i) == 0 || time_hour(i) == 1 || time_hour(i) == 2 || time_hour(i) == 3  || time_hour(i) == 4 || time_hour(i) == 5 || time_hour(i) == 6  
        index_dawn(a) = i;
        a = a + 1;
    elseif time_hour(i) == 7 || time_hour(i) == 8 || time_hour(i) == 9 || time_hour(i) == 10  || time_hour(i) == 11 || time_hour(i) == 12 
        index_morning(b) = i;
        b = b + 1;
    elseif time_hour(i) == 13 || time_hour(i) == 14 || time_hour(i) == 15 || time_hour(i) == 16  || time_hour(i) == 17 || time_hour(i) == 18
        index_after(c) = i;
        c = c + 1;
    elseif time_hour(i) == 19 || time_hour(i) == 20 || time_hour(i) == 21 || time_hour(i) == 22  || time_hour(i) == 23 
        index_night(d) = i;
        d = d + 1;
    end
end

average_ararat_speeds = [mean(wind_ararat(index_dawn)),mean(wind_ararat(index_morning)),mean(wind_ararat(index_after)),mean(wind_ararat(index_night))]
average_boco_speeds = [mean(wind_boco(index_dawn)),mean(wind_boco(index_morning)),mean(wind_boco(index_after)),mean(wind_boco(index_night))]
average_silver_speeds = [mean(wind_silver(index_dawn)),mean(wind_silver(index_morning)),mean(wind_silver(index_after)),mean(wind_silver(index_night))]

plot(time,average_ararat_speeds,'b^--',time,average_boco_speeds,'c^--',time,average_silver_speeds,'g^--');
title("Average wind speed data for different sites & period intervals across the year",FontSize=10)
xticks(time); xlabel('Time period'); ylabel('Average wind speed (m/s)')
xticklabels({'Dawn','Morning','Afternoon','Night'})
legend('Ararat','Boco Rock','Silverton',Location='best');





