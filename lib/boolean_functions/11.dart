import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/11.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '10.dart';

class EleventhTask extends StatefulWidget {
  const EleventhTask({super.key});

  @override
  State<EleventhTask> createState() => _EleventhTaskState();
}

class _EleventhTaskState extends State<EleventhTask> {
  var prevFunc = '';
  bool green = false;
  bool red = false;
  String _func = '';
  final _controller = TextEditingController();
  final List<String> _classes = [
    'Сохраняющая ноль',
    'Сохраняющая единицу',
    'Самодвойственная',
    'Монотонная',
    'Линейная'
  ];
  List<bool> _isComplete = [];

  @override
  void initState() {
    super.initState();
    var system = generateSystem();
    _func = system;
    prevFunc = _func;
    _isComplete = isComplete(_func);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];
    const hidden = Color.fromRGBO(1, 1, 1, 0);

    List<String> _getSuggestions(String query) {
      List<String> matches = [];
      matches.addAll(_classes);

      matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          // Navigator.of(context).push(SlideLeftRoute(page: const SixthTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const TenthTask()));
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  const Text(
                    '11. Замкнутые классы б.ф. Выберите все замкнутые классы, которым принадлежит данная функция',
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
                      _func,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TypeAheadField(
                          hideSuggestionsOnKeyboardHide: false,
                          suggestionsCallback: ((pattern) {
                            return _getSuggestions(pattern);
                          }),
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(
                                suggestion.toString(),
                              ),
                              textColor: white,
                              tileColor: back,
                            );
                          },
                          onSuggestionSelected: ((suggestion) {
                            setState(() {
                              _controller.text = suggestion.toString();
                            });
                          }),
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _controller,
                            style: TextStyle(color: blue),
                            decoration: InputDecoration(
                                fillColor: white,
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(color: white)),
                                hintText:
                                    'Начните вводить название замкнутого класса',
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
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              if (!_isComplete[5]) {
                                setState(() {
                                  _isComplete[
                                          _classes.indexOf(_controller.text)]
                                      ? green = true
                                      : red = true;
                                });
                              }
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  if (green) {
                                    green = false;
                                    _controller.text = '';
                                    var system = generateSystem();
                                    _func = system;
                                    prevFunc = _func;
                                    _isComplete = isComplete(_func);
                                  } else {
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
                            'Неполная система',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: back,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isComplete[5] ? green = true : red = true;
                            });
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                setState(() {
                                  if (green) {
                                    green = false;
                                    _controller.text = '';
                                    var system = generateSystem();
                                    _func = system;
                                    prevFunc = _func;
                                    _isComplete = isComplete(_func);
                                  } else {
                                    red = false;
                                    _controller.text = '';
                                  }
                                });
                              },
                            );
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: blue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          child: const Text(
                            'Полная система',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: back,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        .push(SlideRightRoute(page: const TenthTask()));
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
                    // Navigator.of(context)
                    // .push(SlideLeftRoute(page: const SixthTask()));
                  },
                  icon: const Icon(Icons.arrow_forward),
                  color: hidden,
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
