
clear all; 
close all; 
clc; 


rawd = [0 3 6 9 12 15 18 21 24]; 
% Vertical distance -> 7.4m
% Horizontal distance -> 1.6m + d 
% c^2 = a^2 + b^2
% c = sqrt(a^2 + b^2)
% c = sqrt((1.6+rawd)^2 + 7.4^2)

d = [];

for(k = 1:length(rawd))
    actuald = sqrt((1.6+rawd(k))^2 + 7.4^2);
    d = [d actuald];
end

powerReceived2GHz = [16.8882 16.8732 15.69445 17.2871 5.79655 9.1847 6.90825 2.86855 0.0129]; % dBmW 
powerReceived914MHz = [17.7655 13.3789 17.5898 13.224 0.29165 10.175 -0.23835 3.90135 -2.6276]; % dBmW 

P = polyfit(log10(d), powerReceived2GHz, 1);
polyFitDistance = 1:1:100; 
fittedPower2GHz = polyval(P, log10(polyFitDistance));

P914MHz = polyfit(log10(d), powerReceived914MHz, 1); 
fittedPower914GHz = polyval(P914MHz, log10(polyFitDistance));


plot(polyFitDistance, fittedPower2GHz, '--r');
hold on
plot(polyFitDistance, fittedPower914GHz, '--b');
hold on
plot(d, powerReceived2GHz, 'r');
hold on
plot(d, powerReceived914MHz, 'b');
set(gca, "XScale", "log")
