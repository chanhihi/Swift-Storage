#include <bits/stdc++.h>

using namespace std;

int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};

int main() {
  int n, k, l;
  cin >> n >> k;

  vector<vector<int>> board(n, vector<int>(n));
  char list[10000] = {0};

  for (int i = 0; i < k; i++) {
    int y, x;
    cin >> y >> x;
    board[y - 1][x - 1] = 1;
  }

  cin >> l;
  for (int i = 0; i < l; i++) {
    int x;
    char c;
    cin >> x >> c;
    list[x] = c;
  }

  deque<pair<int, int>> snake;

  int nx = 0, ny = 0;
  int dir = 0, sec = 0;
  snake.push_back({0, 0});

  while (nx >= 0 && nx < n && ny >= 0 && ny < n) {
    if (list[sec] == 'D') {
      dir = (dir + 1) % 4;
    } else if (list[sec] == 'L') {
      dir = (dir + 3) % 4;
    }

    nx += dx[dir];
    ny += dy[dir];

    auto it = find(snake.begin(), snake.end(), pair<int, int>{nx, ny});

    if (nx < 0 || ny < 0 || nx >= n || ny >= n || it != snake.end()) {
      break;
    }

    if (!board[ny][nx]) {
      snake.pop_back();
    } else {
      board[ny][nx] = 0;
    }
    snake.push_front({nx, ny});

    sec++;
  }

  cout << sec + 1;

  return 0;
}