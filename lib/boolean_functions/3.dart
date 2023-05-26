import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/boolean_functions/4.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '2.dart';

class ThirdTask extends StatefulWidget {
  const ThirdTask({super.key});

  @override
  State<ThirdTask> createState() => _ThirdTaskState();
}

var _bf = 'Здесь будет функция';
final _zero = TextEditingController();
final _single = TextEditingController();
final _position = TextEditingController();
int _maxValue = 0;

class _ThirdTaskState extends State<ThirdTask> {
  @override
  void initState() {
    setState(() {
      _maxValue = (int.tryParse(_zero.text) == null ? 1 : _zero.text.length);
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _zero.dispose();
    _single.dispose();
    _position.dispose();
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
          Navigator.of(context).push(SlideLeftRoute(page: const FourthTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const SecondTask()));
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
                '3. На вход два вектора функции (это нулевая и единичная остаточные), номер аргумента, на выход соответствующая функция.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              TextField(
                controller: _zero,
                onChanged: (text) {
                  setState(() {
                    _maxValue = (int.tryParse(text) == null ? 1 : text.length);
                  });
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-1]')),
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
                  hintText: 'Введите нулевую остаточную по аргументу',
                  hintStyle: TextStyle(color: blue),
                ),
                onEditingComplete: () {
                  while (!_isPowerOfTwo(_zero.text.length)) {
                    _zero.text = _zero.text.substring(0, _zero.text.length - 1);
                  }
                },
                onSubmitted: (value) {
                  while (!_isPowerOfTwo(_zero.text.length)) {
                    _zero.text = _zero.text.substring(0, _zero.text.length - 1);
                  }
                  FocusScope.of(context).unfocus();
                },
                onTapOutside: (event) {
                  while (!_isPowerOfTwo(_zero.text.length)) {
                    _zero.text = _zero.text.substring(0, _zero.text.length - 1);
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TextField(
                controller: _single,
                maxLength: _maxValue,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-1]')),
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
                  hintText: 'Введите единичную остаточную по аргументу',
                  hintStyle: TextStyle(color: blue),
                ),
                onEditingComplete: () {
                  while (!_isPowerOfTwo(_zero.text.length)) {
                    _zero.text = _zero.text.substring(0, _zero.text.length - 1);
                  }
                  if (_single.text.length != _zero.text.length) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: back,
                          title: const Text(
                            'Ошибка ввода',
                            style: TextStyle(color: white),
                          ),
                          content: const Text(
                            'Введите равне по длине остаточные',
                            style: TextStyle(color: white),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: blue,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TextField(
                controller: _position,
                onChanged: (text) {
                  int number = _zero.text.length * 2;
                  int maxValue = 0;
                  int value = int.tryParse(text) ?? 0;
                  while (number > 1) {
                    number ~/= 2; // операция целочисленного деления на 2
                    maxValue++;
                  }
                  if (value > maxValue) {
                    _position.text = maxValue.toInt().toString();
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
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      bool flag = true;
                      while (!_isPowerOfTwo(_zero.text.length)) {
                        _zero.text =
                            _zero.text.substring(0, _zero.text.length - 1);
                      }
                      while (!_isPowerOfTwo(_zero.text.length)) {
                        _zero.text =
                            _zero.text.substring(0, _zero.text.length - 1);
                      }
                      if (_single.text.length != _zero.text.length) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: back,
                              title: const Text(
                                'Ошибка ввода',
                                style: TextStyle(color: white),
                              ),
                              content: const Text(
                                'Введите равне по длине остаточные',
                                style: TextStyle(color: white),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: blue,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (flag) {
                        setState(() {
                          num? f0 = int.tryParse(_zero.text);
                          num? f1 = int.tryParse(_single.text);
                          num? p = int.tryParse(_position.text);
                          if (f0 != null && f1 != null && p != null) {
                            _bf = function(_zero.text, _single.text,
                                int.parse(_position.text));
                          }
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Построить функцию',
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
                  _bf,
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
                        .push(SlideRightRoute(page: const SecondTask()));
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
                        .push(SlideLeftRoute(page: const FourthTask()));
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
