/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 16234                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/16234                          #+#        #+#      #+#    */
/*   Solved: 2024/10/07 18:44:44 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int result;
int n, l, r;
vector<vector<int>> board;
vector<vector<int>> check;

int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};

void bfs(int py, int px, vector<pair<int, int>>& v, int& sumPop) {
  queue<pair<int, int>> q;
  q.push({py, px});
  check[py][px] = 1;
  v.push_back({py, px});
  sumPop = board[py][px];

  while (!q.empty()) {
    int y = q.front().first;
    int x = q.front().second;
    q.pop();

    for (int i = 0; i < 4; i++) {
      int ny = y + dy[i];
      int nx = x + dx[i];

      if (ny < 0 || nx < 0 || ny >= n || nx >= n || check[ny][nx]) continue;

      int diff = abs(board[ny][nx] - board[y][x]);
      if (l <= diff && diff <= r) {
        check[ny][nx] = 1;
        q.push({ny, nx});
        v.push_back({ny, nx});
        sumPop += board[ny][nx];
      }
    }
  }
}

int main() {
  cin >> n >> l >> r;

  board.resize(n, vector<int>(n, 0));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> board[i][j];
    }
  }

  result = 0;

  while (true) {
    check.assign(n, vector<int>(n, 0));
    bool moved = false;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (check[i][j] == 0) {
          vector<pair<int, int>> v;
          int sumPop = 0;
          bfs(i, j, v, sumPop);

          if (v.size() > 1) {
            int newPop = sumPop / v.size();
            for (auto& pos : v) {
              board[pos.first][pos.second] = newPop;
            }
            moved = true;
          }
        }
      }
    }

    if (!moved) {
      break;
    }

    result++;
  }

  cout << result << endl;

  return 0;
}
