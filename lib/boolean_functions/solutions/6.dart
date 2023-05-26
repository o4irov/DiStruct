import 'dart:math';

String add62(String s, dynamic jsdnf) {
  try {
    String dnf = jsdnf.toString();
    int x = s.length;
    int sz = 1;
    while (x > 2) {
      x = (x / 2).floor();
      sz++;
    }

    List<String> alt = ["A", "B", "C", "D", "E", "F"];
    Map<String, String> alf = {
      "A": "0",
      "B": "0",
      "C": "0",
      "D": "0",
      "E": "0",
      "F": "0"
    };

    List<String> el = dnf.split('v');

    List<String> res = [];
    for (int i = 0; i < pow(2, sz); i++) {
      String s1 = "";
      for (int j = 0; j < sz; j++) {
        s1 = "${i % 2}$s1";
        i = (i / 2).floor();
      }
      res.add(s1);
    }

    String setdnf = dnf.split("").toSet().join();
    setdnf = String.fromCharCodes(setdnf.runes.toList()..sort());
    int k = 0;

    if (dnf.length == 1) {
      el[0] = "";
      for (int i = 0; i < res.length; i++) {
        el[0] = "${el[0]}${res[i][alt.indexOf(dnf)]}";
      }
    } else if (dnf[0] == '-' && dnf.length == 2) {
      dnf = dnf.substring(1);
      String temp = "";
      for (int i = 0; i < res.length; i++) {
        temp = "${temp}${res[i][alt.indexOf(dnf)]}";
      }
      String temp2 = "";
      for (int y = 0; y < temp.length; y++) {
        temp2 = "${temp2}${(int.parse(temp[y]) + 1) % 2}";
      }
      el[0] = temp2;
    } else {
      for (int i = 0; i < setdnf.length; i++) {
        for (int j = 0; j < alf.length; j++) {
          if (setdnf[i] == alt[j]) {
            String temp = "";
            for (int y = 0; y < res.length; y++) {
              temp = "${temp}${res[y][k]}";
            }
            alf[alt[j]] = temp;
            k++;
          }
        }
      }

      for (int i = 0; i < el.length; i++) {
        List<String> zm = el[i].split("");
        int k = zm.length;
        for (int j = 0; j < k; j++) {
          if (j >= k) {
            continue;
          } else if (zm[j] == '-') {
            zm.removeAt(j);
            k = zm.length;
            String temp = alf[zm[j]] ?? 'er';
            String temp2 = "";
            for (int y = 0; y < (alf[zm[j]] != null ? alf[zm[j]]!.length : 0); y++) {
              temp2 = "${temp2}${(int.parse(temp[y]) + 1) % 2}";
            }
            zm[j] = temp2;
            continue;
          } else if (alt.contains(zm[j])) {
            zm[j] = alf[zm[j]] ?? 'er';
          }
        }
        el[i] = zm.join();
      }
      for (int i = 1; i < el.length; i++) {
        String res2 = el[i];
        String res = "";
        String respr = "";
        for (int y = 0; y < s.length; y++) {
          int temp = int.parse(el[0][y]) + int.parse(res2[y]); //дизъюнкция
          if (temp > 1) {
            temp = 1;
            respr = respr + temp.toString();
          } else {
            respr = respr + temp.toString();
          }
        }
        el[0] = respr;
      }
    }
    if(s == el[0]){
      return "true";
    }
    else{
      return "false";
    }
  } catch (e) {
    return ('проверьте правильность ввода');
  }
}