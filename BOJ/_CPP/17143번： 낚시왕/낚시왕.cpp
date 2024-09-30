#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

struct Shark {
  int r, c, s, d, z;
};

bool compareByRC(const Shark &a, const Shark &b) {
  if (a.r == b.r) {
    return a.c < b.c;
  }
  return a.r < b.r;
}

int dy[] = {0, -1, 1, 0, 0};
int dx[] = {0, 0, 0, 1, -1};

int main() {
  int br, bc, m;
  cin >> br >> bc >> m;
  vector<Shark> sharks;
  for (int i = 0; i < m; i++) {
    int r, c, s, d, z;
    cin >> r >> c >> s >> d >> z;
    sharks.push_back({r, c, s, d, z});
  }

  int result = 0;
  for (int fisher = 1; fisher <= bc; fisher++) {
    sort(sharks.begin(), sharks.end(), compareByRC);
    for (auto &s : sharks) {
      if (s.r == 0 && s.c == 0) continue;
      bool catched = false;
      if (fisher == s.c) {
        for (int j = 1; j <= br; j++) {
          if (j == s.r) {
            result += s.z;
            s.r = 0;
            s.c = 0;
            catched = true;
            break;
          }
        }
        if (catched) break;
      }
    }

    vector<vector<Shark>> sharkBoard(br + 1,
                                     vector<Shark>(bc + 1, {0, 0, 0, 0, 0}));
    for (auto &s : sharks) {
      if (s.r == 0 && s.c == 0) continue;

      int speed = s.s;
      if (s.d == 1 || s.d == 2) {
        speed %= (2 * (br - 1));
      } else {
        speed %= (2 * (bc - 1));
      }

      while (speed--) {
        s.r = s.r + dy[s.d];
        s.c = s.c + dx[s.d];

        if (s.d == 1 && s.r == 0) {
          s.d = 2;
          s.r = 2;
        } else if (s.d == 2 && s.r == br + 1) {
          s.d = 1;
          s.r = br - 1;
        } else if (s.d == 3 && s.c == bc + 1) {
          s.d = 4;
          s.c = bc - 1;
        } else if (s.d == 4 && s.c == 0) {
          s.d = 3;
          s.c = 2;
        }
      }

      if (sharkBoard[s.r][s.c].z > s.z) {
        s.r = 0;
        s.c = 0;
      } else {
        sharkBoard[s.r][s.c] = s;
      }
    }
    sharks.clear();
    for (int i = 1; i <= br; i++) {
      for (int j = 1; j <= bc; j++) {
        if (sharkBoard[i][j].z > 0) {
          sharks.push_back(sharkBoard[i][j]);
        }
      }
    }
  }
  cout << result;
  return 0;
}