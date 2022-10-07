% Q3

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Wee Jun Lin
% ID   : 32620861
% Date Modified : 27/9/2022

fprintf('\n Q3 \n\n')
%%
%Add your code here
% variables
data_file = importdata('avg_wind_data.txt').data;
height = data_file(:,1);
avg_ararat = data_file(:,2);
avg_silver = data_file(:,3);
avg_boco = data_file(:,4);

figure(4)
plot(height,avg_ararat,'bo','MarkerSize',5)
xlabel("Height(m)");ylabel("Average wind speed (m/s)");

hold on 

plot(height,avg_silver,'r*','MarkerSize',9)
xlabel("Height(m)");ylabel("Average wind speed (m/s)");


plot(height,avg_boco,'m--^','MarkerSize',8)
xlabel("Height(m)");ylabel("Average wind speed (m/s)");
hold on

% Fit a suitable model
% equation : wh = w0*(h/h0)^alpha
% fit using power model 
% log10(wh) = alpha*(log10(h)-log10(h0)+log10(w0))

h0 = 100; % initial height

% find coefficients
p_ararat = polyfit(log10(height/h0),log10(avg_ararat),1);
p_boco = polyfit(log10(height/h0),log10(avg_boco),1);
p_silver = polyfit(log10(height/h0),log10(avg_silver),1);

% alpha values
a_ararat = p_ararat(1);
a_boco = p_boco(1);
a_silver = p_silver(1);

% initial wind speeds
w0_ararat = 10^p_ararat(2);
w0_boco = 10^ p_boco(2);
w0_silverton = 10^p_silver(2);

% anon function for plotting
y_ara = @(h) w0_ararat.*(h/h0).^a_ararat;
y_boc = @(h) w0_boco.*(h/h0).^a_boco ;
y_silv = @(h) w0_silverton.*(h/h0).^a_silver;

% functions for the sites
y_ararat = y_ara(height);
y_boco = y_boc(height);
y_silver = y_silv(height);

% plot the fitted lines

plot(height,y_ararat,'b');
hold on;
plot(height,y_silver,'r--');
hold on;

plot(height,y_boco,'m-');
hold on;

% find r2 values for each equation
r2_ararat = r2nonlin(y_ara,height,avg_ararat);
r2_boco = r2nonlin(y_boc,height,avg_boco);
r2_silver = r2nonlin(y_silv,height,avg_silver);

%Print results

% print r2 values of each equation
fprintf('r^2 of Ararat is %.7f\n',r2_ararat)
fprintf('r^2 of Boco is %.7f\n',r2_boco)
fprintf('r^2 of Silverton is %.7f\n',r2_silver)

% print likely terrain sites
ter_ararat = '';
ter_boco = '';
ter_silver = '';

% compare alpha values to the table
%%
if a_ararat > 0.0001 && a_ararat < 0.001
    ter_ararat = 'Minimal impact e.g., open water, smooth snow fields, barren terrains.';
elseif a_ararat > 0.001 && a_ararat < 0.01
    ter_ararat = 'Featureless terrain e.g., deserts, flat grass plains, glaciers.';
elseif a_ararat > 0.01 && a_ararat < 0.1 
    ter_ararat = 'Flat terrain e.g., grass fields, airport runways.';
elseif a_ararat > 0.1 && a_ararat < 0.5 
    ter_ararat = 'Elements separated by large distances, e.g., scattered shelters, low-rising crops.';
elseif a_ararat > 0.5 && a_ararat < 1
    ter_ararat = 'Landscape with moderate occurrences e.g., vegetation, bushes, new dense forests.';
elseif a_ararat > 1 && a_ararat < 2
    ter_ararat = 'Larger elements uniformly distributed, e.g., mature forest, low-rise built-up areas.';
else
    ter_ararat = 'Irregular distribution of large elements, e.g., city centres, forests with clearings.';
end

if a_boco > 0.0001 && a_boco < 0.001
    ter_boco = 'Minimal impact e.g., open water, smooth snow fields, barren terrains.';
elseif a_boco > 0.001 && a_boco < 0.01
    ter_boco = 'Featureless terrain e.g., deserts, flat grass plains, glaciers.';
elseif a_boco > 0.01 && a_boco < 0.1 
    ter_boco = 'Flat terrain e.g., grass fields, airport runways.';
elseif a_boco > 0.1 && a_boco < 0.5 
    ter_boco = 'Elements separated by large distances, e.g., scattered shelters, low-rising crops.';
elseif a_boco > 0.5 && a_boco < 1
    ter_boco = 'Landscape with moderate occurrences e.g., vegetation, bushes, new dense forests.';
elseif a_boco > 1 && a_boco < 2
    ter_boco = 'Larger elements uniformly distributed, e.g., mature forest, low-rise built-up areas.';
else
    ter_boco = 'Irregular distribution of large elements, e.g., city centres, forests with clearings.';
end

if a_silver > 0.0001 && a_silver < 0.001
    ter_silver = 'Minimal impact e.g., open water, smooth snow fields, barren terrains.';
elseif a_silver > 0.001 && a_silver < 0.01
    ter_silver = 'Featureless terrain e.g., deserts, flat grass plains, glaciers.';
elseif a_silver > 0.01 && a_silver < 0.1 
    ter_silver = 'Flat terrain e.g., grass fields, airport runways.';
elseif a_silver > 0.1 && a_silver < 0.5 
    ter_silver = 'Elements separated by large distances, e.g., scattered shelters, low-rising crops.';
elseif a_silver > 0.5 && a_silver < 1
    ter_silver = 'Landscape with moderate occurrences e.g., vegetation, bushes, new dense forests.';
elseif a_silver > 1 && a_silver < 2
    ter_silver = 'Larger elements uniformly distributed, e.g., mature forest, low-rise built-up areas.';
else
    ter_silver = 'Irregular distribution of large elements, e.g., city centres, forests with clearings.';
end
%%

fprintf("The terrain of Ararat is %s\n",ter_ararat)
fprintf("The terrain of Boco Rock is %s\n",ter_boco)
fprintf("The terrain of Silver is %s\n",ter_silver)

%part b 
% anonymous function
h0_fixed = 80; % corrected height

% anon function for plotting
y_new = @(w0,h,alpha) w0.*(h/h0_fixed).^alpha;





