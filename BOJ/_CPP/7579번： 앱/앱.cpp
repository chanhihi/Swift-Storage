/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 7579                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/7579                           #+#        #+#      #+#    */
/*   Solved: 2024/11/07 14:02:47 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
using ll = long long;

int main() {
  FASTIO;

  int n, m;
  cin >> n >> m;
  vector<int> memory(n);
  vector<int> cost(n);

  for (ll i = 0; i < n; ++i) cin >> memory[i];
  for (ll i = 0; i < n; ++i) cin >> cost[i];

  int maxCost = 100 * n;

  vector<int> dp(maxCost + 1, 0);

  for (ll i = 0; i < n; ++i) {
    int mem = memory[i];
    int c = cost[i];

    for (int j = maxCost; j >= c; j--) {
      dp[j] = max(dp[j], dp[j - c] + mem);
    }
  }

  int answer = maxCost;
  for (int i = 0; i <= maxCost; i++) {
    if (dp[i] >= m) {
      answer = i;
      break;
    }
  }

  cout << answer;

  return 0;
}