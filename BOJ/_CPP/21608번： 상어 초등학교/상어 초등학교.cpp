/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 21608                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/21608                          #+#        #+#      #+#    */
/*   Solved: 2024/10/12 18:41:30 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <map>
#include <vector>

using namespace std;

int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};

struct SittingInfo {
  int r, c, emptyCount, favCount;

  bool operator<(const SittingInfo &o) const {
    if (this->favCount == o.favCount) {
      if (this->emptyCount == o.emptyCount) {
        if (this->r == o.r) {
          return this->c < o.c;
        }
        return this->r < o.r;
      }
      return this->emptyCount > o.emptyCount;
    }
    return this->favCount > o.favCount;
  }
};

int main() {
  int n;
  cin >> n;
  int N = n * n;

  vector<vector<int>> room(n, vector<int>(n, 0));
  vector<pair<int, vector<int>>> student;
  map<int, vector<int>> fav;

  for (int i = 0; i < n * n; i++) {
    int s, f1, f2, f3, f4;
    cin >> s >> f1 >> f2 >> f3 >> f4;

    student.push_back({s, {f1, f2, f3, f4}});
    fav[s] = {f1, f2, f3, f4};
  }

  for (auto entry : student) {
    int selected = entry.first;
    vector<SittingInfo> candidate;
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        if (room[r][c] == 0) {
          int fC = 0;
          int eC = 0;
          for (int k = 0; k < 4; k++) {
            int nr = r + dy[k];
            int nc = c + dx[k];
            if (nc >= 0 && nr >= 0 && nc < n && nr < n) {
              if (room[nr][nc] != 0) {
                if (find(fav[selected].begin(), fav[selected].end(),
                         room[nr][nc]) != fav[selected].end())
                  fC++;
              } else {
                eC++;
              }
            }
          }
          candidate.push_back({r, c, eC, fC});
        }
      }
    }
    sort(candidate.begin(), candidate.end());
    room[candidate[0].r][candidate[0].c] = selected;
  }

  int result = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      int count = 0;
      for (int k = 0; k < 4; k++) {
        int nx = j + dx[k];
        int ny = i + dy[k];

        if (nx < 0 || ny < 0 || nx >= n || ny >= n) continue;
        if (find(fav[room[i][j]].begin(), fav[room[i][j]].end(),
                 room[ny][nx]) != fav[room[i][j]].end())
          count++;
      }
      if (count == 1)
        result += 1;
      else if (count == 2)
        result += 10;
      else if (count == 3)
        result += 100;
      else if (count == 4)
        result += 1000;
    }
  }
  cout << result;
  return 0;
}