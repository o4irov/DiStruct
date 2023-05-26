//Функция построения вектора булевой функции по остаточным от нуля neller от единицы single от аргумента argNum
import 'dart:math'; 

String function(String nuller, String single, int argNum) {
  String fun = nuller + single;
  int step = (fun.length / pow(2, argNum)).round();
  String result = '';
  for(int i = 0; i < nuller.length; i+=step){
    for(int j = 0; j < step; j++){
      result += nuller[i + j];
    }
    for(int j = 0; j < step; j++){
      result += single[i + j];
    }
  }
  return result;
}