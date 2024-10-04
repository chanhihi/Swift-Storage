/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2467                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2467                           #+#        #+#      #+#    */
/*   Solved: 2024/10/04 20:17:52 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
#define fastio ios::sync_with_stdio(0), cin.tie(0)
#define INF 2100100100

vector<int> v;
int n;
int LH[] = {-INF, INF};
int minimum = INF;

void bisearch(int selected) {
  int lo = selected + 1;
  int hi = n - 1;

  while (lo <= hi) {
    int mid = (lo + hi) / 2;
    int sum = v[selected] + v[mid];
    int asum = abs(sum);

    if (asum <= minimum) {
      minimum = asum;
      LH[0] = v[selected];
      LH[1] = v[mid];
    }

    if (sum < 0) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
}

int main() {
  cin >> n;

  for (int i = 0; i < n; i++) {
    int x;
    cin >> x;
    v.push_back(x);
  }

  sort(v.begin(), v.end());

  for (int i = 0; i < n; i++) {
    bisearch(i);
  }

  cout << LH[0] << " " << LH[1];
}