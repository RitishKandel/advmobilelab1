%%
clear all; 
close all; 
clc;
%% Computing FSPL
fc = 1800e6; 
c = 3e8; 
d = [100:50:1000]; 
lam = c/fc; 

PL = (4 * pi * d/lam).^2; % the dot perform element by element calculation
PL_dB = 10*log10(PL);


%% Computing FSPL for multiple carrier frequencies using a for loop
fc_vector = [1800e6 2400e6 5800e6]; 
c = 3e8; 
d = [100:50:1000]; 
PL_dB_fc = []; 

for(k=1:length(fc_vector))
    lam = c/fc_vector(k); 
    PL = (4 * pi * d/lam).^2; 
    PL_dB = 10*log10(PL); 
    PL_dB_fc = [PL_dB_fc; PL_dB];
end
%% Plotting
figure; 
plot(d, PL_dB_fc(1,:), 'g-^')
hold on
plot(d, PL_dB_fc(2,:), 'r-*')
hold on
plot(d, PL_dB_fc(3,:), 'b-o')
hold on
xlabel('Distance (m)') %Labelsthe x-axis
ylabel('PL (dB)') %Labels the y-axis
legend('f_c = 1.8GHz',' f_c = 2.4GHz',' f_c = 5.8GHz') %Creates the legend
title('Free Space Pathloss versus Distance') %give a title to the figure

figure %This creates a new figure
%Plot first row of PL_dB_fc with d, the curve is in green 'g' colour with a marker '^'. The x-axis is in log scale
semilogx(d, PL_dB_fc(1,:),'g-^')
hold on %The figure is held to make successive plots on the same figure
%Plotsecond row of PL_dB_fc with d, the curve is in green 'r' colour with a marker '*'. The x-axis is in log scale
semilogx(d, PL_dB_fc(2,:),'r-*')
%Plot the third row of PL_dB_fc with d, the curve is in green 'b' colour with a marker 'o'. The x-axis is in log scale
semilogx(d, PL_dB_fc(3,:),'b-o')
xlabel('Distance (m)') %Labelsthe x-axis
ylabel('PL (dB)') %Labels the y-axis
legend('f_c = 1.8GHz',' f_c = 2.4GHz',' f_c = 5.8GHz') %Creates the legend
title('Free Space Pathloss versus Distance') %give a title to the figure

%%