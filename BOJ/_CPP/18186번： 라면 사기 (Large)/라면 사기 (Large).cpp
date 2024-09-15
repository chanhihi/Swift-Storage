#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, B, C;
  cin >> n >> B >> C;

  vector<int> A(n);
  for (int i = 0; i < n; i++) {
    cin >> A[i];
  }

  long long total_cost = 0;

  for (int i = 0; i < n; i++) {
    if (i < n - 2 && A[i + 1] > A[i + 2] && B + C < 2 * B) {
      int buy_count = min(A[i], A[i + 1] - A[i + 2]);
      total_cost += (long long)buy_count * (B + C);
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
    }

    if (i < n - 2 && B + 2 * C < 3 * B) {
      int buy_count = min({A[i], A[i + 1], A[i + 2]});
      total_cost += (long long)buy_count * (B + 2 * C);
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
      A[i + 2] -= buy_count;
    }

    if (i < n - 1 && B + C < 2 * B) {
      int buy_count = min(A[i], A[i + 1]);
      total_cost += (long long)buy_count * (B + C);
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
    }

    total_cost += (long long)A[i] * B;
  }

  cout << total_cost << endl;

  return 0;
}