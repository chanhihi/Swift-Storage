#include <bits/stdc++.h>

using namespace std;

int dx[] = {0, 1, -1, 0, 0};
int dy[] = {0, 0, 0, -1, 1};

struct Dice {
  int current_bottom = 0;
  int current_top = 0;

  vector<vector<int>> dice = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

  void move(int dir) {
    switch (dir) {
      case 1:
        swap(dice[1][0], dice[3][1]);
        swap(dice[1][0], dice[1][1]);
        swap(dice[1][1], dice[1][2]);
        break;

      case 2:
        swap(dice[1][2], dice[3][1]);
        swap(dice[1][0], dice[1][1]);
        swap(dice[1][0], dice[1][2]);
        break;
      case 3:
        swap(dice[0][1], dice[1][1]);
        swap(dice[0][1], dice[2][1]);
        swap(dice[0][1], dice[3][1]);
        break;
      case 4:
        swap(dice[0][1], dice[1][1]);
        swap(dice[1][1], dice[2][1]);
        swap(dice[2][1], dice[3][1]);
        break;
      default:
        break;
    }

    this->current_bottom = dice[1][1];
    this->current_top = dice[3][1];

    cout << this->current_top << "\n";
  }

  void change(int number) {
    this->current_bottom = number;
    dice[1][1] = number;
  }
};

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  cout.tie(nullptr);

  int n, m, x, y, k;
  cin >> n >> m >> y >> x >> k;

  vector<int> commans(k);
  vector<vector<int>> nm(n, vector<int>(m));
  Dice dice = Dice();

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cin >> nm[i][j];
    }
  }

  for (int i = 0; i < k; i++) {
    cin >> commans[i];
  }

  for (auto &command : commans) {
    int dn = y + dy[command];
    int dm = x + dx[command];

    if (dn >= n || dn < 0 || dm >= m || dm < 0) {
      continue;
    }

    dice.move(command);

    if (nm[dn][dm] == 0) {
      nm[dn][dm] = dice.current_bottom;
    } else {
      dice.change(nm[dn][dm]);
      nm[dn][dm] = 0;
    }

    y = dn;
    x = dm;
  }
  return 0;
}