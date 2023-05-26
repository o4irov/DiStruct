import 'dart:math';

import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/boolean_functions/1.dart';
import 'package:discret_math/onBoarding.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '3.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  @override
  void initState() {
    super.initState();
  }

  var bf = 'Здесь будет остаточная от функции';
  final func = TextEditingController();
  final position = TextEditingController();
  bool _option1Selected = false;
  bool _option2Selected = false;

  void _selectOption1() {
    setState(() {
      _option1Selected = true;
      _option2Selected = false;
    });
  }

  void _selectOption2() {
    setState(() {
      _option1Selected = false;
      _option2Selected = true;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    func.dispose();
    position.dispose();
    super.dispose();
  }

  bool _isPowerOfTwo(int value) {
    return (value & (value - 1)) == 0; // Проверка, является ли value степенью 2
  }

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.of(context).push(SlideLeftRoute(page: const ThirdTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const FirstTask()));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: back,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 70)),
              const Text(
                '2. На вход вектор функции, 0 или 1, номер аргумента, на выход соответствующая остаточная.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              TextField(
                controller: func,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-1]'))
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
                  hintText: 'Введите функцию',
                  hintStyle: TextStyle(color: blue),
                ),
                onEditingComplete: () {
                  while (!_isPowerOfTwo(func.text.length)) {
                    func.text = func.text.substring(0, func.text.length - 1);
                  }
                },
                onSubmitted: (value) {
                  while (!_isPowerOfTwo(func.text.length)) {
                    func.text = func.text.substring(0, func.text.length - 1);
                  }
                  FocusScope.of(context).unfocus();
                },
                onTapOutside: (event) {
                  while (!_isPowerOfTwo(func.text.length)) {
                    func.text = func.text.substring(0, func.text.length - 1);
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Row(
                      children: [
                        Checkbox(
                          fillColor: MaterialStateProperty.all<Color?>(blue),
                          shape: const CircleBorder(),
                          value: _option1Selected,
                          onChanged: (value) {
                            _selectOption1();
                          },
                        ),
                        const Text(
                          "0",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Row(children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(blue),
                        shape: const CircleBorder(),
                        value: _option2Selected,
                        onChanged: (value) {
                          _selectOption2();
                        },
                      ),
                      const Text(
                        "1",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TextField(
                controller: position,
                onChanged: (text) {
                  int number = func.text.length;
                  int maxValue = 0;
                  int value = int.tryParse(text) ?? 0;
                  while (number > 1) {
                    number ~/= 2;
                    maxValue++;
                  }
                  if (value > maxValue) {
                    position.text = maxValue.toInt().toString();
                  } else {
                    maxValue = value;
                  }
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
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
                    hintText: 'Введите номер аргумента',
                    hintStyle: TextStyle(color: blue)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      while (!_isPowerOfTwo(func.text.length)) {
                        func.text =
                            func.text.substring(0, func.text.length - 1);
                      }
                      setState(() {
                        num? f = int.tryParse(func.text);
                        num? p = int.tryParse(position.text);
                        if (f != null && p != null) {
                          bf = residual(
                              func.text.toString(),
                              _option1Selected ? 0 : 1,
                              int.parse(position.text) - 1);
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Построить остаточную',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: back,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
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
            ],
          ),
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
                        .push(SlideRightRoute(page: const FirstTask()));
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
                        .push(SlideLeftRoute(page: const ThirdTask()));
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
