/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 16235                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/16235                          #+#        #+#      #+#    */
/*   Solved: 2024/10/08 15:33:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <algorithm>
#include <deque>
#include <iostream>
#include <vector>

using namespace std;

struct Tree {
  int r, c, age;
  bool die;
};

vector<vector<deque<int>>> trees;
vector<vector<int>> land;
vector<vector<int>> a;

int n, m, k;
int dx[] = {1, 1, 1, 0, 0, -1, -1, -1};
int dy[] = {1, 0, -1, 1, -1, 1, 0, -1};

bool compareAge(Tree a, Tree b) { return a.age < b.age; }

void springAndSummer() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      deque<int> newTrees;
      int deadNutrients = 0;
      for (int age : trees[i][j]) {
        if (land[i][j] >= age) {
          land[i][j] -= age;
          newTrees.push_back(age + 1);
        } else {
          deadNutrients += age / 2;
        }
      }
      land[i][j] += deadNutrients;
      trees[i][j] = newTrees;
    }
  }
}

void autumn() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      for (int age : trees[i][j]) {
        if (age % 5 == 0) {
          for (int dir = 0; dir < 8; dir++) {
            int ny = i + dy[dir];
            int nx = j + dx[dir];
            if (nx < 0 || ny < 0 || nx >= n || ny >= n) continue;
            trees[ny][nx].push_front(1);
          }
        }
      }
    }
  }
}

void winter() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      land[i][j] += a[i][j];
    }
  }
}

int main() {
  cin >> n >> m >> k;
  land.assign(n, vector<int>(n, 5));
  a.assign(n, vector<int>(n));
  trees.assign(n, vector<deque<int>>(n));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> a[i][j];
    }
  }

  for (int i = 0; i < m; i++) {
    int tr, tc, tage;
    cin >> tr >> tc >> tage;
    trees[tr - 1][tc - 1].push_back(tage);
  }

  while (k--) {
    springAndSummer();
    autumn();
    winter();
  }

  int result = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      result += trees[i][j].size();  // 살아남은 나무의 수 계산
    }
  }

  cout << result;

  return 0;
}