#include <bits/stdc++.h>

using namespace std;

#define INF 1e9

struct Edge {
  int from, to, time;
};

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int tc, n, m, w;
  cin >> tc;

  for (int t = 0; t < tc; t++) {
    cin >> n >> m >> w;

    vector<Edge> edges;

    for (int j = 0; j < m; j++) {
      int s, e, t;
      cin >> s >> e >> t;
      edges.push_back({s, e, t});
      edges.push_back({e, s, t});
    }

    for (int j = 0; j < w; j++) {
      int s, e, t;
      cin >> s >> e >> t;
      edges.push_back({s, e, -t});
    }

    bool hasNegativeCycle = false;

    vector<int> dist(n + 1, INF);
    dist[1] = 0;

    for (int i = 0; i < n - 1; i++) {
      for (const auto& edge : edges) {
        if (dist[edge.to] > dist[edge.from] + edge.time) {
          dist[edge.to] = dist[edge.from] + edge.time;
        }
      }
    }

    for (const auto& edge : edges) {
      if (dist[edge.to] > dist[edge.from] + edge.time) {
        hasNegativeCycle = true;
        break;
      }
    }

    if (hasNegativeCycle) {
      cout << "YES\n";
    } else {
      cout << "NO\n";
    }
  }

  return 0;
}
