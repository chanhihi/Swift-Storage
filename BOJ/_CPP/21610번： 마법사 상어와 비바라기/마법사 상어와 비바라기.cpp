/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 21610                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/21610                          #+#        #+#      #+#    */
/*   Solved: 2024/10/10 21:24:51 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

struct Info {
  int water;
  bool cloud;
  bool willCloud;
};

// ←, ↖, ↑, ↗, →, ↘, ↓, ↙
int dy[] = {0, -1, -1, -1, 0, 1, 1, 1};
int dx[] = {-1, -1, 0, 1, 1, 1, 0, -1};

int main() {
  int N, M;
  cin >> N >> M;
  vector<vector<Info>> a(N, vector<Info>(N, {0, false, false}));
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      int water;
      cin >> water;
      a[i][j].water = water;
    }
  }

  a[N - 1][0].cloud = true;
  a[N - 1][1].cloud = true;
  a[N - 2][0].cloud = true;
  a[N - 2][1].cloud = true;

  for (int i = 0; i < M; i++) {
    int d, s;
    cin >> d >> s;
    d--;

    for (int y = 0; y < N; y++) {
      for (int x = 0; x < N; x++) {
        if (a[y][x].cloud) {
          int calY = dy[d] * (s % N);
          int calX = dx[d] * (s % N);
          int ny = (N + y + calY) % N;
          int nx = (N + x + calX) % N;

          a[y][x].cloud = false;
          a[ny][nx].water++;
          a[ny][nx].willCloud = true;
        }
      }
    }

    for (int y = 0; y < N; y++) {
      for (int x = 0; x < N; x++) {
        if (a[y][x].willCloud) {
          int copybug = 0;

          for (int i = 1; i < 8; i += 2) {
            int by = y + dy[i];
            int bx = x + dx[i];

            if (bx < 0 || by < 0 || bx >= N || by >= N || !a[by][bx].water)
              continue;
            copybug++;
          }
          a[y][x].water += copybug;
        }
      }
    }

    for (int y = 0; y < N; y++) {
      for (int x = 0; x < N; x++) {
        if (a[y][x].water >= 2 && !a[y][x].willCloud) {
          a[y][x].cloud = true;
          a[y][x].water -= 2;
        }
        a[y][x].willCloud = false;
      }
    }
  }

  int result = 0;
  for (int y = 0; y < N; y++) {
    for (int x = 0; x < N; x++) {
      result += a[y][x].water;
    }
  }
  cout << result;
}