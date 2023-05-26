List<int> countVertexDegrees(List<List<int>> adjacencyList) {
  int n = adjacencyList.length; // Количество вершин
  List<int> degrees =
      List<int>.filled(n, 0); // Инициализируем список степеней нулями

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < adjacencyList[i].length; j++) {
      degrees[i]++;
      degrees[adjacencyList[i][j]]++;
    }
  }

  return degrees;
}

power(List<List<int>> adjacencyList) {
  List<List<int>> graph = toUnOrient(adjacencyList);
  List<int> degrees = countVertexDegrees(graph);
  return degrees;
}

toUnOrient(List<List<int>> adjacencyList) {
  List<List<int>> graph =
      adjacencyList.map((e) => e.map((e) => e).toList()).toList();
  for (int i = 0; i < graph.length; i++) {
    for (int j = 0; j < graph[i].length; j++) {
      graph[graph[i][j]].remove(i);
    }
  }
  return graph;
}

enum ColorGraph { UNCOLORED, RED, BLUE }

bool isBipartite(List<List<int>> adjacencyList) {
  List<List<int>> graph = toUnOrient(adjacencyList);
  int n = graph.length;
  List<ColorGraph> colors = List<ColorGraph>.filled(n, ColorGraph.UNCOLORED);
  List<int> queue = [];

  for (int i = 0; i < n; i++) {
    if (colors[i] == ColorGraph.UNCOLORED) {
      colors[i] = ColorGraph.RED;
      queue.add(i);

      int front = 0;
      while (front < queue.length) {
        int vertex = queue[front];
        front++;

        for (int neighbor in graph[vertex]) {
          if (colors[neighbor] == colors[vertex]) {
            return false; // Найдено ребро между вершинами одного цвета, граф не двудольный
          }

          if (colors[neighbor] == ColorGraph.UNCOLORED) {
            colors[neighbor] = getOppositeColor(colors[vertex]);
            queue.add(neighbor);
          }
        }
      }
    }
  }

  return true; // Все ребра соединяют вершины разных цветов, граф двудольный
}

ColorGraph getOppositeColor(ColorGraph color) {
  return (color == ColorGraph.RED) ? ColorGraph.BLUE : ColorGraph.RED;
}
