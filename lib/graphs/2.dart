import 'dart:math';

import 'package:discret_math/graphs/3.dart';
import 'package:discret_math/graphs/1.dart';
import 'package:discret_math/graphs/Navigation.dart';
import 'package:discret_math/graphs/ViewGraph.dart';
import 'package:discret_math/graphs/solutions/Graph.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  int _length = 2;
  List<List<int>> _graph = [];
  int _edge = 0;
  MyGraph _myGraph = MyGraph(0, []);

  graphInit() {
    Random random = Random();

    int maxSize = 20;

    int outerSize = random.nextInt(maxSize);
    List<List<int>> twoDimensionalArray = [];

    for (int i = 0; i < outerSize; i++) {
      int innerSize = random.nextInt(outerSize > 10 ? 6 : outerSize) + 1;
      List<int> innerArray = [];

      while (innerArray.length < innerSize) {
        int value = random.nextInt(outerSize);
        if (!innerArray.contains(value)) {
          innerArray.add(value);
        }
      }

      twoDimensionalArray.add(innerArray);
    }
    setState(() {
      _graph = twoDimensionalArray
          .map((innerArray) => List<int>.from(innerArray))
          .toList();
      for (int i = 0; i < _graph.length; i++) {
        _graph[i].removeWhere((element) => element == i);
      }
      _length = _graph.length;
    });
  }

  @override
  void initState() {
    super.initState();
    graphInit();
    while (_graph.isEmpty) {
      graphInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    int findMax(List<int> numbers) {
      return numbers.reduce((max, current) => max > current ? max : current);
    }

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
                '2. Перейдите во вкладку "Посмотреть граф" и введите обход в глубину',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Expanded(
                child: ListView.builder(
                  itemCount: _graph.length,
                  itemBuilder: (context, idx) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: blue,
                                ),
                                child: Center(
                                  child: Text(
                                    '$idx',
                                    style: const TextStyle(
                                      color: back,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _graph[idx].isEmpty
                                        ? 0
                                        : findMax(_graph[idx]) + 1,
                                    itemBuilder: (context, index) {
                                      if (_graph[idx].contains(index)) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: blue ?? Colors.blue,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '$index',
                                                    style: TextStyle(
                                                      color:
                                                          blue ?? Colors.blue,
                                                      fontSize: 28,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10)),
                                          ],
                                        );
                                      }
                                      return Container();
                                    },
                                  )),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: const CircularNotchedRectangle(),
          height: 115,
          color: back,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 9)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        while (_graph.isEmpty) {
                          graphInit();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Другой граф',
                            style: TextStyle(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _myGraph = MyGraph(_length, _graph);
                        });
                        var graph = Graph();
                        List<bool> _isUsed = List.filled(_length, false);
                        for (int i = 0; i < _length; i++) {
                          if (_graph[i].isNotEmpty) {
                            _isUsed[i] = true;
                          }
                          for (int j = 0; j < _graph[i].length; j++) {
                            _isUsed[_graph[i][j]] = true;
                            graph.addEdge(
                                Node.Id('$i'), Node.Id('${_graph[i][j]}'),
                                paint: Paint()
                                  ..color = blue ?? Colors.blue
                                  ..strokeWidth = 1.5);
                          }
                        }
                        for (int i = 0; i < _isUsed.length; i++) {
                          if (!_isUsed[i]) {
                            graph.addNode(Node.Id('$i'));
                          }
                        }
                        Navigator.push(
                          context,
                          SlideLeftRoute(
                            page: GraphScreen(
                              _graph,
                              graph,
                              FruchtermanReingoldAlgorithm(),
                              'empty',
                              _myGraph.DFS(_edge),
                              const [],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Посмотреть граф',
                            style: TextStyle(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
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
                            .push(SlideRightRoute(page: const NavigationG()));
                      },
                      icon: const Icon(Icons.list_rounded),
                      color: white,
                      iconSize: 40,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<int> createNumberList(int n) {
    List<int> numberList = [];
    for (int i = 0; i <= n; i++) {
      numberList.add(i);
    }
    return numberList;
  }
}
