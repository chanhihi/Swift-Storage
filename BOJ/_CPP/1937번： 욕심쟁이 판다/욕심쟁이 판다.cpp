/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1937                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1937                           #+#        #+#      #+#    */
/*   Solved: 2024/11/01 10:02:00 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

int dy[] = {0, 1, 0, -1};
int dx[] = {1, 0, -1, 0};

vector<vector<int>> forest;
vector<vector<int>> dp;

int n;

int dfs(int r, int c) {
  if (dp[r][c] != -1) return dp[r][c];
  int &ans = dp[r][c];
  ans = 1;

  for (int i = 0; i < 4; i++) {
    int nr = r + dy[i];
    int nc = c + dx[i];

    if ((nr < 0) || (nr >= n) || (nc < 0) || (nc >= n)) continue;
    if (forest[nr][nc] > forest[r][c]) {
      ans = max(ans, dfs(nr, nc) + 1);
    }
  }
  return ans;
}

int solve() {
  int sol = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      sol = max(sol, dfs(i, j));
    }
  }
  return sol;
}

int main() {
  cin >> n;

  forest.resize(n, vector<int>(n, 0));
  dp.resize(n, vector<int>(n, -1));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) cin >> forest[i][j];
  }

  cout << solve();

  return 0;
}