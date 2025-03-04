%Exercise one

NoiseFs = 22050;
NoiseDur = 2;
NumSamples = NoiseFs*NoiseDur;
Noise = randn(NumSamples, 1);
sound(Noise, NoiseFs);

a = 1;
b = Bandpass.Numerator;
stem(b);
newnoise1 = conv(Noise, b);
newnoise2 = filter(b, a, Noise);

sound(newnoise1, NoiseFs);
pause(NoiseDur + 0.5);
sound(newnoise2, NoiseFs);

lenA = length(newnoise1);
lenB = length(newnoise2);
lengthDifference = abs(lenA - lenB);
disp(['The difference in length between the arrays is: ', num2str(lengthDifference)]);