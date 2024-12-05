/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2313                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2313                           #+#        #+#      #+#    */
/*   Solved: 2024/12/05 16:16:40 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>
#include <vector>

using namespace std;
using ll = long long;

int main() {
  int n;
  cin >> n;
  vector<vector<int>> v(n);
  for (int i = 0; i < n; i++) {
    int tmp;
    cin >> tmp;
    v[i] = vector<int>(tmp);
    for (int j = 0; j < tmp; j++) {
      cin >> v[i][j];
    }
  }

  ll sum = 0;
  vector<pair<int, int>> ans(n);
  for (int i = 0; i < n; i++) {
    int length = v[i].size();

    vector<pair<int, int>> dp(length);
    dp[0] = {1, v[i][0]};
    for (int j = 1; j < length; j++) {
      pair<int, int> before = dp[j - 1];
      if (before.second <= 0) {
        dp[j] = {1, v[i][j]};
      } else {
        dp[j] = {before.first + 1, before.second + v[i][j]};
      }
    }

    int index = 0;
    int cnt = dp[index].first;
    int max_value = dp[index].second;
    for (int j = 1; j < length; j++) {
      if (dp[j].second >= max_value) {
        if (dp[j].second == max_value && dp[j].first >= cnt) {
          continue;
        }
        index = j;
        max_value = dp[j].second;
        cnt = dp[j].first;
      }
    }
    sum += max_value;
    ans[i] = {index + 1 - cnt + 1, index + 1};
  }

  cout << sum << "\n";
  for (pair<int, int> i : ans) {
    cout << i.first << " " << i.second << "\n";
  }

  return 0;
}