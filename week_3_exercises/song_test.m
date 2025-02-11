C5=note(1,52,0.2);
B4=note(1,51,0.2);
A4=note(1,49,0.2);
Ab4=note(1,48,0.2);
F4=note(1,45,0.2);
E4=note(1,44,0.2);
C4=note(1,40,0.2);
D4=note(1,42,0.2);
G4=note(1,47,0.2);
FSh4=note(1,46,0.2);
DSh4=note(1,43,0.2);
ASh4=note(1,50,0.2);
A3=note(1,37,0.2);
ASh3=note(1,38,0.2);
D5=note(1,54,0.2);
Sil=note(0,40,0.2);
C5long=note(1,52,0.4);
F3=note(1,33,0.2);
C3=note(1,28,0.2);

Melody = horzcat(C5,B4,C5,A4,Ab4,A4,F4,E4,F4,C4,Sil,Sil,A3,ASh3,C4,D4,E4,F4,G4,A4,ASh4,G4,Sil,Sil,ASh4,A4,ASh4,G4,FSh4,G4,E4,DSh4,E4,C4,Sil,Sil,C5,C5,C5,D5,C5,ASh4,A4,G4,F4,Sil,Sil,C5long,B4,C5,A4,Ab4,A4,F4,E4,F4,C4,Sil,Sil,A3,ASh3,C4,D4,E4,F4,G4,A4,ASh4,G4,Sil,Sil,ASh4,A4,ASh4,G4,FSh4,G4,E4,DSh4,E4,C4,Sil,Sil,C5,C5,C5,D5,C5,ASh4,A4,G4,F4);
Bass = horzcat(Sil,Sil,F3,C4,C4,C3,C4,C4,F3,C4,C4,C3,C4,C4,C4,D4,E4,F4,G4,A4,ASh4,G4,Sil,Sil,ASh4,A4,ASh4,G4,FSh4,G4,E4,DSh4,E4,C4,Sil,Sil,C5,C5,C5,D5,C5,ASh4,A4,G4,F4,Sil,Sil,C5long,B4,C5,A4,Ab4,A4,F4,E4,F4,C4,Sil,Sil,A3,ASh3,C4,D4,E4,F4,G4,A4,ASh4,G4,Sil,Sil,ASh4,A4,ASh4,G4,FSh4,G4,E4,DSh4,E4,C4,Sil,Sil,C5,C5,C5,D5,C5,ASh4,A4,G4,F4);

Song = Melody+Bass;
SongOutput = Song/max(abs(Song));
audiowrite("crap.wav", SongOutput, fs);