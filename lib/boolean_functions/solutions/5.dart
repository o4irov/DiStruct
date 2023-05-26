//Функция нахождения нахождения существенных переменных
//Возвращает массив bool переменных result, в котором значению элемента соответствует утверждение: "переменная является существенной"
import 'package:discret_math/boolean_functions/solutions/2.dart';

List<bool> getEssentialVariables(String func) {
  int length = func.length;
  int args = 0;
  //вычисляем количество переменных
  while (length > 1) {
    length ~/= 2;
    args++;
  }
  //создаём массив типа bool и заполняем его, исходя из того, что все переменные фиктивные
  List<bool> result = List.filled(args, false);
  for(int i = 0; i < args; i++){
    //сравниваем остаточные по каждой переменной(условие существенности)
    String nuller = residual(func, 0, i);
    String single = residual(func, 1, i);
    //вносит результат сравнения в массив
    result[i] = (nuller == single);
  }
  return result;
}
