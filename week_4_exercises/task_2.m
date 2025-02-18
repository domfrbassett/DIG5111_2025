fs = 11025;
ts = 1/fs;
duration = 1;
t = 0:1/fs:duration-ts;
f = 660;

x = sin(2*pi*f*t);

y = x; 
for i = 1:length(y)
    if (y(i) < -0.1) 
        y(i) = -0.1;
    end 
end

plot(y), axis([0, fs/f, -1, 1]); grid on; hold off;