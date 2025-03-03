fs = 22050; % Sampling frequency
duration = 1; % Duration in seconds
samples = fs * duration; % Total number of samples

noise_signal = randn(samples, 1); % Generate Gaussian white noise

signalAnalyzer(noise_signal);

max_amp = max(abs(noise_signal)); % Find the maximum absolute amplitude
normalized_noise = noise_signal / max_amp; % Normalize to range [-1, 1]

audiowrite("normalized_noise.wav", normalized_noise, fs);
disp('Noise signal saved as normalized_noise.wav');