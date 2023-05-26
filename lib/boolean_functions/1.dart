import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/onBoarding.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/boolean_functions/solutions/1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '2.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  @override
  void initState() {
    super.initState();
  }

  var bf = 'Здесь будет функция от n аргументов';
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
          Navigator.of(context).push(SlideLeftRoute(page: const SecondTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const Navigation()));
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
                '1. На вход число n, на выход функция от n аргументов.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 70)),
              TextField(
                controller: myController,
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
                    hintText: 'Введите число n',
                    hintStyle: TextStyle(color: blue)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        num? f = int.tryParse(myController.text);
                        if (f != null) {
                          bf = randFunction(int.parse(myController.text))
                              .toString();
                        }
                      });
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
              const Padding(padding: EdgeInsets.only(top: 40)),
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
                    Navigator.of(context).push(SlideRightRoute(page: const Navigation()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: white,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(SlideLeftRoute(page: const SecondTask()));
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
