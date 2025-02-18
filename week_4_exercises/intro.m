DieselInCar = 9;
Limit = 10;
MoreDiesel = Limit - DieselInCar;

if (DieselInCar < Limit)
    DieselInCar = DieselInCar + MoreDiesel;
end

wages = 0;
tax = 0.8;
breakdeduction = 6.50;

disp('You have just completed a day of work. Please enter your break duration (in seonds) to see your pay.')
breakduration = input('Enter break duration:');

for i = 1:8
    wages = wages + 12.50;
end

if breakduration > 1 %%wageshouldworkoutat 74.80
    wagewithbreakdeduction = wages - breakdeduction;
    wagebeforetax = wagewithbreakdeduction;
    yourwage = tax*wagewithbreakdeduction;
    moneygoingtokierstarmer = wagewithbreakdeduction - yourwage;
    disp('Wages before break deduction')
    disp(wages)
    disp('Wages after break deduction')
    disp(wagebeforetax)
else
    wagebeforetax = wages;
    yourwage = tax*wages;
    moneygoingtokierstarmer = wages - yourwage;
end

disp('Wages before tax')
disp(wagebeforetax)

disp('Wages after tax')
disp(yourwage)

disp('Money going to Kier Starmer')
disp(moneygoingtokierstarmer)