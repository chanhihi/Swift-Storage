/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 27931                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/27931                          #+#        #+#      #+#    */
/*   Solved: 2024/10/06 19:37:25 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
#define INF 2000000001

int main() {
  int n;
  cin >> n;
  vector<int> a(n);

  for (int i = 0; i < n; i++) {
    cin >> a[i];
  }

  sort(a.begin(), a.end());

  int even = INF, odd = INF;
  int l_o = -1, l_e = -1;

  for (int i = 0; i < n; ++i) {
    if (a[i] % 2 == 0) {
      if (l_o != -1) {
        odd = min(odd, a[i] - a[l_o]);
      }
      if (l_e != -1) {
        even = min(even, a[i] - a[l_e]);
      }
      l_e = i;
    } else {
      if (l_e != -1) {
        odd = min(odd, a[i] - a[l_e]);
      }
      if (l_o != -1) {
        even = min(even, a[i] - a[l_o]);
      }
      l_o = i;
    }
  }

  if (even == INF) even = -1;
  if (odd == INF) odd = -1;
  cout << even << " " << odd;

  return 0;
}
