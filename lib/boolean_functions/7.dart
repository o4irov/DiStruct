import 'dart:math';

import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '6.dart';
import '8.dart';

class SeventhTask extends StatefulWidget {
  const SeventhTask({super.key});

  @override
  State<SeventhTask> createState() => _SeventhTaskState();
}

class _SeventhTaskState extends State<SeventhTask> {
  var _func = '';
  var prevFunc = '';
  bool green = false;
  bool red = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    do {
      _func = randFunction(Random().nextInt(4) + 1);
    } while (int.parse(_func) != 0);
    _func = randFunction(Random().nextInt(4) + 1);
    prevFunc = _func;
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

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < 0) {
          Navigator.of(context).push(SlideLeftRoute(page: const EigthTask()));
        }
        if (details.delta.dx > 0) {
          Navigator.of(context).push(SlideRightRoute(page: const SixthTask()));
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
                    '7. КНФ. Постройте КНФ по заданной функции',
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
                  const Text(
                    'Пример ввода для корректной обработки ответа:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 102, 186, 255),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  const Text(
                    'Переменные: x1, x2, x3...\nКонъюнкция: & \nДизъюнкция: | \nОтрицание переменной: !x1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: _controller,
                    onChanged: (text) {},
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9!&|xх]')),
                    ],
                    style: TextStyle(color: blue),
                    decoration: InputDecoration(
                      fillColor: white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: white)),
                      hintText: 'Введите КНФ функции',
                      hintStyle: TextStyle(color: blue),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            do {
                              _func = randFunction(Random().nextInt(4) + 1);
                            } while (
                                _func == prevFunc && int.parse(_func) != 0);
                            _func = randFunction(Random().nextInt(4) + 1);
                            prevFunc = _func;
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
                        .push(SlideRightRoute(page: const SixthTask()));
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
                        .push(SlideLeftRoute(page: const EigthTask()));
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
