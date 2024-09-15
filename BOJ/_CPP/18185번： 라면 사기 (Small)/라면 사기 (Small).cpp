#include <bits/stdc++.h>

using namespace std;

int main() {
  int n;
  cin >> n;

  vector<int> A(n);
  for (int i = 0; i < n; i++) {
    cin >> A[i];
  }

  long long total_cost = 0;

  for (int i = 0; i < n; i++) {
    if (i < n - 2 && A[i + 1] > A[i + 2]) {
      int buy_count = min(A[i], A[i + 1] - A[i + 2]);
      total_cost += buy_count * 5;
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
    }

    if (i < n - 2) {
      int buy_count = min({A[i], A[i + 1], A[i + 2]});
      total_cost += buy_count * 7;
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
      A[i + 2] -= buy_count;
    }

    if (i < n - 1) {
      int buy_count = min(A[i], A[i + 1]);
      total_cost += buy_count * 5;
      A[i] -= buy_count;
      A[i + 1] -= buy_count;
    }

    total_cost += A[i] * 3;
  }

  cout << total_cost;

  return 0;
}
