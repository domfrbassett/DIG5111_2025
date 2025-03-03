% Get user input for wet level
wetLevel = input('Enter wet level (0 to 1): ');

% Ensure wet level is within the valid range
while wetLevel < 0 || wetLevel > 1
    disp('Error: Wet level must be between 0 and 1.');
    wetLevel = input('Enter wet level (0 to 1): ');
end

info = audioinfo('shit.wav');

[sig_pluck, Fs] = audioread('shit.wav');
[Ir, Fsir] = audioread('LargeHall.wav');

sig_pluck1 = sig_pluck(:,1);
sig_pluck2 = sig_pluck(:,2);

sigmono = (sig_pluck1 + sig_pluck2)./2;

disp(Fs)
disp(Fsir)

[Ir2] = resample(Ir,Fs,Fsir);

y = conv(sigmono, Ir2(:,1));

y = y/max(abs(y))*0.2;
y = y(1:length(sigmono));
dry = sigmono;
output = (1 - wetLevel) * dry + wetLevel*y;
output = output/max(abs(output));

sound(output,Fs);