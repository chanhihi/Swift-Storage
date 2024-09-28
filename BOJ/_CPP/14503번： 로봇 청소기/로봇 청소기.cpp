#include <bits/stdc++.h>

using namespace std;

// 현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소한다.
// 현재 칸의 주변
// $4$칸 중 청소되지 않은 빈 칸이 없는 경우,
// 바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로
// 돌아간다. 바라보는 방향의 뒤쪽 칸이 벽이라 후진할 수 없다면 작동을 멈춘다.
// 현재 칸의 주변
// $4$칸 중 청소되지 않은 빈 칸이 있는 경우,
// 반시계 방향으로
// $90^\circ$ 회전한다.
// 바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우 한 칸 전진한다.
// 1번으로 돌아간다.

int dx[] = {0, 1, 0, -1};
int dy[] = {-1, 0, 1, 0};

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  cout.tie(nullptr);

  int n, m, r, c, d, site;
  bool back = false;

  cin >> n >> m >> r >> c >> d;

  vector<vector<int>> board(n, vector<int>(m));
  for (int i = 0; i < n; i++) {
    cin >> board[n][m];
  }
  site = 0;

  while (true) {
    if (board[r][c] == 0) {
      board[r][c] = 2;
      site++;
    }

    if (back) {
      int tD = (2 + d) % 4;

      int dm = r + dx[tD];
      int dn = c + dy[tD];

      if (board[dn][dm] == 1) {
        break;
      }

      r = dm;
      c = dn;
    }

    for (int i = 0; i < 4; i++) {
      back = true;

      int dm = r + dx[d];
      int dn = c + dy[d];

      d = (3 + d) % 4;

      if (board[dn][dm] == 0) {
        r = dn;
        c = dm;
        back = false;
        break;
      }
    }
  }

  cout << site;
  return 0;
}