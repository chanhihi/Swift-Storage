/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 10025                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/10025                          #+#        #+#      #+#    */
/*   Solved: 2024/10/02 21:46:04 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);

  int n, k;
  cin >> n >> k;

  vector<ll> area(1000001, 0);

  for (int i = 0; i < n; i++) {
    int g, x;
    cin >> g >> x;
    area[x] = g;
  }

  ll current_sum = 0;
  int window_size = 2 * k + 1;

  for (int i = 0; i < window_size && i <= 1000000; i++) {
    current_sum += area[i];
  }

  ll max_sum = current_sum;

  for (int i = 1; i + window_size - 1 <= 1000000; i++) {
    current_sum = current_sum - area[i - 1] + area[i + window_size - 1];
    max_sum = max(max_sum, current_sum);
  }

  cout << max_sum;

  return 0;
}
