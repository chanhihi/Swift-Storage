#include <bits/stdc++.h>

using namespace std;

int n, m;

vector<vector<char> > board;
bool visitedBoard[10][10][10][10];

struct State {
  int rx, ry, bx, by, depth;
};

int dx[] = {-1, 1, 0, 0};
int dy[] = {0, 0, -1, 1};

void input() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cin >> board[i][j];
    }
  }
}

void output() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cout << board[i][j];
    }
    cout << "\n";
  }
}

void move(int &x, int &y, int &steps, int dir) {
  steps = 0;
  while (board[y + dy[dir]][x + dx[dir]] != '#' && board[y][x] != 'O') {
    x += dx[dir];
    y += dy[dir];
    steps++;
  }
}

int bfs(State curstate) {
  queue<State> q;
  q.push(curstate);
  visitedBoard[curstate.rx][curstate.ry][curstate.bx][curstate.by] = true;
  while (!q.empty()) {
    int cur_rx, cur_ry, cur_bx, cur_by, depth;
    State qFront = q.front();

    cur_rx = qFront.rx;
    cur_ry = qFront.ry;
    cur_bx = qFront.bx;
    cur_by = qFront.by;
    depth = qFront.depth;

    q.pop();

    if (depth > 10) {
      return -1;
    }

    for (int i = 0; i < 4; i++) {
      int next_rx = cur_rx, next_ry = cur_ry;
      int next_bx = cur_bx, next_by = cur_by;
      int r_steps = 0, b_steps = 0;

      move(next_rx, next_ry, r_steps, i);
      move(next_bx, next_by, b_steps, i);

      if (board[next_by][next_bx] == 'O') continue;
      if (board[next_ry][next_rx] == 'O') {
        return depth == 10 ? -1 : depth + 1;
      }

      if (next_rx == next_bx && next_ry == next_by) {
        if (r_steps > b_steps) {
          next_rx -= dx[i];
          next_ry -= dy[i];
        } else {
          next_bx -= dx[i];
          next_by -= dy[i];
        }
      }

      if (!visitedBoard[next_rx][next_ry][next_bx][next_by]) {
        visitedBoard[next_rx][next_ry][next_bx][next_by] = true;
        q.push({next_rx, next_ry, next_bx, next_by, depth + 1});
      }
    }
  }
  return -1;
}

int main() {
  State curstate = State();

  cin >> n >> m;

  board.resize(n, vector<char>(m));
  input();

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (board[i][j] == 'R') {
        curstate.rx = j;
        curstate.ry = i;
      } else if (board[i][j] == 'B') {
        curstate.bx = j;
        curstate.by = i;
      }
    }
  }
  curstate.depth = 0;
  cout << bfs(curstate);

  return 0;
}