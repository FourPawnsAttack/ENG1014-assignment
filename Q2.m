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
wind_all = [wind_ararat,wind_boco,wind_silver];
counter_ararat = 0;
counter_boco = 0;
counter_silver = 0;
counter_tie = 0;

second = zeros(length(time_year),1); % create seconds 
date_matrix = datenum(time_year,time_month,time_day,time_hour,time_min,second); % convert date to single serial number


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

%%
index_time_0 = []; index_time_1 = []; index_time_2 = []; index_time_3 = []; index_time_4 = []; index_time_5 = []; index_time_6 = []; index_time_7 = []; index_time_8 = []; index_time_9 = [];
index_time_10 = []; index_time_11 = []; index_time_12 = []; index_time_13 = []; index_time_14 = []; index_time_15 = []; index_time_16 = []; index_time_17 = []; index_time_18 = []; index_time_19 = [];
index_time_20 = []; index_time_21 = []; index_time_22 = []; index_time_23 = [];
index = 1;

for i = 1:length(time_hour)
    n = time_hour(i);
    switch n
        case 0
            index_time_0(i) = i;
        case 1
            index_time_1(i) = i;
        case 2
            index_time_2(i) = i;
        case 3
            index_time_3(i) = i;
        case 4
            index_time_4(i) = i;
        case 5
            index_time_5(i) = i;
        case 6
            index_time_6(i) = i;
        case 7
            index_time_7(i) = i;
        case 8
            index_time_8(i) = i;
        case 9
            index_time_9(i) = i;
        case 10
            index_time_10(i) = i;
        case 11
            index_time_11(i) = i;
        case 12
            index_time_12(i) = i;
        case 13
            index_time_13(i) = i;
        case 14
            index_time_14(i) = i;
        case 15
            index_time_15(i) = i;
        case 16
            index_time_16(i) = i;
        case 17
            index_time_17(i) = i;
        case 18
            index_time_18(i) = i;
        case 19
            index_time_19(i) = i;
        case 20
            index_time_20(i) = i;
        case 21
            index_time_21(i) = i;
        case 22
            index_time_22(i) = i;
        case 23
            index_time_23(i) = i;
    end
end
index_time_0 = nonzeros(index_time_0); index_time_1 = nonzeros(index_time_1); index_time_2 = nonzeros(index_time_2); index_time_3 = nonzeros(index_time_3); index_time_4 = nonzeros(index_time_4); index_time_5 = nonzeros(index_time_5); index_time_6 = nonzeros(index_time_6); index_time_7 = nonzeros(index_time_7);
index_time_8 = nonzeros(index_time_8); index_time_9 = nonzeros(index_time_9); index_time_10 = nonzeros(index_time_10); index_time_11 = nonzeros(index_time_11); index_time_12 = nonzeros(index_time_12); index_time_13 = nonzeros(index_time_13); index_time_14 = nonzeros(index_time_14); index_time_15 = nonzeros(index_time_15);
index_time_16 = nonzeros(index_time_16); index_time_17 = nonzeros(index_time_17); index_time_18 = nonzeros(index_time_18); index_time_19 = nonzeros(index_time_19); index_time_20 = nonzeros(index_time_20); index_time_21 = nonzeros(index_time_21); index_time_22 = nonzeros(index_time_22); index_time_23 = nonzeros(index_time_23);


