/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1655                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1655                           #+#        #+#      #+#    */
/*   Solved: 2024/11/14 11:06:39 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

int n;
int main() {
  FASTIO;
  cin >> n;

  priority_queue<int> maxHeap;
  priority_queue<int, vector<int>, greater<int>> minHeap;

  for (int i = 0; i < n; ++i) {
    int t;
    cin >> t;

    if (maxHeap.empty() || t <= maxHeap.top()) {
      maxHeap.push(t);
    } else {
      minHeap.push(t);
    }

    if (maxHeap.size() > minHeap.size() + 1) {
      minHeap.push(maxHeap.top());
      maxHeap.pop();
    } else if (minHeap.size() > maxHeap.size()) {
      maxHeap.push(minHeap.top());
      minHeap.pop();
    }

    cout << maxHeap.top() << "\n";
  }

  return 0;
}
