#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, t, result = 0;
  cin >> n >> t;

  vector<int> v(n);
  for (int i = 0; i < n; i++) {
    cin >> v[i];
  }

  vector<int> divisors;
  for (int i = 1; i <= t; i++) {
    if (t % i == 0) {
      divisors.push_back(i);
    }
  }

  for (int c : v) {
    int min_diff = INT_MAX;
    for (int d : divisors) {
      int diff = abs(c - d);
      if (diff < min_diff) {
        min_diff = diff;
      }
    }
    result += min_diff;
  }

  cout << result << endl;

  return 0;
}
