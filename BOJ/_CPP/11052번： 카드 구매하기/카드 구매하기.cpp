/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 11052                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/11052                          #+#        #+#      #+#    */
/*   Solved: 2024/10/23 17:09:10 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;
int n;

int main() {
  cin >> n;
  vector<int> price(n + 1);
  vector<int> dp(n + 1, 0);

  for (int i = 1; i <= n; i++) {
    cin >> price[i];
  }

  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      dp[i] = max(dp[i], dp[i - j] + price[j]);
    }
  }

  cout << dp[n];
  return 0;
}
