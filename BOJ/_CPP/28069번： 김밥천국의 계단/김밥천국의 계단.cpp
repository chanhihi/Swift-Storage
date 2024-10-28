/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 28069                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/28069                          #+#        #+#      #+#    */
/*   Solved: 2024/10/28 10:18:02 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
using namespace std;

int n, k;

int v[1000001];
int jump(int i) { return i + i / 2; }

void bfs() {
  queue<int> q;
  v[0] = 1;
  q.push(0);

  while (!q.empty()) {
    int f = q.front();
    q.pop();
    int nxt1 = f + 1, nxt2 = jump(f);
    if (nxt1 <= 1000001 && !v[nxt1]) {
      v[nxt1] = v[f] + 1;
      q.push(nxt1);
    }
    if (nxt2 <= 1000001 && !v[nxt2]) {
      v[nxt2] = v[f] + 1;
      q.push(nxt2);
    }
  }
}

int main() {
  bfs();

  cin >> n >> k;

  if (v[n] - 1 <= k)
    cout << "minigimbob";
  else
    cout << "water";
}