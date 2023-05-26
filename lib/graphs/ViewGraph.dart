import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class GraphScreen extends StatefulWidget {
  List<List<int>> list;
  Graph graph;
  Algorithm algorithm;
  final List<int> DFS;
  final List<int> BFS;
  final String type;

  GraphScreen(
    this.list,
    this.graph,
    this.algorithm,
    this.type,
    this.DFS,
    this.BFS,
  );

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  bool green = false;
  bool red = false;
  double _height = 100;

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    return Scaffold(
      backgroundColor: back,
      body: Stack(
        children: [
          InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            minScale: .8,
            maxScale: 4,
            child: GraphView(
              graph: widget.graph,
              algorithm: widget.algorithm,
              animated: true,
              paint: Paint()..color = white,
              builder: (Node node) {
                // I can decide what widget should be shown here based on the id
                var a = node.key!.value as String;
                return rectangWidget(a);
              },
            ),
          ),
          bottom(),
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
        child: IconTheme(
          data: const IconThemeData(),
          child: Container(
            color: back,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rectangWidget(String? i) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: widget.type == 'zero'
            ? const Color.fromARGB(255, 34, 34, 34)
            : const Color.fromRGBO(0, 0, 0, 0),
        // borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Text(
        '$i',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget bottom() {
    const white = Colors.white;
    const back = Color.fromARGB(255, 34, 34, 34);
    var blue = Colors.blue[300];

    if (widget.type == 'dfs') {
      return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: back,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Обход в глубину с вершины ${widget.DFS[0]}:',
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.DFS.join(' -> '),
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    } else if (widget.type == 'bfs') {
      return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: back,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Обход в ширину с вершины ${widget.BFS[0]}:',
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.BFS.join(' -> '),
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    } else if (widget.type == 'empty') {
      if (widget.DFS.isNotEmpty) {
        return Container(
          height: 125,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: back,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Text(
                'Введите обход в глубину с вершины ${widget.DFS[0]} через пробел:',
                style: const TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: blue ?? Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.text != '') {
                          setState(() {
                            listEquals(
                                    widget.DFS,
                                    _controller.text
                                        .split(' ')
                                        .map((e) => int.parse(e))
                                        .toList())
                                ? green = true
                                : red = true;
                          });
                        }
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              if (green) {
                                Navigator.pop(context);
                                green = false;
                              } else {
                                red = false;
                              }
                            });
                          },
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Проверить',
                            style: TextStyle(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      } else {
        return Container(
          height: 125,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: back,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Text(
                'Введите обход в ширину с вершины ${widget.BFS[0]} через пробел:',
                style: const TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: blue ?? Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.text != '') {
                          setState(() {
                            listEquals(
                                    widget.BFS,
                                    _controller.text
                                        .split(' ')
                                        .map((e) => int.parse(e))
                                        .toList())
                                ? green = true
                                : red = true;
                          });
                        }
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              if (green) {
                                Navigator.pop(context);
                                green = false;
                              } else {
                                red = false;
                              }
                            });
                          },
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Проверить',
                            style: TextStyle(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    } else if (int.tryParse(widget.type) != null) {
      if (widget.DFS.isEmpty) {
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: back,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'Число компонент связности равно: ${int.parse(widget.type)}',
                style: const TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          height: 125,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: back,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text(
                'Введите число компонент связности:',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: blue ?? Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.text != '') {
                          setState(() {
                            int.parse(_controller.text) ==
                                    int.parse(widget.type)
                                ? green = true
                                : red = true;
                          });
                        }
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              if (green) {
                                Navigator.pop(context);
                                green = false;
                              } else {
                                red = false;
                              }
                            });
                          },
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Проверить',
                            style: TextStyle(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    } else if (widget.type == 'zero') {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: _height + 43,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: back,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    'Степени вершин равны: \n${widget.DFS}',
                    style: const TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'Число компонент связности равно: ${widget.BFS[0]}',
                    style: const TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Граф является эйлеровым',
                    style: TextStyle(
                      color: white,
                      fontSize: widget.BFS[1] * 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Граф является полуэйлеровым',
                    style: TextStyle(
                      color: white,
                      fontSize: widget.BFS[1] * 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Граф является двудольным',
                    style: TextStyle(
                      color: white,
                      fontSize: widget.BFS[1] * 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: back,
          //     border: Border.symmetric(
          //       horizontal: BorderSide(
          //         color: blue ?? Colors.blue,
          //         width: 2,
          //       ),
          //     ),
          //   ),
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _height == 100 ? _height = 200 : _height = 100;
          //       });
          //     },
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Transform.rotate(
          //           angle: _height == 100 ? 4.7 : 1.55,
          //           child: Icon(
          //             Icons.arrow_back_ios_new_rounded,
          //             color: blue ?? Colors.blue,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      );
    } else {
      return Container();
    }
  }
}
