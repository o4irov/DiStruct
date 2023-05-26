import 'package:discret_math/graphs/0.dart';
import 'package:discret_math/graphs/2.dart';
import 'package:discret_math/graphs/3.dart';
import 'package:discret_math/graphs/4.dart';
import 'package:discret_math/graphs/5.dart';
import 'package:discret_math/graphs/6.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:discret_math/topics.dart';
import 'package:flutter/material.dart';

import '../slideLeftRoute.dart';
import '1.dart';

class NavigationG extends StatelessWidget {
  const NavigationG({super.key});

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.of(context).push(SlideLeftRoute(page: const Zero()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const Topics()));
        }
      },
      child: Scaffold(
        backgroundColor: back,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 70)),
              const Text(
                'Навигация по задачам',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const Zero()));
                        },
                        child: const Text(
                          '0. Анализ заданного графа',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const FirstTask()));
                        },
                        child: const Text(
                          '1.Обход в глубину по заданному графу',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const SecondTask()));
                        },
                        child: const Text(
                          '2. Проверка обхода в глубину',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const ThirdTask()));
                        },
                        child: const Text(
                          '3. Обход в ширину по заданному графу',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const FourthTask()));
                        },
                        child: const Text(
                          '4. Проверка обхода в ширину',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const FivthTask()));
                        },
                        child: const Text(
                          '5. Вычисление компонент связности по заданному графу',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(SlideLeftRoute(page: const SixthTask()));
                        },
                        child: const Text(
                          '6. Проверка числа компонент связности',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 101, 180, 245),
                          ),
                        ),
                      ),
                      //       TextButton(
                      //         style: TextButton.styleFrom(
                      //           shape: const RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.all(Radius.circular(10)),
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.of(context)
                      //               .push(SlideLeftRoute(page: const NinethTask()));
                      //         },
                      //         child: const Text(
                      //           '9. Построение СКНФ по функции',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color.fromARGB(255, 101, 180, 245),
                      //           ),
                      //         ),
                      //       ),
                      //       TextButton(
                      //         style: TextButton.styleFrom(
                      //           shape: const RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.all(Radius.circular(10)),
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.of(context)
                      //               .push(SlideLeftRoute(page: const TenthTask()));
                      //         },
                      //         child: const Text(
                      //           '10. Замкнутые классы булевых функций',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color.fromARGB(255, 101, 180, 245),
                      //           ),
                      //         ),
                      //       ),
                      //       TextButton(
                      //         style: TextButton.styleFrom(
                      //           shape: const RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.all(Radius.circular(10)),
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.of(context)
                      //               .push(SlideLeftRoute(page: const EleventhTask()));
                      //         },
                      //         child: const Text(
                      //           '11. Полные системы булевых функций',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color.fromARGB(255, 101, 180, 245),
                      //           ),
                      //         ),
                      //       ),
                    ],
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
                        .push(SlideRightRoute(page: const Topics()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: white,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(page: const Zero()));
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
