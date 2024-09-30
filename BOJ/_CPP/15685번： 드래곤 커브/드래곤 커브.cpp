#include <bits/stdc++.h>

using namespace std;

int dx[] = {1, 0, -1, 0};
int dy[] = {0, -1, 0, 1};

int main() {
  int n;
  cin >> n;
  vector<vector<int>> totalBoard(101, vector<int>(101, 0));

  for (int i = 0; i < n; i++) {
    int x, y, d, g;
    cin >> x >> y >> d >> g;

    vector<int> directions;
    directions.push_back(d);
    totalBoard[y][x] = 1;

    for (int j = 0; j < g; j++) {
      int size = directions.size();
      for (int k = size - 1; k >= 0; k--) {
        directions.push_back((directions[k] + 1) % 4);
      }
    }

    for (int dir : directions) {
      x += dx[dir];
      y += dy[dir];
      if (x < 0 || y < 0 || x > 100 || y > 100) continue;
      totalBoard[y][x] = 1;
    }
  }

  int result = 0;
  for (int by = 0; by < 100; by++) {
    for (int bx = 0; bx < 100; bx++) {
      if (totalBoard[by][bx] == 1 && totalBoard[by + 1][bx] == 1 &&
          totalBoard[by][bx + 1] == 1 && totalBoard[by + 1][bx + 1] == 1) {
        result++;
      }
    }
  }

  cout << result;

  return 0;
}
