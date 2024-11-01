/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 10942                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/10942                          #+#        #+#      #+#    */
/*   Solved: 2024/11/01 09:06:57 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int N;
vector<int> n;

int checkPalindrome(int s, int e) {
  while (s <= e) {
    if (n[s++] != n[e--]) return 0;
  }
  return 1;
}

int main() {
  FASTIO;

  cin >> N;
  n.resize(N + 1, 0);
  for (int i = 0; i < N; i++) {
    cin >> n[i];
  }

  vector<vector<int>> dp(N, vector<int>(N, 0));

  for (int i = 0; i < N; i++) {
    dp[i][i] = 1;
  }

  for (int i = 0; i < N - 1; i++) {
    if (n[i] == n[i + 1]) {
      dp[i][i + 1] = 1;
    }
  }

  for (int length = 2; length < N; length++) {
    for (int i = 0; i + length < N; i++) {
      int j = i + length;
      if (n[i] == n[j] && dp[i + 1][j - 1] == 1) {
        dp[i][j] = 1;
      }
    }
  }

  int M;
  cin >> M;
  for (int i = 0; i < M; i++) {
    int a, b;
    cin >> a >> b;
    cout << dp[a - 1][b - 1] << "\n";
  }

  return 0;
}