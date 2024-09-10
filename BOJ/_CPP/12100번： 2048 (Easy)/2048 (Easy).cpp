#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int n;
int maxNumber = 0;

vector<int> cleanUP(vector<int> newLine, vector<int> oldLine) {
  int index = 0;

  for (int i = 0; i < n; i++) {
    if (oldLine[i] != 0) {
      newLine[index++] = oldLine[i];
    }
  }

  return newLine;
}

void addNumber(vector<int>& line) {
  for (int i = 0; i < n - 1; i++) {
    if (line[i] == line[i + 1] && line[i] != 0) {
      line[i] *= 2;
      line[i + 1] = 0;
      maxNumber = max(maxNumber, line[i]);
    }
  }
}

vector<int> mergeLine(vector<int> line) {
  vector<int> newLine(n, 0);
  newLine = cleanUP(newLine, line);
  addNumber(newLine);
  vector<int> finalLine(n, 0);
  return cleanUP(finalLine, newLine);
}

vector<vector<int>> moveLeft(vector<vector<int>> board) {
  for (int i = 0; i < n; i++) {
    board[i] = mergeLine(board[i]);
  }
  return board;
}

vector<vector<int>> rotateClockwise(vector<vector<int>> board) {
  vector<vector<int>> newBoard(n, vector<int>(n));
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      newBoard[j][n - 1 - i] = board[i][j];
    }
  }
  return newBoard;
}

void dfs(vector<vector<int>> board, int depth) {
  if (depth == 5) return;

  for (int i = 0; i < 4; i++) {
    vector<vector<int>> newBoard = moveLeft(board);
    dfs(newBoard, depth + 1);
    board = rotateClockwise(board);
  }
}

int main() {
  cin >> n;
  vector<vector<int>> board(n, vector<int>(n));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> board[i][j];
      maxNumber = max(maxNumber, board[i][j]);
    }
  }

  dfs(board, 0);

  cout << maxNumber << endl;

  return 0;
}
