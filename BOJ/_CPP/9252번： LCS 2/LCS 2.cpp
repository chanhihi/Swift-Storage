/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 9252                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/9252                           #+#        #+#      #+#    */
/*   Solved: 2024/10/30 15:18:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

int main() {
  string a, b;
  cin >> a >> b;

  int as = a.size(), bs = b.size();
  vector<vector<int>> dp(as + 1, vector<int>(bs + 1, 0));
  vector<char> sequence;
  vector<char> str;

  for (int i = 1; i <= as; i++) {
    for (int j = 1; j <= bs; j++) {
      if (a[i - 1] == b[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
      } else {
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }

  cout << dp[as][bs] << "\n";

  if (dp[as][bs] == 0) return 0;

  string lcs;
  while (as > 0 && bs > 0) {
    if (a[as - 1] == b[bs - 1]) {
      lcs.push_back(a[as - 1]);
      as--;
      bs--;
    } else if (dp[as - 1][bs] > dp[as][bs - 1]) {
      as--;
    } else {
      bs--;
    }
  }

  reverse(lcs.begin(), lcs.end());
  cout << lcs << "\n";

  return 0;
}