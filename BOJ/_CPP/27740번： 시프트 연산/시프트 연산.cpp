/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 27740                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/27740                          #+#        #+#      #+#    */
/*   Solved: 2024/10/15 13:14:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <deque>
#include <iostream>

#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int N;
deque<int> d;
string result;

int zero[300001];
int memo[3];
int ans = 300001;

void re(int l, int r) {
  int cnt = l + r;
  if (cnt < ans) {
    memo[0] = l < r ? 0 : 1;
    memo[1] = l;
    memo[2] = r;
    ans = cnt;
  }
}

void solve() {
  int l = N, r = N;
  int cnt = 0;
  for (int i = 0; i < N; i++) {
    if (d[i]) {
      l = i;
      break;
    }
  }

  for (int i = N - 1; i >= 0; i--) {
    if (d[i]) {
      r = N - i - 1;
      break;
    }
  }

  if (l == r)
    re(N - l, 0);
  else
    (l < r ? re(N - r, 0) : re(0, N - 1));

  for (int i = 0; i < N; i++) {
    int z = zero[i];
    if (z) {
      l = i;
      r = N - i - z;
      if (l < z) re(l, l + r);
      if (r < z) re(l + r, r);
    }
  }

  string s = "";
  if (memo[0] == 0) {
    for (int i = 0; i < memo[1]; i++) s += 'L';
    for (int i = 0; i < memo[2]; i++) s += 'R';
  }

  else {
    for (int i = 0; i < memo[2]; i++) s += 'R';
    for (int i = 0; i < memo[1]; i++) s += 'L';
  }

  cout << ans << '\n' << s;
}

int main() {
  fastio;

  cin >> N;
  int cnt = 0;
  int idx = 0;
  for (int i = 0; i < N; i++) {
    int t;
    cin >> t;
    d.push_back(t);
    if (cnt) {
      if (!t)
        cnt++;
      else {
        zero[idx] = cnt;
        cnt = 0;
      }
    } else {
      if (!t) {
        idx = i;
        cnt++;
      }
    }
  }

  solve();

  return 0;
}