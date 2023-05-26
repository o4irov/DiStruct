import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/boolean_functions/3.dart';
import 'package:discret_math/boolean_functions/5.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FourthTask extends StatefulWidget {
  const FourthTask({super.key});

  @override
  State<FourthTask> createState() => _FourthTaskState();
}

class _FourthTaskState extends State<FourthTask> {
  var bf = '';
  var prevFunc = '';
  bool green = false;
  bool red = false;
  final _controller = TextEditingController();
  final List<Map<String, String>> _names = [
    {'Нулевая': '0000'},
    {'Конъюнкция': '0001'},
    {'Дизъюнкция': '0111'},
    {'Сложение': '0110'},
    {'Штрих Шеффера': '1110'},
    {'Стрелка Пирса': '1000'},
    {'Импликация': '1101'},
    {'Эквивалентность': '1001'},
    {'Коимпликация': '0010'},
    {'Обратная импликация': '1011'},
    {'Обратная коимпликация': '0100'},
    {'Отрицание первого аргумента': '1100'},
    {'Отрицание второго аргумента': '1010'},
    {'Первый аргумент': '0011'},
    {'Второй аргумент': '0101'},
    {'Единичная': '1111'}
  ];

  @override
  void initState() {
    super.initState();
    bf = randFunction(2);
    prevFunc = bf;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    List<Map<String, String>> getSuggestions(String query) {
      List<Map<String, String>> matches = [];
      matches.addAll(_names);

      matches.retainWhere(
          (s) => s.keys.first.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.of(context).push(SlideLeftRoute(page: const FivthTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const ThirdTask()));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              color: back,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  const Text(
                    '4. Узнайте имя функции от двух аргументов. По предложенной функции выберите её «имя».',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      bf,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TypeAheadField(
                    hideSuggestionsOnKeyboardHide: false,
                    suggestionsCallback: ((pattern) {
                      return getSuggestions(pattern);
                    }),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                          suggestion.keys.first.toString(),
                        ),
                        textColor: white,
                        tileColor: back,
                      );
                    },
                    onSuggestionSelected: ((suggestion) {
                      setState(() {
                        _controller.text = suggestion.keys.first.toString();
                      });
                    }),
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _controller,
                      style: TextStyle(color: blue),
                      decoration: InputDecoration(
                          fillColor: white,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: white)),
                          hintText: 'Начните вводить имя функции',
                          hintStyle: TextStyle(color: blue)),
                    ),
                    noItemsFoundBuilder: (context) {
                      return const ListTile(
                        title: Text(
                          'Ничего не найдено',
                        ),
                        textColor: white,
                        tileColor: back,
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            for (final item in _names) {
                              if (item.containsKey(_controller.text)) {
                                setState(() {
                                  item.values.first == bf
                                      ? green = true
                                      : red = true;
                                });
                              }
                            }
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                if (green) {
                                  green = false;
                                  _controller.text = '';
                                  do {
                                    bf = randFunction(2);
                                  } while (bf == prevFunc);
                                  bf = randFunction(2);
                                  prevFunc = bf;
                                }
                                else{
                                  red = false;
                                  _controller.text = '';
                                }
                              });
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: blue,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: const Text(
                          'Проверить',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: back,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                ],
              ),
            ),
            Visibility(
              visible: green,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.green.withOpacity(0.3),
              ),
            ),
            Visibility(
              visible: red,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.red.withOpacity(0.3),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: const CircularNotchedRectangle(),
          height: 67,
          color: back,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlideRightRoute(page: const ThirdTask()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: white,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlideRightRoute(page: const Navigation()));
                  },
                  icon: const Icon(Icons.list),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(page: const FivthTask()));
                  },
                  icon: const Icon(Icons.arrow_forward),
                  color: white,
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
