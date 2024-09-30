#include <bits/stdc++.h>

using namespace std;

int main() {
  int n;
  string s;

  cin >> n >> s;

  int count = 0;

  for (int i = 0; i < n; ++i) {
    for (int j = i + 2; j < n; ++j) {
      string sub = s.substr(i, j - i + 1);

      if (sub.front() == 'A' && sub.back() == 'A') {
        int n_count = 0;
        bool valid = true;
        for (int k = 1; k < sub.length() - 1; ++k) {
          if (sub[k] == 'N') {
            n_count++;
          } else if (sub[k] == 'A') {
            valid = false;
            break;
          }
        }
        if (valid && n_count == 1) {
          count++;
        }
      }
    }
  }

  cout << count << endl;

  return 0;
}
