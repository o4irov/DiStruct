import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/boolean_functions/5.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/8.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '9.dart';
class EigthTask extends StatefulWidget {
  const EigthTask({super.key});

  @override
  State<EigthTask> createState() => _EigthTaskState();
}

var _dnf = 'Здесь будет СДНФ';
final _func = TextEditingController();

class _EigthTaskState extends State<EigthTask> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _func.dispose();
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
          Navigator.of(context).push(SlideLeftRoute(page: const NinethTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const FivthTask()));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: back,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 90)),
              const Text(
                '8. Построение СДНФ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 70)),
              TextField(
                controller: _func,
                onChanged: (text) {},
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
                  hintText: 'Введите функцию',
                  hintStyle: TextStyle(color: blue),
                ),
                onEditingComplete: () {
                  while (!_isPowerOfTwo(_func.text.length)) {
                    _func.text = _func.text.substring(0, _func.text.length - 1);
                  }
                },
                onSubmitted: (value) {
                  setState(() {
                    while (!_isPowerOfTwo(_func.text.length)) {
                      _func.text =
                          _func.text.substring(0, _func.text.length - 1);
                    }
                    num? f = int.tryParse(_func.text);
                    if (f != null || _func.text.length == 1) {
                      _dnf = buildSDNF(_func.text);
                    }
                  });
                  FocusScope.of(context).unfocus();
                },
                onTapOutside: (event) {
                  while (!_isPowerOfTwo(_func.text.length)) {
                    _func.text = _func.text.substring(0, _func.text.length - 1);
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        while (!_isPowerOfTwo(_func.text.length)) {
                          _func.text =
                              _func.text.substring(0, _func.text.length - 1);
                        }
                        num? f = int.tryParse(_func.text);
                        if (f != null || _func.text.length == 1) {
                          _dnf = buildSDNF(_func.text);
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Построить СДНФ',
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
                  _dnf,
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
                        .push(SlideRightRoute(page: const FivthTask()));
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
                    .push(SlideLeftRoute(page: const NinethTask()));
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
