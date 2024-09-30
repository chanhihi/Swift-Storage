/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2003                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2003                           #+#        #+#      #+#    */
/*   Solved: 2024/10/02 21:00:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);

  int n, m, count = 0;
  cin >> n >> m;

  vector<ll> a(n + 1);
  vector<ll> s(n + 1);
  for (int i = 1; i <= n; i++) {
    cin >> a[i];
    s[i] = s[i - 1] + a[i];
  }
  int left = 1;
  int right = 1;

  while (left != n) {
    if (s[right] - s[left - 1] == m) {
      count++;
      left++;
      right = left;
    } else if (s[right] - s[left - 1] > m) {
      left++;
      right = left;
    } else if (right >= n) {
      left++;
      right = left;
    } else {
      right++;
    }
  }

  cout << count;
}