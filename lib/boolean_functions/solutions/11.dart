import 'dart:math';

import 'package:discret_math/boolean_functions/solutions/1.dart';

import '10.dart';

List<bool> isComplete(String functions) {
  functions = functions.substring(1, functions.length - 1);
  List<String> system = functions.split(', ');
  List<bool> result = [false, false, false, false, false];
  for(int i = 0; i < functions.length; i++){
    result[0] = isNuller(functions[i]);
    result[1] = isOne(functions[i]);
    result[2] = isSelfDual(functions[i]);
    result[3] = isMonotonic(functions[i]);
    result[4] = isLinear(functions[i]);
  }

  result.add(!result.contains(true));

  return result;
}

String generateSystem() {
  print(isComplete('01011110'));
  String result = '{';
  List<String> system = [];
  int size = (Random().nextInt(4) + 1);
  for (int i = 0; i < Random().nextInt(7) + 1; i++) {
    String func = randFunction(size);
    result += '$func, ';
    system.add(func);
  }
  result = result.substring(0, result.length - 2);
  result += '}';
  return result;
}
