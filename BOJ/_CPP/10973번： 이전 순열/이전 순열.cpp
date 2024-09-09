#include <bits/stdc++.h>

using namespace std;

int N;

int main(void) {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);

  cin >> N;

  vector<int> v(N);
  for (int i = 0; i < N; i++) {
    cin >> v[i];
  }

  bool flag = next_permutation(v.begin(), v.end());

  if (!flag) {
    cout << -1;
    return 0;
  }

  for (int i = 0; i < N; i++) {
    cout << v[i] << ' ';
  }
  return 0;
}
