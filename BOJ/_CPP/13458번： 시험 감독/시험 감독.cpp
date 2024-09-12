#include <bits/stdc++.h>

using namespace std;
int main() {
  vector<int> a;
  int n, b, c;
  long long result = 0;
  cin >> n;

  for (int i = 0; i < n; i++) {
    int ai;
    cin >> ai;
    a.push_back(ai);
  }
  cin >> b >> c;

  for (auto &ai : a) {
    result += 1;
    if (ai > b) {
      result += (ai - b + c - 1) / c;
    }
  }

  cout << result;

  return 0;
}