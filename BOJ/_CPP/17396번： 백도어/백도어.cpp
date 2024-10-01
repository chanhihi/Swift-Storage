/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17396                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17396                          #+#        #+#      #+#    */
/*   Solved: 2024/10/01 22:49:41 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;

#define INF 1e11

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  ll n, m;
  cin >> n >> m;

  vector<ll> sight(n);

  for (ll i = 0; i < n; i++) {
    cin >> sight[i];
  }
  sight[n - 1] = 0;

  vector<vector<pair<ll, ll>>> graph(n + 1);

  for (ll i = 0; i < m; i++) {
    ll a, b, t;
    cin >> a >> b >> t;
    if (!sight[a] && !sight[b]) {
      graph[a].push_back({b, t});
      graph[b].push_back({a, t});
    }
  }

  vector<ll> dist(n + 1, INF);
  dist[0] = 0;

  priority_queue<pair<ll, ll>, vector<pair<ll, ll>>, greater<pair<ll, ll>>> pq;

  pq.push({0, 0});

  while (!pq.empty()) {
    ll current_cost = pq.top().first;
    ll current_node = pq.top().second;
    pq.pop();

    if (current_cost > dist[current_node]) {
      continue;
    }

    for (auto &edge : graph[current_node]) {
      ll next_cost = edge.second;
      ll next_node = edge.first;

      ll new_cost = next_cost + current_cost;
      if (dist[next_node] > new_cost) {
        dist[next_node] = new_cost;
        pq.push({new_cost, next_node});
      }
    }
  }

  if (dist[n - 1] == INF) {
    cout << "-1";
  } else {
    cout << dist[n - 1];
  }

  return 0;
}