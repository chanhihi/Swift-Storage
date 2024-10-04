/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1240                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1240                           #+#        #+#      #+#    */
/*   Solved: 2024/10/04 22:35:37 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>
using namespace std;
#define INF 1e9

template <typename t>
void pa2(t T) {
  for (auto P : T) {
    for (auto p : P) cout << p << " ";
    cout << "\n";
  }
  cout << "\n";
}

int main() {
  int n, m;
  cin >> n >> m;
  vector<vector<int>> nodes(n + 1, vector<int>(n + 1, INF));
  for (int i = 0; i < n - 1; i++) {
    int x, y, c;
    cin >> x >> y >> c;
    nodes[y][x] = c;
    nodes[x][y] = c;
    nodes[i][i] = 0;
  }

  for (int k = 1; k <= n; k++) {
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n; j++) {
        if (nodes[i][j] > nodes[i][k] + nodes[k][j]) {
          nodes[i][j] = nodes[i][k] + nodes[k][j];
        }
      }
    }
  }

  for (int i = 0; i < m; i++) {
    int u, v;
    cin >> u >> v;
    cout << nodes[u][v] << "\n";
  }

  return 0;
}