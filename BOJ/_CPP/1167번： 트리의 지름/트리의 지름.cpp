/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1167                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1167                           #+#        #+#      #+#    */
/*   Solved: 2024/10/17 11:23:07 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <cstring>
#include <iostream>
#include <queue>
#include <tuple>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int n;
vector<pair<int, int>> graph[100001];

pair<int, int> bfs(int startNode) {
  bool visit[100001];
  memset(visit, false, sizeof(visit));
  visit[startNode] = true;

  queue<pair<int, int>> q;
  q.push({startNode, 0});

  int maxDistance = 0;
  int maxLeaf = startNode;

  while (!q.empty()) {
    int currentNode, currentDistance;
    tie(currentNode, currentDistance) = q.front();
    q.pop();

    if (currentDistance > maxDistance) {
      maxDistance = currentDistance;
      maxLeaf = currentNode;
    }

    for (auto& edge : graph[currentNode]) {
      int nx = edge.first;
      int dist = edge.second;
      if (!visit[nx]) {
        visit[nx] = true;
        q.push({nx, currentDistance + dist});
      }
    }
  }

  return {maxDistance, maxLeaf};
}

int main() {
  fastio;
  cin >> n;

  for (int i = 0; i < n; ++i) {
    int node;
    cin >> node;
    while (true) {
      int adjNode;
      cin >> adjNode;
      if (adjNode == -1) break;
      int dist;
      cin >> dist;
      graph[node].push_back({adjNode, dist});
    }
  }

  pair<int, int> firstBFS = bfs(1);
  pair<int, int> secondBFS = bfs(firstBFS.second);

  cout << secondBFS.first << endl;

  return 0;
}
