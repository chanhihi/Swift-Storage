#include <bits/stdc++.h>

using namespace std;

vector<vector<int>> board;
int n, l;
int result = 0;

void input() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> board[i][j];
    }
  }
}

void output() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cout << board[i][j];
    }
    cout << "\n";
  }
}

vector<vector<int>> rotateBoard() {
  vector<vector<int>> newBoard(n, vector<int>(n));
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      newBoard[j][n - 1 - i] = board[i][j];
    }
  }
  return newBoard;
}

void checkLine(vector<int> line) {
  int prev = line[0];
  vector<int> upDown(n);

  for (int i = 1; i < n; i++) {
    int h = abs(prev - line[i]);

    if (h > 1) {
      return;
    } else if (h > 0) {
      if (i < l) {
        return;
      }

      for (int j = i; j < l + i; j++) {
        if (j >= n) {
          return;
        }
        upDown[j] = 1;
      }
      prev = line[i];
    }
  }

  reverse(line.begin(), line.end());
  for (int i = 1; i < n; i++) {
    int h = abs(prev - line[i]);

    if (h > 1) {
      return;
    } else if (h > 0) {
      if (i < l) {
        return;
      }
      for (int j = i; j < l + i; j++) {
        if (j >= n) {
          return;
        }
        upDown[j] = 1;
      }
      prev = line[i];
    }
  }

  if (*max_element(upDown.begin(), upDown.end()) < 2) {
    result++;
  }
}

void checkUpDown() {
  for (int i = 0; i < n; i++) {
    checkLine(board[i]);
  }
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  cout.tie(nullptr);

  cin >> n >> l;
  board.resize(n, vector<int>(n));

  input();
  checkUpDown();
  board = rotateBoard();
  checkUpDown();
  cout << result;
  return 0;
}