/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 11049                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/11049                          #+#        #+#      #+#    */
/*   Solved: 2024/11/04 16:21:21 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <limits.h>

#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
int main() {
  FASTIO;

  int N;
  cin >> N;
  vector<pair<int, int>> n(N);
  vector<vector<int>> dp(N, vector<int>(N, INT_MAX));
  for (int i = 0; i < N; ++i) {
    int r, c;
    cin >> r >> c;
    n[i] = {r, c};
  }

  for (int i = 0; i < N; ++i) {
    dp[i][i] = 0;
  }

  for (int len = 1; len < N; ++len) {
    for (int i = 0; i + len < N; ++i) {
      int j = i + len;
      for (int k = i; k < j; ++k) {
        int cost =
            dp[i][k] + dp[k + 1][j] + n[i].first * n[k].second * n[j].second;
        dp[i][j] = min(dp[i][j], cost);
      }
    }
  }
  cout << dp[0][N - 1] << "\n";
  return 0;
}