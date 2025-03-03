function [noteX, t] = note(A, keynum, dur)
%function note() will create a note with sampling frequency 11025 by given
%any key and any time duration.
Fs = 11025;
Ts = 1/Fs;
A4=440;
ref_key=49;     %A4 is the 49th Key in piano keyboard 
n = keynum-ref_key;  %Calculate the difference between ref_key and input Key
freq = A4*2^(n/12); %Calculate the frequency of input Key
t = 0:Ts:dur;

noteX=A*sin(2*pi*freq*t);
end