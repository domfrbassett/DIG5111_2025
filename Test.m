% Signal 1: 20 Hz
Amp = 0.5;  % Amplitude
f1 = 20;    % Frequency in Hz
fs = 10000; % Sampling frequency in Hz
t = 0:1/fs:1-(1/fs); % Time vector for 1 second
sig1 = Amp * sin(2 * pi * f1 * t); % Generate signal

% Signal 2: 200 Hz
f2 = 200; % Frequency in Hz
sig2 = Amp * sin(2 * pi * f2 * t); % Generate signal

% Signal 3: 1000 Hz
f3 = 1000; % Frequency in Hz
sig3 = Amp * sin(2 * pi * f3 * t); % Generate signal

% Plot all three signals in one figure
figure;
subplot(3, 1, 1);
plot(t(1:500), sig1(1:500)); % Plot first 500 points
title('Signal 1 (20 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
plot(t(1:500), sig2(1:500)); % Plot first 500 points
title('Signal 2 (200 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 3);
plot(t(1:500), sig3(1:500)); % Plot first 500 points
title('Signal 3 (1000 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

sgtitle('Periodic Signals with Different Frequencies');