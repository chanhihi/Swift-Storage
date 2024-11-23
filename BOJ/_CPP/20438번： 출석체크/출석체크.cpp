/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 20438                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/20438                          #+#        #+#      #+#    */
/*   Solved: 2024/11/23 20:11:36 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>

#define FASTIO ios::sync_with_stdio(false), cin.tie(0)

using namespace std;

int N, K, Q, M;
bool sleep[5003];
int pSum[5003];

int main() {
  FASTIO;

  cin >> N >> K >> Q >> M;

  for (int i = 0; i < K; i++) {
    int num;
    cin >> num;
    sleep[num] = true;
  }

  for (int i = 3; i <= N + 2; i++) {
    pSum[i] = 1;
  }

  for (int i = 0; i < Q; i++) {
    int num;
    cin >> num;
    if (sleep[num]) continue;
    int next = num;
    while (next <= N + 2) {
      if (sleep[next]) {
        next += num;
        continue;
      }
      pSum[next] = 0;
      next += num;
    }
  }

  for (int i = 4; i <= N + 2; i++) {
    pSum[i] += pSum[i - 1];
  }

  for (int i = 0; i < M; i++) {
    int start, end;
    cin >> start >> end;
    cout << pSum[end] - pSum[start - 1] << '\n';
  }

  return 0;
}