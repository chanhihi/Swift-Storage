/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1516                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1516                           #+#        #+#      #+#    */
/*   Solved: 2024/10/19 20:45:27 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int main() {
  int n;
  cin >> n;

  vector<vector<int>> graph(n + 1);
  vector<int> in_degree(n + 1, 0);
  vector<int> build_time(n + 1, 0);
  vector<int> total_time(n + 1, 0);

  for (int i = 1; i <= n; i++) {
    cin >> build_time[i];
    int input;
    while (true) {
      cin >> input;
      if (input == -1) break;
      graph[input].push_back(i);
      in_degree[i]++;
    }
  }

  queue<int> q;

  for (int i = 1; i <= n; i++) {
    if (in_degree[i] == 0) {
      q.push(i);
      total_time[i] = build_time[i];
    }
  }

  while (!q.empty()) {
    int current = q.front();
    q.pop();

    for (int next : graph[current]) {
      in_degree[next]--;

      total_time[next] =
          max(total_time[next], total_time[current] + build_time[next]);

      if (in_degree[next] == 0) {
        q.push(next);
      }
    }
  }

  for (int i = 1; i <= n; i++) {
    cout << total_time[i] << "\n";
  }

  return 0;
}
