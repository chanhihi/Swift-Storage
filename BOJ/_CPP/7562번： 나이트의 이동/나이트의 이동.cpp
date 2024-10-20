/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 7562                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/7562                           #+#        #+#      #+#    */
/*   Solved: 2024/10/15 12:24:37 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

int dy[] = {-2, -1, 1, 2, 2, 1, -1, -2};
int dx[] = {1, 2, 2, 1, -1, -2, -2, -1};
int l, r, c, rr, rc, result;

void bfs(int y, int x, vector<vector<int>> cb) {
  queue<pair<int, int>> q;
  q.push({y, x});
  cb[y][x] = 0;

  while (!q.empty()) {
    int yy = q.front().first;
    int xx = q.front().second;
    int mc = cb[yy][xx];

    q.pop();

    if (yy == rr && xx == rc) {
      cout << mc << "\n";
      return;
    }

    for (int i = 0; i < 8; i++) {
      int ny = yy + dy[i];
      int nx = xx + dx[i];

      if (ny < 0 || nx < 0 || ny >= l || nx >= l || cb[ny][nx] != 0) continue;
      cb[ny][nx] = mc + 1;
      q.push({ny, nx});
      result++;
    }
  }
}

int main() {
  fastio;
  int T;
  cin >> T;
  while (T--) {
    cin >> l >> r >> c >> rr >> rc;
    vector<vector<int>> cb(l, vector<int>(l, 0));
    bfs(r, c, cb);
  }
  return 0;
}