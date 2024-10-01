/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 5972                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/5972                           #+#        #+#      #+#    */
/*   Solved: 2024/10/01 22:18:17 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9

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

  vector<int> dist(n + 1, INF);

  dist[1] = 0;

  priority_queue<pair<int, int>, vector<pair<int, int>>,
                 greater<pair<int, int>>>
      pq;

  pq.push({0, 1});
  while (!pq.empty()) {
    int current_cost = pq.top().first;
    int current_node = pq.top().second;
    pq.pop();

    if (current_cost > dist[current_node]) {
      continue;
    }

    for (auto &edge : graph[current_node]) {
      int next_node = edge.first;
      int next_cost = edge.second;

      int new_cost = current_cost + next_cost;
      if (new_cost < dist[next_node]) {
        dist[next_node] = new_cost;
        pq.push({new_cost, next_node});
      }
    }
  }

  cout << dist[n];

  return 0;
}