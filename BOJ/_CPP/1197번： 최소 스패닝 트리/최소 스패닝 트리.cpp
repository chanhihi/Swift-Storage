/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1197                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1197                           #+#        #+#      #+#    */
/*   Solved: 2024/10/30 11:42:26 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;
using ll = long long;

ll v, e;

vector<vector<pair<ll, ll>>> g;

void bfs(int currentNode, vector<bool> &vi) {
  priority_queue<pair<ll, ll>, vector<pair<ll, ll>>, greater<pair<ll, ll>>> pq;
  pq.push({0, currentNode});
  ll sum = 0;

  while (!pq.empty()) {
    auto pqf = pq.top();
    ll cost = pqf.first;
    ll node = pqf.second;
    pq.pop();

    if (vi[node]) continue;
    vi[node] = true;
    sum += cost;

    for (auto &neighbor : g[node]) {
      ll nextNode = neighbor.first;
      ll nextCost = neighbor.second;
      if (!vi[nextNode]) {
        pq.push({nextCost, nextNode});
      }
    }
  }

  cout << sum << "\n";
}

int main() {
  cin >> v >> e;
  g.resize(v + 1);

  for (ll i = 0; i < e; i++) {
    ll a, b, c;
    cin >> a >> b >> c;

    g[a].push_back({b, c});
    g[b].push_back({a, c});
  }

  vector<bool> vi(v + 1, false);
  bfs(1, vi);
}