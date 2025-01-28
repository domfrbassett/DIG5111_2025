Fs = 44100; % Sample rate in Hz
dur = 3; % Duration in seconds
freq = 100; % Frequency in Hz
theta = 0; % Phase offset in radians
A = 0.5;
sig = DomsSineWave(A, freq,Fs, dur, theta);
sound(sig, Fs);