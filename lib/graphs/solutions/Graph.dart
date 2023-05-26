import 'dart:collection';

class MyGraph {
  int vertices;
  List<List<int>> adjacencyList;

  MyGraph(this.vertices, this.adjacencyList);

  void addEdge(int v, int w) {
    adjacencyList[v].add(w);
  }

  List<int> DFS(int startVertex) {
    List<bool> visited = List<bool>.filled(vertices, false);
    List<int> result = [];

    _DFSUtil(startVertex, visited, result);
    return result;
  }

  void _DFSUtil(int vertex, List<bool> visited, List<int> result) {
    visited[vertex] = true;
    result.add(vertex);

    for (int neighbor in adjacencyList[vertex]) {
      if (!visited[neighbor]) {
        _DFSUtil(neighbor, visited, result);
      }
    }
  }

  void DFSUtil(int v, List<bool> visited) {
    visited[v] = true;
    for (var i = 0; i < adjacencyList[v].length; i++) {
      var neighbor = adjacencyList[v][i];
      if (!visited[neighbor]) {
        DFSUtil(neighbor, visited);
      }
    }
  }

  List<int> breadthFirstSearch(int startVertex, List<bool> visited) {
    Queue<int> queue = Queue();
    List<int> result = [];

    visited[startVertex] = true;
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      startVertex = queue.removeFirst();
      result.add(startVertex);
      for (var element in adjacencyList[startVertex]) {
        if (!visited[element]) {
          visited[element] = true;
          queue.add(element);
        }
      }
    }
    return result;
  }

  int countConnectedComponents() {
    List<bool> visited = List<bool>.filled(vertices, false);
    int count = 0;
    for (var v = 0; v < vertices; v++) {
      if (!visited[v]) {
        DFSUtil(v, visited);
        count++;
      }
    }
    return count;
  }
}
