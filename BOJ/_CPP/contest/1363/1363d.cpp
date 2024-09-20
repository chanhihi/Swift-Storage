#include <bits/stdc++.h>

using namespace std;

int main() {
  int N, M;
  cin >> N >> M;

  int min_x = 1, max_x = N, min_y = 1, max_y = N;

  for (int i = 0; i < M; i++) {
    int X, Y, K;
    cin >> X >> Y >> K;

    if (K == 1) {
      max_x = min(max_x, X - 1);
      min_y = max(min_y, Y);
      max_y = min(max_y, Y);
    } else if (K == 2) {
      max_x = min(max_x, X - 1);
      min_y = max(min_y, Y + 1);
    } else if (K == 3) {
      min_x = max(min_x, X);
      min_y = max(min_y, Y + 1);
    } else if (K == 4) {
      min_x = max(min_x, X + 1);
      min_y = max(min_y, Y + 1);
    } else if (K == 5) {
      min_x = max(min_x, X + 1);
      min_y = max(min_y, Y);
      max_y = min(max_y, Y);
    } else if (K == 6) {
      min_x = max(min_x, X + 1);
      max_y = min(max_y, Y - 1);
    } else if (K == 7) {
      min_x = max(min_x, X);
      max_y = min(max_y, Y - 1);
    } else if (K == 8) {
      max_x = min(max_x, X - 1);
      max_y = min(max_y, Y - 1);
    }
  }

  cout << min_x << " " << min_y << endl;

  return 0;
}
