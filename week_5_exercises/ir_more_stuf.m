info = audioinfo('pluck.wav');

[sig_pluck, Fs] = audioread('pluck.wav');
[Ir, Fsir] = audioread('LargeHall.wav');

disp(Fs)
disp(Fsir)

[Ir2] = resample(Ir,Fs,Fsir);

y = conv(sig_pluck, Ir2(:,1));

function blended_sig = WetDry(dry, wet, ratio)

dry_length = length(dry);


y = y/max(abs(y))*0.2;
wetLevel = 0.5;
y = y(1:length(sig_pluck));
dry = sig_pluck;
output = (1 - wetLevel) * dry + wetLevel*y;
output = output/max(abs(output));

sound(output,Fs);