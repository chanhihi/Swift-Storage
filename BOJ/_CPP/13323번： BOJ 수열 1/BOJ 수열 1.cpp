#include <bits/stdc++.h>

using namespace std;

int main() {
  ios_base::sync_with_stdio(false);

  cin.tie(NULL);
  cout.tie(NULL);

  int n;
  cin >> n;
  priority_queue<int> pq;
  vector<int> b(n);

  for (int i = 0; i < n; i++) {
    int a;
    cin >> a;
    int ai = a - i;
    pq.push(ai);

    b[i] = pq.top() + i;
    if (!pq.empty() && pq.top() > ai) {
      pq.pop();
      pq.push(ai);
    }
  }

  for (int i = n - 2; i >= 0; i--) b[i] = min(b[i], b[i + 1] - 1);
  for (int i : b) cout << i << "\n";
  return 0;
}