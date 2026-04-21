clear all; 
close all; 
clc; 

d = [10:0.5:10000]; 
c = 3e8; 
parameters = [22.5 1.5 1.8e9; 
              7.5 1.5 1.8e9;
              7.5 1.5 0.9e9];
LFE_dB_Arr = []; 

for(k=1:length(parameters))
    hb = parameters(k, 1); 
    hm = parameters(k, 2); 
    fc = parameters(k, 3); 
    lam = c/fc; 
    term1 = (lam ./ (4 * pi * d)).^2;
    term2 = 4 * (sin((2 * pi * hb * hm)./(lam * d)).^2);
    LFE = 1./(term1 .* term2);
    LFE_dB = 10 * log10(LFE);
    LFE_dB_Arr = [LFE_dB_Arr; LFE_dB];
end



figure; 
plot(d, LFE_dB_Arr(1,:), 'r')
hold on
plot(d, LFE_dB_Arr(2,:), 'g')
hold on
plot(d, LFE_dB_Arr(3,:), 'b')
hold on
xlabel('Distance (m)') %Labelsthe x-axis
set(gca, 'XScale', 'log', 'YScale', 'log')
ylabel('PL (dB)') %Labels the y-axis
ylim([10, 1000]);
legend(' h_b = 22.5, h_m = 1.5, f_c = 1.8GHz',' h_b = 7.5, h_m = 1.5, f_c = 1.8GHz',' h_b = 7.5, h_m = 1.5, f_c = 0.9GHz') %Creates the legend
title('Two ray  model Pathloss versus Distance') %give a title to the figure
