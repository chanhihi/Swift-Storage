/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 26170                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/26170                          #+#        #+#      #+#    */
/*   Solved: 2024/10/04 18:30:37 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int result = 1e9;
int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};
int board[5][5] = {0};

void dfs(int y, int x, int depth, int apple) {
  if (board[y][x] == 1) {
    apple++;
  }

  if (apple == 3) {
    result = min(result, depth);
    return;
  }

  int origin_content = board[y][x];
  board[y][x] = -1;

  for (int i = 0; i < 4; i++) {
    int nx = x + dx[i];
    int ny = y + dy[i];

    if (nx < 0 || ny < 0 || nx > 4 || ny > 4 || board[ny][nx] == -1) {
      continue;
    }

    dfs(ny, nx, depth + 1, apple);
  }

  board[y][x] = origin_content;
}

int main() {
  for (int i = 0; i < 5; i++)
    for (int j = 0; j < 5; j++) cin >> board[i][j];
  int r, c;
  cin >> r >> c;
  dfs(r, c, 0, 0);
  if (result == 1e9) {
    cout << "-1";
  } else {
    cout << result;
  }
}