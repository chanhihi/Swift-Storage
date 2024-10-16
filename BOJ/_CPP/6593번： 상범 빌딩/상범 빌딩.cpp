/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 6593                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/6593                           #+#        #+#      #+#    */
/*   Solved: 2024/10/16 18:22:37 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <tuple>
#include <vector>

using namespace std;

int dz[] = {1, -1, 0, 0, 0, 0};
int dx[] = {0, 0, 1, -1, 0, 0};
int dy[] = {0, 0, 0, 0, 1, -1};

int l, r, c;
int sz, sr, sc;
vector<vector<vector<int>>> b;

void bfs(int z, int y, int x) {
  queue<tuple<int, int, int>> q;
  q.push({z, y, x});
  b[z][y][x] = 0;

  while (!q.empty()) {
    auto value = q.front();
    q.pop();
    int fz = get<0>(value);
    int fy = get<1>(value);
    int fx = get<2>(value);

    for (int i = 0; i < 6; i++) {
      int nz = fz + dz[i];
      int ny = fy + dy[i];
      int nx = fx + dx[i];

      if (nz < 0 || nz >= l || ny < 0 || ny >= r || nx < 0 || nx >= c ||
          b[nz][ny][nx] < -1 || b[nz][ny][nx] > 0)
        continue;

      if (b[nz][ny][nx] == -1) {
        cout << "Escaped in " << b[fz][fy][fx] + 1 << " minute(s).\n";
        return;
      }

      b[nz][ny][nx] = b[fz][fy][fx] + 1;

      q.push({nz, ny, nx});
    }
  }
  cout << "Trapped!\n";
}

int main() {
  while (true) {
    cin >> l >> r >> c;
    if (l == 0 && r == 0 && c == 0) break;

    b.assign(l, vector<vector<int>>(r, vector<int>(c, 0)));
    for (int cl = 0; cl < l; cl++) {
      for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
          char ts;
          cin >> ts;
          if (ts == '.') {
            b[cl][i][j] = 0;
          } else if (ts == '#') {
            b[cl][i][j] = -2;
          } else if (ts == 'E') {
            b[cl][i][j] = -1;
          } else if (ts == 'S') {
            sz = cl;
            sr = i;
            sc = j;
          }
        }
      }
    }

    bfs(sz, sr, sc);
  }

  return 0;
}