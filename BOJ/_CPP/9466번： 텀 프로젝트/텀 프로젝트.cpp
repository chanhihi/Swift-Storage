/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 9466                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/9466                           #+#        #+#      #+#    */
/*   Solved: 2024/11/03 21:31:41 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <deque>
#include <iostream>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

void dfs(int current, int& count, deque<bool>& v, deque<bool>& visited,
         deque<int>& team) {
  visited[current] = true;
  int next = team[current];

  if (!visited[next]) {
    dfs(next, count, v, visited, team);
  } else if (!v[next]) {
    for (int i = next; i != current; i = team[i]) count++;
    count++;
  }

  v[current] = true;
}

int main() {
  FASTIO;
  int t, n;
  cin >> t;
  for (int i = 0; i < t; ++i) {
    cin >> n;
    deque<int> team(n + 1);
    deque<bool> v(n + 1, false);
    deque<bool> visited(n + 1, false);

    for (int j = 1; j <= n; ++j) {
      cin >> team[j];
    }

    int count = 0;
    for (int j = 1; j <= n; ++j) {
      if (!visited[j]) dfs(j, count, v, visited, team);
    }

    cout << n - count << "\n";
  }
}