import 'dart:io';
import 'dart:math';
 void main() {
print('Добро пожаловать! Выберите режим игры\n1)Угадывает пользователь \n2)Угадывает компьютер \n3)Соревнование');

int choice = int.parse(stdin.readLineSync()!);
switch (choice) {
  case 1:
  userFind();
  break;
  case 2:
  pcFind();
  break;
  case 3:
  challenge();
  break;
  default:
  main();
  }
}

userFind() {
  int nubmer = Random().nextInt(100);
  int counter = 0;

  while(true) {
    counter++;
    print('Компьютер выбирает число от 0 до 100');

    int anwer = int.parse(stdin.readLineSync()!);
    if (anwer == nubmer) {
      print('Ты угадал за $counter попыток');
      break;
    }else if (anwer < nubmer) {
      print('Число больше');
    }else if (anwer > nubmer) {
      print('Число меньше');
    }
  }
  return counter;
  main();
}

int pcFind() {
 double min = 0;
 double max = 100;
 int counter = 0;

 while(true){
  counter++;
  print('Загадай число от 0 до 100');
  double answerNumber = min + (max - min) / 2;
  print('''Ваше число ${answerNumber.round()}
1) Больше
2) Меньше
3) ДА это мое число''' );
String answer = stdin.readLineSync()!;
if(answer == '1'){
  min = answerNumber;
}else if(answer == '2'){
  max = answerNumber;
}else if(answer == '3'){
  print('Ты угадал за $counter попыток');
  break;
  }
 }
 return counter;
 main();
}

challenge() {
  int pc = pcFind();
  int user = userFind();

  if(pc < user){
    print('Выйграл Компьютер'); 
  }else if (pc > user){
    print('Выйграл пользователь');    
  }else {
    print('Победила дружба');
  }
  main();
}
