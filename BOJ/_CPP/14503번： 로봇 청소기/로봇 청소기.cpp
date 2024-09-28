#include <bits/stdc++.h>

using namespace std;

int dx[] = {0, 1, 0, -1};
int dy[] = {-1, 0, 1, 0};

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  cout.tie(nullptr);

  int n, m, r, c, d, site;

  cin >> n >> m >> r >> c >> d;

  vector<vector<int>> board(n, vector<int>(m));
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cin >> board[i][j];
    }
  }
  site = 0;

  while (true) {
    if (board[r][c] == 0) {
      board[r][c] = 2;
      site++;
    }

    bool back = true;

    for (int i = 0; i < 4; i++) {
      d = (d + 3) % 4;

      int dn = r + dy[d];
      int dm = c + dx[d];

      if (dm >= 0 && dm < m && dn >= 0 && dn < n && board[dn][dm] == 0) {
        r = dn;
        c = dm;
        back = false;
        break;
      }
    }

    if (back) {
      int tD = (d + 2) % 4;

      int dn = r + dy[tD];
      int dm = c + dx[tD];

      if (dm >= 0 && dm < m && dn >= 0 && dn < n && board[dn][dm] == 1) {
        break;
      }

      r = dn;
      c = dm;
    }
  }

  cout << site;
  return 0;
}