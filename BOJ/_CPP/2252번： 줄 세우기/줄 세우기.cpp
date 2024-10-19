/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2252                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2252                           #+#        #+#      #+#    */
/*   Solved: 2024/10/19 19:51:04 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int main() {
  int n, m;
  cin >> n >> m;

  vector<vector<int>> graph(n + 1);
  vector<int> in_degree(n + 1, 0);

  for (int i = 0; i < m; i++) {
    int x, y;
    cin >> x >> y;
    graph[x].push_back(y);
    in_degree[y]++;
  }

  queue<int> q;

  for (int i = 1; i <= n; i++) {
    if (in_degree[i] == 0) {
      q.push(i);
    }
  }

  vector<int> result;
  while (!q.empty()) {
    int current = q.front();
    q.pop();
    result.push_back(current);

    for (int next : graph[current]) {
      in_degree[next]--;
      if (in_degree[next] == 0) {
        q.push(next);
      }
    }
  }

  for (int student : result) {
    cout << student << " ";
  }
  cout << endl;

  return 0;
}
