/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1299                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1299                           #+#        #+#      #+#    */
/*   Solved: 2024/10/01 21:10:38 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9

void dijkstra(int n, vector<vector<pair<int, int>>>& graph,
              vector<int>& distance, vector<int>& prev) {
  priority_queue<pair<int, int>, vector<pair<int, int>>,
                 greater<pair<int, int>>>
      pq;

  distance.assign(n + 1, INF);
  prev.assign(n + 1, -1);

  distance[1] = 0;
  pq.push({0, 1});

  while (!pq.empty()) {
    int currentDist = pq.top().first;
    int currentNode = pq.top().second;
    pq.pop();

    if (currentDist > distance[currentNode]) {
      continue;
    }

    for (auto& edge : graph[currentNode]) {
      int nextNode = edge.first;
      int weight = edge.second;

      int newDist = currentDist + weight;
      if (newDist < distance[nextNode]) {
        distance[nextNode] = newDist;
        prev[nextNode] = currentNode;
        pq.push({newDist, nextNode});
      }
    }
  }
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int n, m;
  cin >> n >> m;

  vector<vector<pair<int, int>>> graph(n + 1);
  for (int i = 0; i < m; i++) {
    int a, b, c;
    cin >> a >> b >> c;
    graph[a].push_back({b, c});
    graph[b].push_back({a, c});
  }

  vector<int> distance(n + 1, INF);
  vector<int> prev(n + 1, -1);

  dijkstra(n, graph, distance, prev);

  vector<vector<pair<int, int>>> modifiedGraph = graph;

  int currentNode = n;
  while (prev[currentNode] != -1) {
    int from = prev[currentNode];
    int to = currentNode;
    int requiredCost = distance[to] - distance[from];

    modifiedGraph[from].erase(
        remove_if(modifiedGraph[from].begin(), modifiedGraph[from].end(),
                  [to, requiredCost](pair<int, int> edge) {
                    return edge.first == to && edge.second == requiredCost;
                  }),
        modifiedGraph[from].end());

    modifiedGraph[to].erase(
        remove_if(modifiedGraph[to].begin(), modifiedGraph[to].end(),
                  [from, requiredCost](pair<int, int> edge) {
                    return edge.first == from && edge.second == requiredCost;
                  }),
        modifiedGraph[to].end());

    currentNode = from;
  }

  dijkstra(n, modifiedGraph, distance, prev);

  cout << distance[n];

  return 0;
}
