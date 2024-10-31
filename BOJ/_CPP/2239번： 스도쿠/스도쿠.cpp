/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2239                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2239                           #+#        #+#      #+#    */
/*   Solved: 2024/10/31 14:24:31 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
int b[9][9] = {0};

bool checkCross(int y, int x, int n) {
  for (int i = 0; i < 9; ++i) {
    if (b[y][i] == n || b[i][x] == n) return false;
  }
  return true;
}

bool checkGroup(int y, int x, int n) {
  int ny = (y / 3) * 3;
  int nx = (x / 3) * 3;

  for (int r = ny; r < ny + 3; ++r) {
    for (int c = nx; c < nx + 3; ++c) {
      if (b[r][c] == n) return false;
    }
  }
  return true;
}

void printArray() {
  for (int i = 0; i < 9; ++i) {
    for (int j = 0; j < 9; ++j) {
      cout << b[i][j];
    }
    cout << "\n";
  }
}

bool fillContents(queue<pair<int, int>> nZ) {
  if (nZ.empty()) {
    printArray();
    return true;
  }

  int ny = nZ.front().first;
  int nx = nZ.front().second;
  nZ.pop();

  for (int i = 1; i <= 9; ++i) {
    if (checkCross(ny, nx, i) && checkGroup(ny, nx, i)) {
      b[ny][nx] = i;
      if (fillContents(nZ)) return true;
      b[ny][nx] = 0;
    }
  }

  nZ.push({ny, nx});
  return false;
}

int main() {
  fastio;
  char n;
  queue<pair<int, int>> nextZero;
  bool v[9][9] = {0};

  for (int i = 0; i < 9; ++i) {
    for (int j = 0; j < 9; ++j) {
      cin >> n;
      b[i][j] = n - '0';
      if (b[i][j] == 0) nextZero.push({i, j});
    }
  }

  fillContents(nextZero);

  return 0;
}