// функция для построения CКНФ по заданному вектору функции в виде строки
import 'dart:math';

String buildSKNF(String vector) {
  String sknf = "";

  int n = (log(vector.length) / log(2))
      .floor(); // вычисление количества переменных в функции

  // генерация всех возможных комбинаций переменных
  for (int i = 0; i < pow(2, n); i++) {
    if (vector[i] == "0") {
      String variables = "";

      // преобразование номера комбинации в двоичный вид и добавление нулей слева до длины n
      String binary = i.toRadixString(2).padLeft(n, '0');

      // добавление переменных в комбинацию в соответствии с двоичным номером
      for (int j = 0; j < n; j++) {
        variables += binary[j] == '1' ? "!x${j + 1} | " : "x${j + 1} | ";
      }

      // добавление значения функции в CКНФ
      sknf += "(${variables.substring(0, variables.length - 3)}) & ";
    }
  }

  // удаление последнего символа "&" и возврат CКНФ
  return sknf.length > 3 ? sknf.substring(0, sknf.length - 3) : '';
}
