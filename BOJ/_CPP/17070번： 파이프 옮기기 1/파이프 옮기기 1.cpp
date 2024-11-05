/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17070                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17070                          #+#        #+#      #+#    */
/*   Solved: 2024/10/21 20:33:29 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

int n, count = 0;
int dx[] = {1, 1, 0};
int dy[] = {0, 1, 1};

void dfs(int y, int x, int dir, vector<vector<int>> &b) {
  // cout << "dfs" << y << ", " << x << "\n";
  if (y == n - 1 && x == n - 1) {
    count++;
    return;
  }

  for (int i = 0; i < 3; i++) {
    int ny = y + dy[i];
    int nx = x + dx[i];

    if (dir == 0 && i == 2)
      continue;  // 가로인 경우 세로 파이프 못 둠
    else if (dir == 2 && i == 0)
      continue;  // 세로인 경우 가로 파이프 못 둠

    if (ny < 0 || nx < 0 || ny >= n || nx >= n || b[ny][nx] == 1) continue;
    if (i == 1 && (b[ny - 1][nx] == 1 || b[ny][nx - 1] == 1)) continue;
    // 거슬로 올라오는 경우가 없어서 방문 처리 불필요
    dfs(ny, nx, i, b);
  }
}

int main() {
  // 1 base index, 0 room, 1 wall, n max : 16
  cin >> n;

  vector<vector<int>> b(n, vector<int>(n, 0));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> b[i][j];
    }
  }

  if (b[0][2] == 1) {
    cout << "0";
    return 0;
  }

  dfs(0, 1, 0, b);
  cout << count;
  return 0;
}