/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 26072                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/26072                          #+#        #+#      #+#    */
/*   Solved: 2024/10/23 22:41:16 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iomanip>
#include <iostream>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

int n;
double l;

int main() {
  fastio;
  cin >> n >> l;
  vector<int> w(n);
  vector<int> x(n);
  for (int i = 0; i < n; i++) cin >> x[i];
  for (int i = 0; i < n; i++) cin >> w[i];

  double s = 0.0, e = l, mid = 0.0;
  const double epsilon = 1e-7;

  while (e - s > epsilon) {
    mid = (s + e) / 2;
    double res = 0.0;

    for (int i = 0; i < n; i++) {
      res += (w[i] * (x[i] - mid));
    }

    if (res < 0)
      e = mid;
    else
      s = mid;
  }

  cout << fixed << setprecision(10) << (s + e) / 2;

  return 0;
}
