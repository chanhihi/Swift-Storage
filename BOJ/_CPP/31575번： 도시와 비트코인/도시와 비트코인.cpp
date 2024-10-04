/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 31575                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/31575                          #+#        #+#      #+#    */
/*   Solved: 2024/10/04 15:59:52 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int dx[] = {1, 0};
int dy[] = {0, 1};

int main() {
  int n, m;
  cin >> n >> m;

  vector<vector<int>> board(m, vector<int>(n));

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      cin >> board[i][j];
    }
  }

  vector<vector<bool>> check(m, vector<bool>(n, true));

  queue<pair<int, int>> q;
  q.push({0, 0});
  check[0][0] = false;

  while (!q.empty()) {
    int y = q.front().first;
    int x = q.front().second;
    q.pop();

    for (int i = 0; i < 2; i++) {
      int ny = y + dy[i];
      int nx = x + dx[i];
      if (nx >= 0 && nx < n && ny >= 0 && ny < m && board[ny][nx] &&
          check[ny][nx]) {
        check[ny][nx] = false;
        q.push({ny, nx});
      }
    }
  }

  if (!check[m - 1][n - 1])
    cout << "Yes";
  else
    cout << "No";
}