/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 20312                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/20312                          #+#        #+#      #+#    */
/*   Solved: 2024/10/23 21:28:33 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

#define MOD 1000000007

using namespace std;
using ll = long long;

int n;

int main() {
  cin >> n;
  vector<ll> d(n, 0);
  vector<ll> dp(n + 1, 0);

  for (int i = 0; i < n; i++) {
    cin >> d[i];
  }

  // for (auto p : d) cout << p << " ";

  reverse(d.begin(), d.end());

  ll result = 0;

  dp[0] = d[0];
  for (int i = 1; i < n; i++) {
    dp[i] = (dp[i - 1] * d[i] + d[i]) % MOD;
    result = (result + dp[i]) % MOD;
  }

  cout << result;

  return 0;
}