/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 26169                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/26169                          #+#        #+#      #+#    */
/*   Solved: 2024/10/04 17:20:27 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int r, c;
int apple = 0;
int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};
int board[5][5];

void dfs(int y, int x, int depth, int current_apple) {
  if (board[y][x] == 1) current_apple++;
  if (depth == 3) {
    if (current_apple >= 2) apple = 1;
    return;
  }

  for (int i = 0; i < 4; i++) {
    int nx = x + dx[i];
    int ny = y + dy[i];

    if (nx < 0 || ny < 0 || nx > 4 || ny > 4 || board[y][x] == -1) {
      continue;
    }

    board[y][x] = -1;
    dfs(ny, nx, depth + 1, current_apple);
    board[y][x] = 0;
  }
}

int main() {
  for (int i = 0; i < 5; i++)
    for (int j = 0; j < 5; j++) cin >> board[i][j];
  cin >> r >> c;
  dfs(r, c, 0, 0);
  cout << apple;
}