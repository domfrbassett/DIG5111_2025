[sig_pluck, Fs] = audioread('pluck.wav');

% Define the echo delays in milliseconds and convert them to seconds.
% The chosen delays simulate a series of echoes:
%   - A very short delay (1 ms) creates a near-immediate reinforcement.
%   - Subsequent delays (100, 200, ..., 800 ms) simulate later echoes,
%     similar to what one might experience in a reflective environment.

delay_ms = [1, 100, 200, 300, 400, 500, 600, 700, 800]; %time positions
delay_sec = delay_ms / 1000; %convert ms to secs
samplenum = round(Fs*t); %total number of samples

% Define the attenuation factors for each echo
% These factors reduce the amplitude of each subsequent echo,
% modeling natural energy loss
attenuation = [1, 0.5, 0.4, 0.3, 0.2, 0.1, 0.05, 0.025, 0.015];

% Create the impulse response (IR) for the echo effect
IR_length = Fs * 3;
Ir = zeros(IR_length, 1);

% Insert impulses at the correct sample positions
% with the corresponding attenuation factors
for k = 1:length(samplenum)
    Ir(samplenum(k)) = attenuation(k);
end

% Plot the impulse response using a proper time axis (in seconds).
time_axis = (0:IR_length-1) / Fs;
figure;
stem(time_axis, Ir);
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response with Delays and Attenuation');

% Apply the echo effect by convolving the original signal with the impulse response
y = conv(sig_pluck, Ir);

% Play the resulting sound with the echo effect
sound(y, Fs);