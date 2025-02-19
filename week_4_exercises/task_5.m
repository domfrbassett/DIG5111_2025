fs = 44100;
t = 0:1/fs:1;
inputSignal = sin(2 * pi * 440 * t);

gain = 5;
outputSignal = softClipTanh(inputSignal, gain);
outputSignal = outputSignal / max(abs(outputSignal));

% Plot input vs. output
figure;
plot(t, inputSignal, 'b', t, outputSignal, 'r');
legend('Input Signal', 'Clipped Signal');
xlabel('Time (s)');
ylabel('Amplitude');
title('Soft Clipping Using Hyperbolic Tangent');
grid on;
sound(outputSignal, fs);