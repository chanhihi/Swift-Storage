/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 30625                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/30625                          #+#        #+#      #+#    */
/*   Solved: 2024/11/30 19:14:54 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#define FASTIO ios::sync_with_stdio(0), cin.tie(0)
#define MOD 1000000007

using namespace std;

int main() {
  FASTIO;
  int n, m;
  cin >> n >> m;

  long long prev_correct = 1;
  long long prev_incorrect = 0;

  for (int i = 0; i < n; i++) {
    int dance, direction;
    cin >> dance >> direction;

    long long correct = 0, incorrect = 0;
    if (direction == 0) {
      correct = prev_correct;
      incorrect = (prev_incorrect + prev_correct * (m - 1)) % MOD;
    } else {
      correct = (prev_correct * (m - 1)) % MOD;
      incorrect = (prev_incorrect * (m - 1) + prev_correct) % MOD;
    }

    prev_correct = correct;
    prev_incorrect = incorrect;
  }

  cout << (prev_correct + prev_incorrect) % MOD << '\n';
  return 0;
}
