/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 30460                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/30460                          #+#        #+#      #+#    */
/*   Solved: 2024/10/23 14:03:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n;
  cin >> n;
  vector<int> A(n + 3, 0);
  vector<int> dp(n + 3, 0);

  for (int i = 1; i <= n + 2; i++) {
    cin >> A[i];
    dp[i] = -1e9;
    if (i >= 3)
      dp[i] = max(dp[i], dp[i - 3] + 2 * (A[i] + A[i - 1] + A[i - 2]));
    dp[i] = max(dp[i], dp[i - 1] + A[i]);
  }

  cout << dp[n + 2] << endl;

  return 0;
}
