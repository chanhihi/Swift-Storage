#include <string.h>

#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

int map[101][101] = {0};
int numbers[101][101] = {0};

void getNumbers(bool isR, int row_size, int col_size) {
  memset(numbers, 0, sizeof(numbers));
  if (isR) {
    for (int i = 1; i <= row_size; i++) {
      for (int j = 1; j <= col_size; j++) {
        if (map[i][j] == 0) continue;
        numbers[i][map[i][j]]++;
      }
    }
  } else {
    for (int j = 1; j <= col_size; j++) {
      for (int i = 1; i <= row_size; i++) {
        if (map[i][j] == 0) continue;
        numbers[j][map[i][j]]++;
      }
    }
  }
}

bool comparePair(pair<int, int> a, pair<int, int> b) {
  if (a.second == b.second) return a.first < b.first;
  return a.second < b.second;
}

void setMap(bool isR, int row_size, int col_size) {
  if (isR) {
    for (int i = 1; i <= row_size; i++) {
      vector<pair<int, int>> temp;
      for (int num = 1; num <= 100; num++) {
        if (numbers[i][num] > 0) {
          temp.push_back({num, numbers[i][num]});
        }
      }

      sort(temp.begin(), temp.end(), comparePair);

      int idx = 1;
      for (auto &p : temp) {
        map[i][idx++] = p.first;
        map[i][idx++] = p.second;
        if (idx > 100) break;
      }

      for (int j = idx; j <= 100; j++) map[i][j] = 0;
    }
  } else {
    for (int j = 1; j <= col_size; j++) {
      vector<pair<int, int>> temp;
      for (int num = 1; num <= 100; num++) {
        if (numbers[j][num] > 0) {
          temp.push_back({num, numbers[j][num]});
        }
      }

      sort(temp.begin(), temp.end(), comparePair);

      int idx = 1;
      for (auto &p : temp) {
        map[idx++][j] = p.first;
        map[idx++][j] = p.second;
        if (idx > 100) break;
      }

      for (int i = idx; i <= 100; i++) map[i][j] = 0;
    }
  }
}

bool isRC(int &row_size, int &col_size) {
  int r = 3, c = 3;
  for (int i = 1; i <= 100; i++) {
    for (int j = 1; j <= 100; j++) {
      if (map[i][j] != 0) {
        r = max(r, i);
        c = max(c, j);
      }
    }
  }
  row_size = r;
  col_size = c;
  return r >= c;
}

int main() {
  ios::sync_with_stdio(false), cin.tie(0);

  int r, c, k;
  cin >> r >> c >> k;

  for (int i = 1; i <= 3; i++)
    for (int j = 1; j <= 3; j++) cin >> map[i][j];

  int t = 0;
  int row_size = 3, col_size = 3;

  while (t <= 100) {
    if (map[r][c] == k) {
      cout << t;
      return 0;
    }

    bool isR = isRC(row_size, col_size);
    getNumbers(isR, row_size, col_size);
    memset(map, 0, sizeof(map));
    setMap(isR, row_size, col_size);

    t++;
  }

  cout << "-1";
}
