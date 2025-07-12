uses crt;

type
  TCalculation = record
    base, exponent: real;
    powerResult: real;
    factorialNumber: integer;
    factorialResult: longint;
  end;

label restart;

VAR
  firstName, lastName, course: string;
  midterm, finalExam, average: real;
  width, height, rectArea, rectPerimeter: real;
  radius, circleArea, circlePerimeter: real;
  celsius, fahrenheit: real;
  choice: integer;
  piValue: real;
  calc: TCalculation;

function PowerX(base, exponent: real): real;
begin
  PowerX := exp(exponent * ln(base));
end;

function CalculatePower(c: TCalculation): real;
begin
  CalculatePower := PowerX(c.base, c.exponent);
end;

function CalculateFactorial(n: integer): longint;
var
  i: integer;
  resultValue: longint;
begin
  resultValue := 1;
  for i := 1 to n do
    resultValue := resultValue * i;
  CalculateFactorial := resultValue;
end;

begin
  restart:
  piValue:=3.1415;
  clrscr; Textcolor(10);

  writeln('-----------MENU----------');
  writeln('[1]-Student Grade Calculation');
  writeln('[2]-Rectangle Area/Perimeter Calculation');
  writeln('[3]-Circle Area/Perimeter Calculation');
  writeln('[4]-Fahrenheit Conversion');
  writeln('[5]-Power Calculation');
  writeln('[6]-Factorial Calculation');
  writeln('[7]-Exit');
  writeln('-------------------------');
  write('Please enter your choice: ');
  readln(choice);

  case choice of
    1: begin
      write('Enter your first name        : '); readln(firstName);
      write('Enter your last name         : '); readln(lastName);
      write('Enter course name            : '); readln(course);
      write('Enter midterm score          : '); readln(midterm);
      write('Enter final exam score       : '); readln(finalExam);
      average := midterm*0.30 + finalExam*0.70;
      writeln('Student First Name       : ', firstName);
      writeln('Student Last Name        : ', lastName);
      writeln('Course Name              : ', course);
      writeln('Midterm Score            : ', midterm:0:2);
      writeln('Final Exam Score         : ', finalExam:0:2);
      writeln('Calculated Average       : ', average:0:2);
      readln; goto restart;
    end;

    2: begin
      write('Enter rectangle width        : '); readln(width);
      write('Enter rectangle height       : '); readln(height);
      rectArea := width * height;
      rectPerimeter := 2 * (width + height);
      writeln('Rectangle Area           : ', rectArea:0:2);
      writeln('Rectangle Perimeter      : ', rectPerimeter:0:2);
      readln; goto restart;
    end;

    3: begin
      write('Enter circle radius          : '); readln(radius);
      circleArea := piValue * radius * radius;
      circlePerimeter := 2 * piValue * radius;
      writeln('Circle Area              : ', circleArea:0:2);
      writeln('Circle Perimeter         : ', circlePerimeter:0:2);
      readln; goto restart;
    end;
  end;

  if(choice=4) then begin
    write('Enter temperature in Celsius: '); readln(celsius);
    fahrenheit := 32 + celsius * 9 / 5;
    writeln('Temperature in Fahrenheit   : ', fahrenheit:0:2);
    readln; goto restart;
  end;

  if(choice=5) then begin
    write('Enter base value             : '); readln(calc.base);
    write('Enter exponent value         : '); readln(calc.exponent);
    calc.powerResult := CalculatePower(calc);
    writeln(calc.base:0:2, ' raised to ', calc.exponent:0:2, ' = ', calc.powerResult:0:4);
    readln; goto restart;
  end;

  if(choice=6) then begin
    repeat
      write('Enter a positive integer for factorial: ');
      readln(calc.factorialNumber);
    until calc.factorialNumber >= 0;

    calc.factorialResult := CalculateFactorial(calc.factorialNumber);
    writeln(calc.factorialNumber, '! = ', calc.factorialResult);
    readln; goto restart;
  end;
  if (choice=7) then begin
    write('The program is closing...');
    delay(2500);
    exit;
  end;

end.
