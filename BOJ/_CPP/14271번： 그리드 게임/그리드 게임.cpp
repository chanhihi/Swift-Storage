/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 14271                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/14271                          #+#        #+#      #+#    */
/*   Solved: 2024/12/06 18:47:48 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>
#include <queue>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)
#define ROW_OFFSET 1500
#define COL_OFFSET 1500

using namespace std;
using ll = long long;

int dx[] = {0, 1, 0, -1};
int dy[] = {-1, 0, 1, 0};

vector<vector<bool>> found(3100, vector<bool>(3100, false));

struct Info {
  int row;
  int col;
  int moveCnt;
};

int main() {
  FASTIO;

  int n, m, k;
  cin >> n >> m;
  ll cnt = 0;
  queue<Info> q;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      char ch;
      cin >> ch;
      if (ch == 'o') {
        found[i + ROW_OFFSET][j + COL_OFFSET] = true;
        q.push({i + ROW_OFFSET, j + COL_OFFSET, 0});
      }
    }
  }

  cin >> k;

  while (!q.empty()) {
    auto cur = q.front();
    q.pop();
    cnt++;
    if (cur.moveCnt >= k) continue;

    for (int i = 0; i < 4; i++) {
      int nr = cur.row + dy[i];
      int nc = cur.col + dx[i];
      if (found[nr][nc]) continue;
      found[nr][nc] = true;
      q.push({nr, nc, cur.moveCnt + 1});
    }
  }
  cout << cnt;
}