fs = 44100;
ts = 1/fs;
duration = 1;
t = 0:1/fs:duration-ts;
f = 1;
x = -1:0.01:1;
NumberOfSteps = 3; 
% This is the number of steps we want to create in our signal 
% IE: the resolution. 
% This will create a straight line. 
% We will use this to demonstrate our transfer function. 
subplot(211), plot(x); grid on; hold on;
y = x*NumberOfSteps;
% y is the x value, scaled by the number of steps.
y = round(y);
% y is then rounded to the steps.
y = y*(1/NumberOfSteps); 
% we then divide by 1 to normalise the signal. 
plot(y, '--'); 
% plot our new signal with a dashed line.
z = sin(2*pi*f*t);
subplot(212), plot(z); grid on; hold on;
y2 = z*NumberOfSteps; 
y2 = round(y2); 
y2 = y2*(1/NumberOfSteps); 
plot(y2, '--');