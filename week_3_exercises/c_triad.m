NoteC=note(0.7, 40, 2);
NoteE=note(0.5, 44, 2);
NoteG = note(0.5, 47, 2);
fs = 11025;
 
y = NoteC + NoteE + NoteG;
y_norm = y/max(abs(y));
%sound(Ctriad,11025); 
audiowrite('Ctriad.wav', y_norm, fs);