/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15817                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15817                          #+#        #+#      #+#    */
/*   Solved: 2024/11/19 15:55:46 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int countCombinations(vector<int>& items, vector<int>& counts, int target) {
  int n = items.size();
  vector<int> dp(target + 1, 0);
  dp[0] = 1;

  for (int i = 0; i < n; i++) {
    for (int j = target; j >= 0; j--) {
      for (int k = 1; k <= counts[i] && k * items[i] <= j; k++) {
        dp[j] += dp[j - k * items[i]];
      }
    }
  }

  return dp[target];
}

int main() {
  int n, x, l, c;
  cin >> n >> x;
  vector<int> pipes, counts;

  for (int i = 0; i < n; i++) {
    cin >> l >> c;
    pipes.push_back(l);
    counts.push_back(c);
  }
  cout << countCombinations(pipes, counts, x);
  return 0;
}