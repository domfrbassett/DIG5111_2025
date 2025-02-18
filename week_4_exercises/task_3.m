f = input("Enter frequency: ");
fs = 11025;
ts = 1/fs;
duration = 1;
t = 0:1/fs:duration-ts;

x = sin(2*pi*f*t);

clip1 = input("Choose lower clipping limit: ");
clip2 = input('Choose higher clipping limit: ');

if clip1 > clip2
    cliphigher = clip1;
    cliplower = clip2;
else
    cliphigher = clip2;
    cliplower = clip1;
end

y = x; 
for i = 1:length(y)
    if (y(i) < cliplower) 
        y(i) = cliplower;
    elseif (y(i) > cliphigher) 
        y(i) = cliphigher;
    end 
end

plot(y), axis([0, fs/f, -1, 1]); grid on; hold off;