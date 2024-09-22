#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, k;
  cin >> n >> k;

  vector<int> s(n);
  for (int i = 0; i < n; i++) {
    cin >> s[i];
  }

  sort(s.begin(), s.end());

  int max_fireworks = 0;
  int l = 0, r = n - 1;

  while (r >= 0 && s[r] >= k) {
    max_fireworks++;
    r--;
  }

  while (l < r) {
    if (s[l] + s[r] >= k) {
      max_fireworks++;
      l++;
      r--;
    } else {
      l++;
    }
  }

  if (max_fireworks == 0) {
    cout << -1 << endl;
  } else {
    cout << max_fireworks << endl;
  }

  return 0;
}
