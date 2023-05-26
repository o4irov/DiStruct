import 'dart:math';

import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/1.dart';
import 'package:discret_math/boolean_functions/solutions/10.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '11.dart';
import '9.dart';

class TenthTask extends StatefulWidget {
  const TenthTask({super.key});

  @override
  State<TenthTask> createState() => _TenthTaskState();
}

class _TenthTaskState extends State<TenthTask> {
  var prevFunc = '';
  bool green = false;
  bool red = false;
  String _func = '';
  List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _func = randFunction(Random().nextInt(4) + 1);
    prevFunc = _func;
    _selectedItems = List.filled(5, false);
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

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.of(context).push(SlideLeftRoute(page: const EleventhTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const NinethTask()));
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
                    '10. Замкнутые классы б.ф. Выберите все замкнутые классы, которым принадлежит данная функция',
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
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        value: _selectedItems[0],
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[0] = !_selectedItems[0];
                          });
                        },
                      ),
                      const Text(
                        'Сохраняющая ноль',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        value: _selectedItems[1],
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[1] = !_selectedItems[1];
                          });
                        },
                      ),
                      const Text(
                        'Сохраняющая единицу',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        value: _selectedItems[2],
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[2] = !_selectedItems[2];
                          });
                        },
                      ),
                      const Text(
                        'Самодвойственная',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        value: _selectedItems[3],
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[3] = !_selectedItems[3];
                          });
                        },
                      ),
                      const Text(
                        'Монотонная',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        value: _selectedItems[4],
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[4] = !_selectedItems[4];
                          });
                        },
                      ),
                      const Text(
                        'Линейная',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            listEquals(Closed(_func), _selectedItems)
                                ? green = true
                                : red = true;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              if (green) {
                                green = false;
                                do {
                                  _func = randFunction(Random().nextInt(4) + 1);
                                } while (_func == prevFunc);
                                _func = randFunction(Random().nextInt(4) + 1);
                                _selectedItems = List.filled(5, false);
                                prevFunc = _func;
                              } else {
                                red = false;
                              }
                            });
                          });
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
                        .push(SlideRightRoute(page: const NinethTask()));
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
                        .push(SlideLeftRoute(page: const EleventhTask()));
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
