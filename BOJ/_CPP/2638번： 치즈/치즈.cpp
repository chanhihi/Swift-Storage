/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2638                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2638                           #+#        #+#      #+#    */
/*   Solved: 2024/10/20 13:54:33 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int n, m;

int dy[] = {0, -1, 0, 1};
int dx[] = {1, 0, -1, 0};

void InjectOutsideAir(int y, int x, vector<vector<int>> &b) {
  queue<pair<int, int>> q;
  q.push({y, x});
  b[y][x] = 2;

  while (!q.empty()) {
    auto fq = q.front();
    q.pop();
    int fy = fq.first;
    int fx = fq.second;

    for (int i = 0; i < 4; i++) {
      int ny = fy + dy[i];
      int nx = fx + dx[i];

      if (ny < 0 || ny >= n || nx < 0 || nx >= m || b[ny][nx] > 0) continue;
      b[ny][nx] = 2;
      q.push({ny, nx});
    }
  }
}

void checkCheeze(int y, int x, vector<vector<int>> &b,
                 vector<vector<int>> &nb) {
  int count = 0;
  for (int i = 0; i < 4; i++) {
    int ny = y + dy[i];
    int nx = x + dx[i];

    if (ny < 0 || ny >= n || nx < 0 || nx >= m || b[ny][nx] == 1) continue;
    if (b[ny][nx] == 2) count++;
  }

  if (count >= 2) {
    InjectOutsideAir(y, x, nb);
  }
}

int main() {
  cin >> n >> m;

  vector<vector<int>> cb(n, vector<int>(m));

  int result = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cin >> cb[i][j];
    }
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (cb[i][j] == 0) {
        if (i == 0 || i == n - 1 || j == 0 || j == m - 1)
          InjectOutsideAir(i, j, cb);
      }
    }
  }

  vector<vector<int>> ncb = cb;

  bool isAllZero = false;

  while (!isAllZero) {
    isAllZero = true;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (cb[i][j] == 1) {
          checkCheeze(i, j, cb, ncb);
          isAllZero = false;
        }
      }
    }
    cb = ncb;
    result++;
  }

  cout << result - 1;
  return 0;
}

// for (auto c : cb) {
//   for (auto cc : c) {
//     if (cc == 2) {
//       cout << "0 ";
//     } else
//       cout << cc << " ";
//   }
//   cout << "\n";
// }
// cout << "-----------\n";
