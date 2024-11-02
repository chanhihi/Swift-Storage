/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 11438                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/11438                          #+#        #+#      #+#    */
/*   Solved: 2024/11/02 22:35:56 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

const int MAX_N = 100000;
const int LOG = 17;

vector<int> tree[MAX_N + 1];
int depth[MAX_N + 1];
int parent[MAX_N + 1][LOG + 1];

void dfs(int node, int par) {
  depth[node] = depth[par] + 1;
  parent[node][0] = par;

  for (int i = 1; i <= LOG; i++) {
    parent[node][i] = parent[parent[node][i - 1]][i - 1];
  }

  for (int child : tree[node]) {
    if (child != par) {
      dfs(child, node);
    }
  }
}

int findLCA(int u, int v) {
  if (depth[u] < depth[v]) swap(u, v);

  for (int i = LOG; i >= 0; i--) {
    if (depth[u] - (1 << i) >= depth[v]) {
      u = parent[u][i];
    }
  }

  if (u == v) return u;

  for (int i = LOG; i >= 0; i--) {
    if (parent[u][i] != parent[v][i]) {
      u = parent[u][i];
      v = parent[v][i];
    }
  }
  return parent[u][0];
}

int main() {
  FASTIO;

  int N, M;
  cin >> N;

  for (int i = 0; i < N - 1; i++) {
    int a, b;
    cin >> a >> b;
    tree[a].push_back(b);
    tree[b].push_back(a);
  }

  depth[0] = -1;
  dfs(1, 0);

  cin >> M;
  for (int i = 0; i < M; i++) {
    int u, v;
    cin >> u >> v;
    cout << findLCA(u, v) << "\n";
  }

  return 0;
}
