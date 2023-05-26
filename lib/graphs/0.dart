import 'package:discret_math/graphs/1.dart';
import 'package:discret_math/graphs/2.dart';
import 'package:discret_math/graphs/Navigation.dart';
import 'package:discret_math/graphs/ViewGraph.dart';
import 'package:discret_math/graphs/solutions/0.dart';
import 'package:discret_math/graphs/solutions/Graph.dart';
import 'package:discret_math/slideLeftRoute.dart';
import 'package:discret_math/slideRightRoute.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class Zero extends StatefulWidget {
  const Zero({super.key});

  @override
  State<Zero> createState() => _ZeroState();
}

class _ZeroState extends State<Zero> {
  int _length = 2;
  final List<List<int>> _graph = [[], []];
  int _edge = 0;
  MyGraph _myGraph = MyGraph(0, []);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    bool _isContains(List<int> list, int value) {
      if (list.length > 0) {
        return list.contains(value);
      }
      return false;
    }

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -2) {
          Navigator.of(context).push(SlideLeftRoute(page: const SecondTask()));
        }
        if (details.delta.dx > 2) {
          Navigator.of(context)
              .push(SlideRightRoute(page: const NavigationG()));
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
                '0. Задайте граф списком смежности.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Expanded(
                child: ListView.builder(
                  itemCount: _length + 1,
                  itemBuilder: (context, idx) {
                    if (idx == _length) {
                      return Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_length > 1) {
                                      _length--;
                                      _graph.removeLast();
                                      for (var element in _graph) {
                                        if (element.isNotEmpty) {
                                          element.removeLast();
                                        }
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5.7),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: white, width: 3),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 40)),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_length < 20) {
                                      _length++;
                                      _graph.add([]);
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: white, width: 3),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
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
                                    itemCount: _length,
                                    itemBuilder: (context, index) {
                                      if (idx == index) {
                                        return Container();
                                      } else {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isContains(
                                                          _graph[idx], index)
                                                      ? _graph[idx]
                                                          .remove(index)
                                                      : _graph[idx].add(index);
                                                });
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: _isContains(
                                                            _graph[idx], index)
                                                        ? blue ?? Colors.blue
                                                        : white,
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
                                                      color: _isContains(
                                                              _graph[idx],
                                                              index)
                                                          ? blue ?? Colors.blue
                                                          : white,
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
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                        ],
                      );
                    }
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
                        int _isEiler = 0;
                        int _isHalfEiler = 0;
                        int _isBipartite = 0;
                        if (_myGraph.countConnectedComponents() == 1) {
                          int count = 0;
                          power(_graph).map((e) {
                            if (e % 2 != 0) {
                              count++;
                            }
                          });
                          if (count == 2) {
                            _isHalfEiler = 1;
                          }
                          if (count == 0) {
                            _isEiler = 1;
                          }
                        }
                        if (isBipartite(_graph)) {
                          _isBipartite = 1;
                        }
                        Navigator.push(
                          context,
                          SlideLeftRoute(
                            page: GraphScreen(
                              _graph,
                              graph,
                              FruchtermanReingoldAlgorithm(),
                              'zero',
                              power(_graph),
                              [
                                _myGraph.countConnectedComponents(),
                                _isEiler,
                                _isHalfEiler,
                                _isBipartite,
                              ],
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
                            'Построить граф',
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
                            .push(SlideRightRoute(page: const NavigationG()));
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: white,
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(SlideLeftRoute(page: const FirstTask()));
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
