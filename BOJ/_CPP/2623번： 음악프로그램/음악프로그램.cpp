/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2623                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2623                           #+#        #+#      #+#    */
/*   Solved: 2024/11/08 13:21:04 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <queue>
#include <string>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
int n, m;
int main() {
  FASTIO;
  cin >> n >> m;
  vector<int> inDegree(n + 1, 0);
  vector<vector<int>> prioritySinger(n + 1, vector<int>());
  vector<int> result;

  for (int i = 0; i < m; i++) {
    int count;
    cin >> count;

    int singer, nextSinger;
    if (count == 0) continue;
    if (count == 1) {
      cin >> singer;
      continue;
    }

    cin >> singer;
    for (int j = 0; j < count - 1; j++) {
      cin >> nextSinger;
      prioritySinger[singer].push_back(nextSinger);
      inDegree[nextSinger]++;
      singer = nextSinger;
    }
  }

  queue<int> q;

  for (int i = 1; i <= n; i++) {
    if (inDegree[i] == 0) {
      q.push(i);
    }
  }

  while (!q.empty()) {
    int current = q.front();
    q.pop();
    result.push_back(current);

    for (int next : prioritySinger[current]) {
      inDegree[next]--;
      if (inDegree[next] == 0) {
        q.push(next);
      }
    }
  }

  if (result.size() != n) {
    cout << "0";
  } else {
    for (auto d : result) cout << d << "\n";
  }

  return 0;
}
