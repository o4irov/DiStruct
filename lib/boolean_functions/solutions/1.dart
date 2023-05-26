//Генерация функции от args перемнных
import 'dart:math';

String randFunction(int args) {
  String fun = '';
  for (int i = 0; i < pow(2, args); i++) {
    fun += Random().nextInt(2).toString();
  }
  return fun;
}
