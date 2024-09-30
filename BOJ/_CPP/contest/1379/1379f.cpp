#include <bits/stdc++.h>

using namespace std;

int main() {
  int N;
  cin >> N;

  vector<int> p(N);

  int large = N / 2 + 1;
  int small = N / 2;

  for (int i = 0; i < N; i += 2) {
    p[i] = large++;
  }

  for (int i = 1; i < N; i += 2) {
    p[i] = small--;
  }

  for (int i = 0; i < N; i++) {
    cout << p[i] << " ";
  }

  return 0;
}

// 4 + 1 = 5 * 3 = 15 + 2 = 17
// 3 + 1 = 4 * 4 = 16 + 2 = 18

// 3 2 4 1
// 3 + 2 = 5 * 4 = 20 + 1

// 3 2 4 1 5
// 5 * 4 + 1 = 21 * 5 = 105