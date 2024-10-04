/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2110                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2110                           #+#        #+#      #+#    */
/*   Solved: 2024/10/04 18:58:43 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
#define fastio ios::sync_with_stdio(0), cin.tie(0)

int checkInstall(int d, vector<int> &v) {
  int count = 1;
  int last_location = v[0];

  for (int i = 1; i < v.size(); i++) {
    int locate = v[i];

    if (locate - last_location >= d) {
      count++;
      last_location = locate;
    }
  }
  return count;
}

int main() {
  fastio;
  int n, c;
  cin >> n >> c;

  int d = 1;
  vector<int> v;

  for (int i = 0; i < n; i++) {
    int x;
    cin >> x;
    v.push_back(x);
  }

  sort(v.begin(), v.end());

  int lo = 1, hi = v[v.size() - 1] - v[0] + 1;
  while (lo < hi) {
    int mid = (hi + lo) / 2;
    if (checkInstall(mid, v) < c) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }

  cout << lo - 1;
}