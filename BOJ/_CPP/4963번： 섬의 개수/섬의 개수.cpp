/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 4963                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/4963                           #+#        #+#      #+#    */
/*   Solved: 2024/10/04 16:30:40 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int dx[] = {1, 0, -1, 0, 1, -1, 1, -1};
int dy[] = {0, 1, 0, -1, 1, -1, -1, 1};

vector<vector<int>> board;

int w, h;

template <typename t>
void pa2(t T) {
  for (auto &P : T) {
    for (auto &p : P) cout << p << " ";
    cout << "\n";
  }
  cout << "\n";
}

void bfs(int sy, int sx) {
  queue<pair<int, int>> q;
  q.push({sy, sx});
  board[sy][sx] = 0;

  while (!q.empty()) {
    int y = q.front().first;
    int x = q.front().second;
    q.pop();

    for (int i = 0; i < 8; i++) {
      int nx = x + dx[i];
      int ny = y + dy[i];

      if (nx >= 0 && nx < w && ny >= 0 && ny < h && board[ny][nx] == 1) {
        board[ny][nx] = 0;
        q.push({ny, nx});
      }
    }
  }
}

int main() {
  while (true) {
    int island = 0;
    cin >> w >> h;
    if (w == 0 && h == 0) break;

    board.clear();
    board.resize(h, vector<int>(w));

    for (int i = 0; i < h; i++) {
      for (int j = 0; j < w; j++) {
        cin >> board[i][j];
      }
    }

    for (int i = 0; i < h; i++) {
      for (int j = 0; j < w; j++) {
        if (board[i][j] == 1) {
          bfs(i, j);
          island++;
        }
      }
    }

    cout << island << "\n";
  }
  return 0;
}