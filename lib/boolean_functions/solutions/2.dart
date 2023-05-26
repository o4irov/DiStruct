//Функция нахождения остаточной по функции funcStr от переменной argNum по нулю/единице value
import 'dart:math';

String residual(String funcStr, int value, int argNum) {
  String residual = '';

  //Размер шага, для функции от 3 аргументов, argNum = 0 step = 4, для argNum = 1 step = 2, для argNum = 2, step = 1
  int step = (funcStr.length / pow(2, argNum + 1)).round();
  for(int i = value * step; i < funcStr.length; i += 2 * step){
    for(int j = 0; j < step; j++){
      residual += funcStr[i + j];
    } 
  }

  return residual;
}
