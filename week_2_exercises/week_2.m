%%Tasks 1-4

Filename = "piano_middle_C.wav";
[Sig,fs]=audioread(Filename);
dur = length(Sig)/fs;
disp(dur)
Ts = 1/fs;
Time = 0:Ts:dur - Ts;
plot(Time, Sig);
title('Piano middle C in time domain');
ylabel('Amplitude:'); 
xlabel('Time Sec:');

%%Task 5
%%Parts one and two
info = audioinfo(Filename);
disp(info);
fileinfo = dir(Filename);
fileSizeBytes = fileinfo.bytes;
disp(['File size on disk: ', num2str(fileSizeBytes), ' bytes']);

%%Part three
t1 = 0.5;
t2 = 1;
ssi = round(t1*fs);
esi = round(t2*fs);
[~,fs] = audioread(Filename, [ssi, esi]);

part_sig = Sig(ssi:esi);
disp(['Partial signal contains ', num2str(length(part_sig)), ' samples']);

%%Part four

[mono, fs] = audioread(Filename);
Stereo_signal = [mono,mono];
audiowrite('stereo_signal.wav', Stereo_signal, fs);

%%Part five

[nat, fs] = audioread(Filename, 'native');

figure;
subplot(2,1,1);
plot(Time, nat);
title('Mono signal (native) over time');
xlabel('Time (s)');
ylabel('Amplitude');

%%The amplitude is much larger on this plot because it
%%plots raw 16-bit PCM values (that can vary between -32,768 and 32,767)
%%as opposed to normalised floating-point values [-1, 1]

%%Part six

max_value = double(intmax(class(nat)));
nat_norm = double(nat)/max_value;
time_new = (0:length(nat)-1) / fs;

subplot(2,1,2);
plot(time_new, nat_norm);
title('Normalised native signal');
xlabel('Time (s)');
ylabel('Amplitude');

%%Part seven

%%y = rms(x) returns the root mean square (RMS) value of the input, x

[sig_for_rms,fs] = audioread(Filename);
rms_sig = rms(sig_for_rms);
norm_rms_sig = (sig_for_rms/rms_sig) * 0.5;
sound(sig_norm_for_rms, fs);

t_rms = (0:length(sig_for_rms)-1)/fs;

figure;
subplot(2,1,1)
plot(t_rms, sig_for_rms);
title('OG signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2)
plot(t_rms, norm_rms_sig);
title('Normalised Signal (0.5*RMS)');
xlabel('Time (s)');
ylabel('Amplitude');