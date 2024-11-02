/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1202                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1202                           #+#        #+#      #+#    */
/*   Solved: 2024/11/02 13:39:04 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int main() {
  int N, K;
  cin >> N >> K;

  vector<pair<int, int>> gem(N);
  for (int i = 0; i < N; i++) {
    int m, v;
    cin >> m >> v;
    gem[i] = {m, v};
  }

  vector<int> bag(K);
  for (int i = 0; i < K; i++) {
    cin >> bag[i];
  }

  sort(gem.begin(), gem.end());
  sort(bag.begin(), bag.end());

  for (auto g : gem) cout << "f" << g.first << "s" << g.second << " ";
  cout << "\n";

  for (auto g : bag) cout << g << " ";
  cout << "\n";

  priority_queue<int> pq;
  long long sum = 0;
  int gemIndex = 0;

  for (int i = 0; i < K; i++) {
    while (gemIndex < N && gem[gemIndex].first <= bag[i]) {
      pq.push(gem[gemIndex].second);
      gemIndex++;
    }
    if (!pq.empty()) {
      sum += pq.top();
      pq.pop();
    }
  }

  cout << sum;
  return 0;
}
