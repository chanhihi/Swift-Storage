#include <bits/stdc++.h>

using namespace std;

int dx[] = {0, 1, 0, -1};
int dy[] = {1, 0, -1, 0};

int main() {
  int n;
  cin >> n;

  int x = 0, y = 0;
  int cx = 0, cy = -1;
  int d = 0;

  for (int i = 0; i < n; i++) {
    string s;
    cin >> s;

    switch (s[0]) {
      case 'M':
        if (s[1] == 'R') {
          d = (d + 1) % 4;
        } else if (s[1] == 'L') {
          d = (d + 3) % 4;
        }
        break;
      case 'W':
        x += dx[d];
        y += dy[d];
        break;
      case 'S':
        x -= dx[d];
        y -= dy[d];
        break;
      case 'D':
        x += dx[(d + 1) % 4];
        y += dy[(d + 1) % 4];
        break;
      case 'A':
        x += dx[(d + 3) % 4];
        y += dy[(d + 3) % 4];
        break;
    }

    cx = x - dx[d];
    cy = y - dy[d];

    cout << x << " " << y << " " << cx << " " << cy << "\n";
  }

  return 0;
}
