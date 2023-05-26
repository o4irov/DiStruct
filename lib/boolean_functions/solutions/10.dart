bool isNuller(String func){
  return func[0] == '0';
}

bool isOne(String func){
  return func[func.length - 1] == '1';
}

bool isSelfDual(String func) {
  int n = func.length;
  for (int i = 0; i < n; i++) {
    if (func[i] != func[n-1-i]) {
      return false;
    }
  }
  return true;
}

bool isMonotonic(String func) {
  int n = func.length;
  for (int i = 0; i < n; i++) {
    for (int j = i+1; j < n; j++) {
      if (int.parse(func[i]) > int.parse(func[j]) && (i & j) == i) {
        return false;
      }
    }
  }
  return true;
}

bool isLinear(String func) {
  int n = func.length;
  for (int i = 0; i < n; i++) {
    for (int j = i+1; j < n; j++) {
      for (int k = j+1; k < n; k++) {
        for (int l = k+1; l < n; l++) {
          if ((int.parse(func[i]) ^ int.parse(func[j]) ^ int.parse(func[k]) ^ int.parse(func[l])) != 0) {
            return false;
          }
        }
      }
    }
  }
  return true;
}

List<bool> Closed(String func){
  return [isNuller(func), isOne(func), isSelfDual(func), isMonotonic(func), isLinear(func)];
}
