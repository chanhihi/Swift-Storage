/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17181                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17181                          #+#        #+#      #+#    */
/*   Solved: 2024/10/29 12:15:52 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <limits.h>

#include <iostream>
#include <queue>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0);

using namespace std;

int n, m;
int dx[] = {1, 0, -1, 0};
int dy[] = {0, -1, 0, 1};

const int MAX = 50, INF = INT_MAX;
int map[MAX][MAX];
int dp[MAX][MAX][3];

bool is_consonant(int num) { return num >= 0 && num <= 13; }

void dfs(int y, int x, int type, int cnt) {
  if (dp[y][x][type] <= cnt) return;
  dp[y][x][type] = cnt;

  for (int i = 0; i < 4; i++) {
    int nextY = y + dy[i];
    int nextX = x + dx[i];
    if (!(nextY >= 0 && nextY < n && nextX >= 0 && nextX < m)) continue;

    int currT = (map[nextY][nextX] >= 0 && map[nextY][nextX] <= 13) ? 0 : 1;

    if (type == 0 && currT == 1) dfs(nextY, nextX, 1, cnt + 1);
    if (type == 1 && currT == 0) {
      dfs(nextY, nextX, 2, cnt);
      dfs(nextY, nextX, 0, cnt);
    }
    if (type == 2 && currT == 0) dfs(nextY, nextX, 0, cnt);
  }
}

int main() {
  fastio;
  cin >> n >> m;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cin >> map[i][j];
      for (int k = 0; k < 3; k++) dp[i][j][k] = INF;
    }
  }
  if (is_consonant(map[0][0])) {
    dfs(0, 0, 0, 0);
  }
  int ans = min(dp[n - 1][m - 1][1], dp[n - 1][m - 1][2]);
  if (ans == INF) {
    cout << "BAD\n";
  } else {
    cout << ans << "\n";
  }
  return 0;
}