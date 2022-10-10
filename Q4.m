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
xlabel('Windspeed(m/s)');ylabel('Cp(%)');
title('Performance index against windspeeds');
% find the max value of the cp, as it the point where the graph changes
% shape
[max_cp, max_index] = max(cp);
% find the curve coefficients to the order of 3
% https://docs.google.com/document/d/1EUvIt8yyEeO8o1UVZoXyOALQ3WBzCf6z/edit
p1 = polyfit(windspeed(1:max_index),cp(1:max_index),3);

% root estimating to find speeds
fy1 = @(x) p1(1)*x.^3 + p1(2)*x.^2 + p1(3)*x + p1(4);
Wc = fzero(fy1,3.6);
% 
xy1 = Wc: 1e-6 :windspeed(max_index);
y1 = polyval(p1,xy1);

hold on
plot(xy1,y1,'b-') % plot the first curve

hold on
plot(Wc,fy1(Wc),'b*') % plot root

p2 = polyfit(windspeed(15:end),cp(15:end),3); % index 15 since its the first point to change

% root estimating to find speeds
fy2 = @(x) p2(1)*x.^3 + p2(2)*x.^2 + p2(3)*x + p2(4);
% find cut out speed
Wcut = fzero(fy2,26);
 
xy2 = windspeed(15): 1e-6 :Wcut;
y2 = polyval(p2,xy2);

% find furling speed
% new eqn minus the max of second eqn
fy3 = @(x) polyval(p1,x) - max(polyval(p2,xy2));
Wf = fzero(fy3,21);

hold on
plot(xy2,y2,'r-') % plot the second curve

hold on
plot(Wc,fy1(Wc),'b*','markersize',15) % plot root
text(Wc+1,fy1(Wc)+1, "Cut-in Speed", 'Fontsize', 10)

hold on 
plot(Wf,fy2(Wf),'b*','markersize',15) % plot root
text(Wf+1,fy1(Wf)+1, "Furling Speed", 'Fontsize', 10)

hold on 
plot(Wcut,fy2(Wcut),'b*','markersize',15) % plot root
text(Wcut,fy2(Wcut)+1, "Cut-out Speed", 'Fontsize', 10)
legend("Data Points","First Curve","Speeds","Second Curve",Location="northwest")




