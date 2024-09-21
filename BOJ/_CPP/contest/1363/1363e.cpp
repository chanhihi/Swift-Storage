#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, k;
  cin >> n >> k;

  vector<int> s(n);
  for (int i = 0; i < n; i++) {
    cin >> s[i];
  }

  vector<int> sorted_s = s;
  sort(sorted_s.begin(), sorted_s.end());

  for (int i = 0; i < k; i++) {
    vector<int> original_group, sorted_group;

    for (int j = i; j < n; j += k) {
      original_group.push_back(s[j]);
      sorted_group.push_back(sorted_s[j]);
    }

    sort(original_group.begin(), original_group.end());
    if (original_group != sorted_group) {
      cout << "No";
      return 0;
    }
  }

  cout << "Yes";
  return 0;
}