avg_arr_0 = mean(wind_ararat(index_time_0)); avg_arr_1 = mean(wind_ararat(index_time_1)); avg_arr_2 = mean(wind_ararat(index_time_2)); avg_arr_3 = mean(wind_ararat(index_time_3)); avg_arr_4 = mean(wind_ararat(index_time_4)); avg_arr_5 = mean(wind_ararat(index_time_5)); avg_arr_6 = mean(wind_ararat(index_time_6)); avg_arr_7 = mean(wind_ararat(index_time_7));avg_arr_8 = mean(wind_ararat(index_time_8)); avg_arr_9 = mean(wind_ararat(index_time_9)); avg_arr_10 = mean(wind_ararat(index_time_10));avg_arr_11 = mean(wind_ararat(index_time_11)); avg_arr_12 = mean(wind_ararat(index_time_12)); avg_arr_13 = mean(wind_ararat(index_time_13)); avg_arr_14 = mean(wind_ararat(index_time_14)); avg_arr_15 = mean(wind_ararat(index_time_15)); avg_arr_16 = mean(wind_ararat(index_time_16));avg_arr_17 = mean(wind_ararat(index_time_17)); avg_arr_18 = mean(wind_ararat(index_time_18)); avg_arr_19 = mean(wind_ararat(index_time_19)); avg_arr_20 = mean(wind_ararat(index_time_20)); avg_arr_21 = mean(wind_ararat(index_time_21)); avg_arr_22 = mean(wind_ararat(index_time_22)); avg_arr_23 = mean(wind_ararat(index_time_23));
avg_boc_0 = mean(wind_boco(index_time_0)); avg_boc_1 = mean(wind_boco(index_time_1)); avg_boc_2 = mean(wind_boco(index_time_2)); avg_boc_3 = mean(wind_boco(index_time_3)); avg_boc_4 = mean(wind_boco(index_time_4)); avg_boc_5 = mean(wind_boco(index_time_5)); avg_boc_6 = mean(wind_boco(index_time_6)); avg_boc_7 = mean(wind_boco(index_time_7));avg_boc_8 = mean(wind_boco(index_time_8)); avg_boc_9 = mean(wind_boco(index_time_9)); avg_boc_10 = mean(wind_boco(index_time_10));avg_boc_11 = mean(wind_boco(index_time_11)); avg_boc_12 = mean(wind_boco(index_time_12)); avg_boc_13 = mean(wind_boco(index_time_13)); avg_boc_14 = mean(wind_boco(index_time_14)); avg_boc_15 = mean(wind_boco(index_time_15)); avg_boc_16 = mean(wind_boco(index_time_16));avg_boc_17 = mean(wind_boco(index_time_17)); avg_boc_18 = mean(wind_boco(index_time_18)); avg_boc_19 = mean(wind_boco(index_time_19)); avg_boc_20 = mean(wind_boco(index_time_20)); avg_boc_21 = mean(wind_boco(index_time_21)); avg_boc_22 = mean(wind_boco(index_time_22)); avg_boc_23 = mean(wind_boco(index_time_23));
avg_sil_0 = mean(wind_silver(index_time_0)); avg_sil_1 = mean(wind_silver(index_time_1)); avg_sil_2 = mean(wind_silver(index_time_2)); avg_sil_3 = mean(wind_silver(index_time_3)); avg_sil_4 = mean(wind_silver(index_time_4)); avg_sil_5 = mean(wind_silver(index_time_5)); avg_sil_6 = mean(wind_silver(index_time_6)); avg_sil_7 = mean(wind_silver(index_time_7));avg_sil_8 = mean(wind_silver(index_time_8)); avg_sil_9 = mean(wind_silver(index_time_9)); avg_sil_10 = mean(wind_silver(index_time_10));avg_sil_11 = mean(wind_silver(index_time_11)); avg_sil_12 = mean(wind_silver(index_time_12)); avg_sil_13 = mean(wind_silver(index_time_13)); avg_sil_14 = mean(wind_silver(index_time_14)); avg_sil_15 = mean(wind_silver(index_time_15)); avg_sil_16 = mean(wind_silver(index_time_16));avg_sil_17 = mean(wind_silver(index_time_17)); avg_sil_18 = mean(wind_silver(index_time_18)); avg_sil_19 = mean(wind_silver(index_time_19)); avg_sil_20 = mean(wind_silver(index_time_20)); avg_sil_21 = mean(wind_silver(index_time_21)); avg_sil_22 = mean(wind_silver(index_time_22)); avg_sil_23 = mean(wind_silver(index_time_23));



avg_arr = [avg_arr_0,avg_arr_1,avg_arr_2,avg_arr_3,avg_arr_4,avg_arr_5,avg_arr_6,avg_arr_7,avg_arr_8,avg_arr_9,avg_arr_10,avg_arr_11,avg_arr_12,avg_arr_13,avg_arr_14,avg_arr_15,avg_arr_16,avg_arr_17,avg_arr_18,avg_arr_19,avg_arr_20,avg_arr_21,avg_arr_22,avg_arr_23];
avg_boc = [avg_boc_0,avg_boc_1,avg_boc_2,avg_boc_3,avg_boc_4,avg_boc_5,avg_boc_6,avg_boc_7,avg_boc_8,avg_boc_9,avg_boc_10,avg_boc_11,avg_boc_12,avg_boc_13,avg_boc_14,avg_boc_15,avg_boc_16,avg_boc_17,avg_boc_18,avg_boc_19,avg_boc_20,avg_boc_21,avg_boc_22,avg_boc_23];
avg_sil = [avg_sil_0,avg_sil_1,avg_sil_2,avg_sil_3,avg_sil_4,avg_sil_5,avg_sil_6,avg_sil_7,avg_sil_8,avg_sil_9,avg_sil_10,avg_sil_11,avg_sil_12,avg_sil_13,avg_sil_14,avg_sil_15,avg_sil_16,avg_sil_17,avg_sil_18,avg_sil_19,avg_sil_20,avg_sil_21,avg_sil_22,avg_sil_23];


data = 0:1:23;
hold on
plot(data,avg_arr,data,avg_boc,data,avg_sil)
title('Average Wind Speeds at Different Times of the Day across the Year')
xlabel('Time');
ylabel('Average Wind Speed'); xlim([0 23]);
legend('Ararat','Boco Rock','Silverton','Location','northwest');