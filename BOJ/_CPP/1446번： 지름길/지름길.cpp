/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1446                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1446                           #+#        #+#      #+#    */
/*   Solved: 2024/10/01 19:20:45 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int n, d;
  cin >> n >> d;

  vector<pair<int, int>> graph[10001];

  for (int i = 0; i < n; i++) {
    int from, to, cost;
    cin >> from >> to >> cost;
    if (to <= d) {
      graph[from].push_back({to, cost});
    }
  }

  // 다익스트라를 위한 최소 힙 선언 (거리, 정점) 형태로 저장
  priority_queue<pair<int, int>, vector<pair<int, int>>,
                 greater<pair<int, int>>>
      pq;

  // 최단 거리 배열 초기화
  vector<int> dist(d + 1, INF);
  dist[0] = 0;
  pq.push({0, 0});  // (거리, 시작 위치)

  // 다익스트라 알고리즘
  while (!pq.empty()) {
    int currentDist = pq.top().first;
    int currentNode = pq.top().second;
    pq.pop();

    // 이미 처리된 거리보다 큰 경우는 무시
    if (currentDist > dist[currentNode]) {
      continue;
    }

    // 직선 도로로 이동 (다음 1km)
    if (currentNode + 1 <= d && dist[currentNode + 1] > currentDist + 1) {
      dist[currentNode + 1] = currentDist + 1;
      pq.push({dist[currentNode + 1], currentNode + 1});
    }

    // 현재 노드에서 출발하는 지름길 처리
    for (auto& shortcut : graph[currentNode]) {
      int nextNode = shortcut.first;
      int shortcutCost = shortcut.second;

      if (dist[nextNode] > currentDist + shortcutCost) {
        dist[nextNode] = currentDist + shortcutCost;
        pq.push({dist[nextNode], nextNode});
      }
    }
  }

  cout << dist[d] << "\n";
  return 0;
}
