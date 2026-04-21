%% 
clear all; 
close all; 
clc; 


rawd = [0 3 6 9 12 15 18 21 24]; 
% Vertical distance -> 7.4m
% Horizontal distance -> 4m + d 
% c^2 = a^2 + b^2
% c = sqrt(a^2 + b^2)
% c = sqrt((4+rawd)^2 + 7.4^2)

d = [];

for(k = 1:length(rawd))
    actuald = sqrt((4+rawd(k))^2 + 7.4^2);
    d = [d actuald];
end

powerReceived2GHz = [-53.2399 -60.578 -66.5438 -65.4492 -63.7637 -73.5806 -72.237 -69.8238 -70.274]; % dBmW 
powerReceived914MHz = [-53.9292 -57.5713 -64.219 -74.967 -75.9537 -80.1326 -77.036 -80.1087 -88.5612]; % dBmW 

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

%%