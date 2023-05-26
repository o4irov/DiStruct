import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/topics.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.push(context, SlideLeftRoute(page: const Topics()));
        }
      },
      onTap: () {
        Navigator.push(context, SlideLeftRoute(page: const Topics()));
      },
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: back,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'DiStruct',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[300]),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Text(
                  'Булевы функции',
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w300, color: white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
