/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1005                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1005                           #+#        #+#      #+#    */
/*   Solved: 2024/10/30 13:46:02 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

int main() {
  fastio;
  int t;
  cin >> t;
  for (int i = 0; i < t; ++i) {
    int n, k;
    cin >> n >> k;

    vector<vector<int>> priorityBuild(n + 1);
    vector<int> buildTime(n + 1, 0);
    vector<int> totalTime(n + 1, 0);
    vector<int> inDegree(n + 1, 0);

    for (int j = 1; j <= n; j++) {
      cin >> buildTime[j];
      totalTime[j] = buildTime[j];
    }

    for (int j = 1; j <= k; j++) {
      int a, b;
      cin >> a >> b;
      priorityBuild[a].push_back(b);
      inDegree[b]++;
    }

    int w;
    cin >> w;

    queue<int> q;

    for (int j = 1; j <= n; j++) {
      if (inDegree[j] == 0) {
        q.push(j);
      }
    }

    while (!q.empty()) {
      int current = q.front();
      q.pop();

      for (int next : priorityBuild[current]) {
        inDegree[next]--;

        totalTime[next] =
            max(totalTime[next], totalTime[current] + buildTime[next]);

        if (inDegree[next] == 0) {
          q.push(next);
        }
      }
    }

    cout << totalTime[w] << "\n";
  }

  return 0;
}