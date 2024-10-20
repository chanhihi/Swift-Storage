#include <iostream>
#include <vector>

struct Info {
  int m, d, s;
};

int dy[] = {-1, -1, 0, 1, 1, 1, 0, -1};
int dx[] = {0, 1, 1, 1, 0, -1, -1, -1};

using namespace std;

int N, M, K;

int main() {
  cin >> N >> M >> K;

  vector<vector<vector<Info>>> b(N, vector<vector<Info>>(N, vector<Info>()));
  vector<vector<vector<Info>>> nb(N, vector<vector<Info>>(N, vector<Info>()));

  for (int i = 0; i < M; i++) {
    int r, c, m, s, d;
    cin >> r >> c >> m >> s >> d;
    b[r - 1][c - 1].push_back({m, d, s});
  }

  for (int i = 0; i < K; i++) {
    nb.assign(N, vector<vector<Info>>(N, vector<Info>()));
    for (int y = 0; y < N; y++) {
      for (int x = 0; x < N; x++) {
        int element_count = b[y][x].size();
        for (int el = 0; el < element_count; el++) {
          if (b[y][x][el].m == 0) continue;
          Info t = b[y][x][el];
          int ny = (N + y + (dy[t.d] * (t.s % N))) % N;
          int nx = (N + x + (dx[t.d] * (t.s % N))) % N;

          nb[ny][nx].push_back({t.m, t.d, t.s});
          b[y][x][el].m = 0;
        }
      }
    }

    b.assign(N, vector<vector<Info>>(N, vector<Info>()));
    for (int y = 0; y < N; y++) {
      for (int x = 0; x < N; x++) {
        int element_count = nb[y][x].size();

        if (element_count >= 2) {
          int sumM = 0, sumS = 0;
          bool odd = false, even = false;
          for (int el = 0; el < element_count; el++) {
            sumM += nb[y][x][el].m;
            sumS += nb[y][x][el].s;
            if (nb[y][x][el].d % 2 == 0) {
              even = true;
            } else {
              odd = true;
            }
          }
          int newM = sumM / 5;
          int newS = sumS / element_count;

          if (newM > 0) {
            int startDir = (odd && even) ? 1 : 0;
            for (int el = 0; el < 4; el++) {
              b[y][x].push_back({newM, startDir + el * 2, newS});
            }
          }
        }

        else if (element_count == 1) {
          b[y][x].push_back(nb[y][x][0]);
        }
      }
    }
  }

  int result = 0;
  for (int y = 0; y < N; y++) {
    for (int x = 0; x < N; x++) {
      // cout << "y" << y << "x" << x << "{";
      int element_count = b[y][x].size();
      for (int el = 0; el < element_count; el++) {
        result += b[y][x][el].m;
        // cout << b[y][x][el].m;
      }
      // cout << "}" << " ";
    }
    // cout << "\n";
  }

  cout << result;

  return 0;
}