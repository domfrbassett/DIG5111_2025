fs = 11025;
ts = 1/fs;
t = 0:1/fs:duration-1/fs;
duration = 2;
f = 440;

x = sin(2*pi*f*t);

thresh1 = 0.5;
thresh2 = -0.5;
y = x;
y(y > thresh1) = thresh1;
y(y < thresh2) = thresh2;
figure;
subplot (2,1,1);
plot(t(1:100), x(1:100))
hold on
subplot (2,1,2);
plot(t(1:100), y(1:100))
ylim([-1,1])
xlabel('Time')
sound(y,fs);