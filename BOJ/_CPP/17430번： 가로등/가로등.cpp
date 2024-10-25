/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17430                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17430                          #+#        #+#      #+#    */
/*   Solved: 2024/10/25 19:50:33 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <map>
#include <vector>
#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
int t, n;

int main() {
  fastio;
  cin >> t;
  for (int i = 0; i < t; i++) {
    cin >> n;
    bool flag = false;
    map<int, vector<int>> m;

    for (int j = 0; j < n; j++) {
      int k, v;
      cin >> k >> v;
      m[k].push_back(v);
    }
    for (auto &i : m) sort(i.second.begin(), i.second.end());
    for (auto i : m) {
      if (flag) break;
      for (auto j : m) {
        if (i.first == j.first) continue;
        if (i.second != j.second) {
          flag = true;
          break;
        }
      }
    }
    cout << (flag ? "NOT BALANCED\n" : "BALANCED\n");
  }
  return 0;
}