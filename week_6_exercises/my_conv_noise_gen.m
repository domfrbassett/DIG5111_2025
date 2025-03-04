NoiseFs = 48000;
NoiseDur = 2;
NumSamples = NoiseFs*NoiseDur;
Noise = randn(NumSamples, 1);

b = Lowpass.Numerator;
stem(b);
CustomOutput = my_convolution(Noise, b);

sound(CustomOutput, NoiseFs);