/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 11051                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/11051                          #+#        #+#      #+#    */
/*   Solved: 2025/01/16 11:41:19 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>

#define MOD 10007

using namespace std;

int binomial_coefficient(int n, int k) {
  int dp[n + 1][k + 1];

  for (int i = 0; i <= n; i++) {
    for (int j = 0; j <= min(i, k); j++) {
      if (j == 0 || j == i)
        dp[i][j] = 1;
      else
        dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j]) % MOD;
    }
  }
  return dp[n][k];
}

int n, k;
int main() {
  cin >> n >> k;

  cout << binomial_coefficient(n, k);
  return 0;
}
