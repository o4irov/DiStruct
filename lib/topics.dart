import 'package:discret_math/boolean_functions/Navigation.dart';
import 'package:discret_math/graphs/Navigation.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:flutter/material.dart';

import 'onBoarding.dart';
import 'slideLeftRoute.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          // Navigator.of(context).push(SlideLeftRoute(page: const Navigation()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context).push(SlideRightRoute(page: const OnBoarding()));
        }
      },
      child: Scaffold(
        backgroundColor: back,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 70)),
              const Text(
                'Темы',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(SlideLeftRoute(page: const Navigation()));
                          },
                          child: const Text(
                            '1. Булевы функции',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 101, 180, 245),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(SlideLeftRoute(page: const NavigationG()));
                          },
                          child: const Text(
                            '2. Графы',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 101, 180, 245),
                            ),
                          ),
                        ),
                      ]),
                  ],
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
                        .push(SlideRightRoute(page: const OnBoarding()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: white,
                  iconSize: 40,
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_forward),
                  color: back,
                  iconSize: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
