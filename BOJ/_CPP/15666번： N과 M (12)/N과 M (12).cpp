/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15666                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15666                          #+#        #+#      #+#    */
/*   Solved: 2024/10/17 13:37:19 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <set>
#include <vector>

using namespace std;
int n, m;

set<vector<int>> s;

void dfs(set<int> &kk, vector<int> b) {
  if (b.size() == m) {
    sort(b.begin(), b.end());
    s.insert(b);
    return;
  }

  for (auto it = kk.begin(); it != kk.end(); it++) {
    b.push_back(*it);
    dfs(kk, b);
    b.pop_back();
  }
}

int main() {
  cin >> n >> m;

  vector<int> b;
  set<int> k;

  for (int i = 0; i < n; i++) {
    int nu;
    cin >> nu;
    k.insert(nu);
  }

  dfs(k, b);

  for (auto ss : s) {
    for (auto r : ss) cout << r << " ";
    cout << "\n";
  }

  return 0;
}