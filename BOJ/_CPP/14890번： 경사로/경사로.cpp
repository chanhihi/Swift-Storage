#include <bits/stdc++.h>
using namespace std;

vector<vector<int>> board;
int n, l, result = 0;

void input() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> board[i][j];
    }
  }
}

bool checkLine(vector<int>& line) {
  vector<bool> used(n, false);

  for (int i = 0; i < n - 1; i++) {
    int diff = line[i + 1] - line[i];

    if (diff == 0) {
      continue;
    } else if (diff == 1) {
      for (int j = 0; j < l; j++) {
        if (i - j < 0 || line[i - j] != line[i] || used[i - j]) {
          return false;
        }
        used[i - j] = true;
      }
    } else if (diff == -1) {
      for (int j = 1; j <= l; j++) {
        if (i + j >= n || line[i + j] != line[i + 1] || used[i + j]) {
          return false;
        }
        used[i + j] = true;
      }
    } else {
      return false;
    }
  }

  return true;
}

void checkPaths() {
  for (int i = 0; i < n; i++) {
    if (checkLine(board[i])) {
      result++;
    }
  }

  for (int j = 0; j < n; j++) {
    vector<int> line(n);
    for (int i = 0; i < n; i++) {
      line[i] = board[i][j];
    }
    if (checkLine(line)) {
      result++;
    }
  }
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  cin >> n >> l;
  board.resize(n, vector<int>(n));
  input();

  checkPaths();
  cout << result;

  return 0;
}
