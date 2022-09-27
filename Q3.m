% Q3

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name :
% ID   :
% Date Modified : 

fprintf('\n Q3 \n\n')
%%
%Add your code here
%
data_file = importdata('avg_wind_data.txt').data;
height = data_file(:,1);
avg_ararat = data_file(:,2);
avg_silver = data_file(:,3);
avg_boco = data_file(:,4);


plot(height,avg_ararat,'bo','MarkerSize',6)
hold on 
plot(height,avg_silver,'r*','MarkerSize',9)
hold on
plot(height,avg_boco,'m--','MarkerSize',9)
legend('Ararat','Silverton','Boco Rock')

%Print results

%You should have updated one figure window by the end of this task.
figure(1)
