/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 23291                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/23291                          #+#        #+#      #+#    */
/*   Solved: 2024/10/11 20:20:28 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <deque>
#include <iostream>

using namespace std;

#define MAX 100

deque<int> d[MAX];

int dx[] = {0, -1};
int dy[] = {1, 0};

bool check(int &minV, int &maxV, int K) {
  minV = *min_element(d[0].begin(), d[0].end());
  maxV = *max_element(d[0].begin(), d[0].end());
  return maxV - minV <= K ? true : false;
}

bool canBuild(int w, int h) {
  if (d[0].size() - w < h) {
    return false;
  }
  return true;
}

int buildBowl() {
  int width = 1;
  int height = 1;
  bool flag = false;

  while (1) {
    if (canBuild(width, height) == false) {
      break;
    }

    int tmpWidth = width;

    for (int i = 0; i < width; i++, tmpWidth--) {
      int idx = 0;
      for (int j = 0; j < height; j++, idx++) {
        d[tmpWidth].push_back(d[idx][i]);
      }
    }

    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        d[i].pop_front();
      }
    }

    if (flag == false) {
      height++;
      flag = true;
    } else {
      width++;
      flag = false;
    }
  }
  return height;
}
void adjustFish(int height) {
  deque<int> tmpbowl[MAX];
  for (int i = 0; i < height; i++) {
    tmpbowl[i] = d[i];
  }

  for (int i = height - 1; i >= 0; i--) {
    for (int j = 0; j < d[i].size(); j++) {
      int x = i;
      int y = j;
      int num = d[x][y];
      for (int k = 0; k < 2; k++) {
        int nx = x + dx[k];
        int ny = y + dy[k];
        if (nx >= 0 && ny < d[i].size()) {
          int num2 = d[nx][ny];
          int diff = abs(num - num2) / 5;
          if (diff > 0) {
            if (num > num2) {
              tmpbowl[x][y] -= diff;
              tmpbowl[nx][ny] += diff;
            } else {
              tmpbowl[nx][ny] -= diff;
              tmpbowl[x][y] += diff;
            }
          }
        }
      }
    }
  }

  for (int i = 0; i < height; i++) {
    d[i] = tmpbowl[i];
  }
}

void spreadBowl(int height) {
  int width = d[height - 1].size();
  int size = d[0].size();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      d[0].push_back(d[j][i]);
    }
  }
  for (int i = 1; i < height; i++) {
    d[i].clear();
  }
  for (int i = width; i < size; i++) {
    d[0].push_back(d[0][i]);
  }
  for (int i = 0; i < size; i++) {
    d[0].pop_front();
  }
}

void buildBowl2() {
  int n = d[0].size();
  for (int i = 0; i < n / 2; i++) {
    d[1].push_front(d[0][i]);
  }
  for (int i = 0; i < n / 2; i++) {
    d[0].pop_front();
  }
  for (int i = 0; i < n / 4; i++) {
    d[2].push_front(d[1][i]);
    d[3].push_front(d[0][i]);
  }
  for (int i = 0; i < n / 4; i++) {
    d[0].pop_front();
    d[1].pop_front();
  }
}

int main() {
  int N, K;
  cin >> N >> K;
  int minV = 1e9;
  int maxV = -1;

  for (int i = 0; i < N; i++) {
    int n;
    cin >> n;

    d[0].push_back(n);
  }

  int result = 0;
  while (true) {
    if (check(minV, maxV, K)) {
      break;
    }
    for (auto &m : d[0]) {
      if (minV == m) m++;
    }
    int height = buildBowl();
    adjustFish(height);
    spreadBowl(height);
    buildBowl2();
    adjustFish(4);
    spreadBowl(4);
    result++;
  }

  cout << result;
  return 0;
}