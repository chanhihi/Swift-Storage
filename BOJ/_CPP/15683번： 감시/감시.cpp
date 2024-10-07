/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15683                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15683                          #+#        #+#      #+#    */
/*   Solved: 2024/10/07 20:38:40 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int n, m;

int returnBlockSight(vector<vector<int>> &board) {
  int blockSight = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (board[i][j] == 0) blockSight++;
    }
  }
  return blockSight;
}

void up(int y, int x, vector<vector<int>> &board) {
  for (int i = y; i < n; i++) {
    if (board[i][x] == 6) break;
    if (board[i][x] < 6 && board[i][x] > 0) continue;
    board[i][x] = 7;
  }
}

void down(int y, int x, vector<vector<int>> &board) {
  for (int i = y; i >= 0; i--) {
    if (board[i][x] == 6) break;
    if (board[i][x] < 6 && board[i][x] > 0) continue;
    board[i][x] = 7;
  }
}

void left(int y, int x, vector<vector<int>> &board) {
  for (int i = x; i >= 0; i--) {
    if (board[y][i] == 6) break;
    if (board[y][i] < 6 && board[y][i] > 0) continue;
    board[y][i] = 7;
  }
}

void right(int y, int x, vector<vector<int>> &board) {
  for (int i = x; i < m; i++) {
    if (board[y][i] == 6) break;
    if (board[y][i] < 6 && board[y][i] > 0) continue;
    board[y][i] = 7;
  }
}

void activeSight(int y, int x, vector<vector<int>> &board, int cctvModel,
                 int cctvDir) {
  // 벽 6, 빈칸 0, 1 >, 2 <>, 3 ㄴ, 4 ㅗ, 5 <|>
  switch (cctvModel) {
    case 1:
      if (cctvDir == 1) right(y, x, board);
      if (cctvDir == 2) down(y, x, board);
      if (cctvDir == 3) left(y, x, board);
      if (cctvDir == 4) up(y, x, board);
      break;
    case 2:
      if (cctvDir == 1 || cctvDir == 3) {
        right(y, x, board);
        left(y, x, board);
      }
      if (cctvDir == 2 || cctvDir == 4) {
        down(y, x, board);
        up(y, x, board);
      }
      break;
    case 3:
      if (cctvDir == 1) {
        up(y, x, board);
        right(y, x, board);
      }
      if (cctvDir == 2) {
        right(y, x, board);
        down(y, x, board);
      }
      if (cctvDir == 3) {
        left(y, x, board);
        down(y, x, board);
      }
      if (cctvDir == 4) {
        up(y, x, board);
        left(y, x, board);
      }
      break;
    case 4:
      if (cctvDir == 1) {
        right(y, x, board);
        up(y, x, board);
        left(y, x, board);
      }
      if (cctvDir == 2) {
        down(y, x, board);
        right(y, x, board);
        up(y, x, board);
      }
      if (cctvDir == 3) {
        right(y, x, board);
        down(y, x, board);
        left(y, x, board);
      }
      if (cctvDir == 4) {
        up(y, x, board);
        down(y, x, board);
        left(y, x, board);
      }
      break;
    case 5:
      if (cctvDir == 1 || cctvDir == 2 || cctvDir == 3 || cctvDir == 4) {
        right(y, x, board);
        down(y, x, board);
        left(y, x, board);
        up(y, x, board);
      }
      break;

    default:
      break;
  }
}

vector<vector<int>> cctvRotation(vector<int> check,
                                 vector<vector<int>> &board) {
  vector<vector<int>> newBoard = board;
  int cindex = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (newBoard[i][j] >= 1 && newBoard[i][j] <= 5) {
        activeSight(i, j, newBoard, newBoard[i][j], check[cindex++]);
      }
    }
  }

  return newBoard;
}

int main() {
  int result = 1e9;
  cin >> n >> m;
  vector<vector<int>> board(n, vector<int>(m, 0));
  vector<int> check;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      int x;
      cin >> x;
      board[i][j] = x;
      if (x >= 1 && x <= 5) check.push_back(1);
    }
  }

  int total = 0;
  do {
    vector<vector<int>> temp = cctvRotation(check, board);
    result = min(result, returnBlockSight(temp));
    int i = 0;
    while (i < check.size()) {
      check[i]++;
      total++;
      if (check[i] <= 4) break;
      check[i] = 1;
      i++;
    }
  } while (count(check.begin(), check.end(), 1) != check.size());

  cout << result;

  return 0;
}