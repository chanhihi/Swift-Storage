#include <bits/stdc++.h>

using namespace std;

int dx[] = {1, 1, 1, -1, -1, -1, 0, 0, 0};
int dy[] = {0, 1, -1, 0, 1, -1, 1, -1, 0};

bool check(vector<vector<char>> &keyboard, vector<char> &shotgun, char key) {
  int n = keyboard.size();
  int m = keyboard[0].size();

  int x = -1, y = -1;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (keyboard[i][j] == key) {
        x = i;
        y = j;
        break;
      }
    }
    if (x != -1) break;
  }

  if (x == -1 || y == -1) {
    return false;
  }

  vector<char> temp;
  for (int i = 0; i < 9; i++) {
    int nx = x + dx[i];
    int ny = y + dy[i];

    if (nx >= 0 && nx < n && ny >= 0 && ny < m) {
      temp.push_back(keyboard[nx][ny]);
    }
  }

  if (temp.size() != shotgun.size()) {
    return false;
  }

  sort(temp.begin(), temp.end());
  return temp == shotgun;
}

int main() {
  vector<vector<char>> keyboard(5, vector<char>(10));
  vector<char> shotgun(9);

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 10; j++) {
      cin >> keyboard[i][j];
    }
  }

  for (int i = 0; i < 9; i++) {
    cin >> shotgun[i];
  }

  sort(shotgun.begin(), shotgun.end());

  for (int i = 0; i < 9; i++) {
    if (check(keyboard, shotgun, shotgun[i])) {
      cout << shotgun[i] << " ";
    }
  }
}