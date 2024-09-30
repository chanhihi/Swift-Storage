/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 11441                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/11441                          #+#        #+#      #+#    */
/*   Solved: 2024/10/03 06:46:47 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int n, m;

  cin >> n;

  vector<ll> a(n + 2, 0);
  vector<ll> s(n + 2, 0);

  for (int i = 1; i <= n; i++) {
    cin >> a[i];
    s[i] = s[i - 1] + a[i];
  }

  cin >> m;

  while (m--) {
    int i, j;
    cin >> i >> j;

    cout << s[j] - s[i - 1] << "\n";
  }

  return 0;
}