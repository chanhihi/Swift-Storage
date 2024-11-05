/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17069                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17069                          #+#        #+#      #+#    */
/*   Solved: 2024/10/22 10:25:05 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;
using ll = long long;

#define fastio ios::sync_with_stdio(0), cin.tie(0)

ll n;
ll dx[] = {1, 1, 0};
ll dy[] = {0, 1, 1};

ll dfs(ll y, ll x, ll dir, vector<vector<ll>> &b,
       vector<vector<vector<ll>>> &v) {
  if (y == n - 1 && x == n - 1) {
    return 1;
  }

  if (v[y][x][dir] != -1) {
    return v[y][x][dir];
  }

  v[y][x][dir] = 0;

  for (ll i = 0; i < 3; i++) {
    ll ny = y + dy[i];
    ll nx = x + dx[i];

    if (dir == 0 && i == 2) continue;
    if (dir == 2 && i == 0) continue;

    if (ny < 0 || nx < 0 || ny >= n || nx >= n || b[ny][nx] == 1) continue;
    if (i == 1 && (b[ny - 1][nx] == 1 || b[ny][nx - 1] == 1)) continue;

    v[y][x][dir] += dfs(ny, nx, i, b, v);
  }

  return v[y][x][dir];
}

int main() {
  fastio;

  cin >> n;
  vector<vector<ll>> b(n, vector<ll>(n, 0));

  // 메모이제이션 배열을 3차원으로 선언:
  // [y][x][dir] (dir: 0=가로, 1=대각선, 2=세로)
  vector<vector<vector<ll>>> v(n, vector<vector<ll>>(n, vector<ll>(3, -1)));

  for (ll i = 0; i < n; i++) {
    for (ll j = 0; j < n; j++) {
      cin >> b[i][j];
    }
  }

  if (b[0][1] == 1) {
    cout << "0";
    return 0;
  }

  cout << dfs(0, 1, 0, b, v);

  return 0;
}
