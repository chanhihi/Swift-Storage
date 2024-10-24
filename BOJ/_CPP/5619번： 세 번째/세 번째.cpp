/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 5619                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/5619                           #+#        #+#      #+#    */
/*   Solved: 2024/10/24 15:54:27 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
vector<int> result;

int n, r = 0;

void dfs(vector<int> sa, vector<int> a, vector<bool> v) {
  if (sa.size() == 2) {
    // for (auto s : sa) cout << s << " ";
    // cout << "\n";
    string res = "";
    for (auto s : sa) res += to_string(s);
    result.push_back(stoi(res));
    r++;
    return;
  }

  for (int i = 0; i < a.size(); i++) {
    if (v[i]) continue;
    v[i] = true;
    sa.push_back(a[i]);
    dfs(sa, a, v);
    sa.pop_back();
    v[i] = false;
  }
}

int main() {
  fastio;
  cin >> n;
  vector<int> a(n);
  vector<int> p(3);
  vector<int> sa;
  for (int i = 0; i < n; i++) {
    cin >> a[i];
  }

  sort(a.begin(), a.end());
  p[0] = a[0];
  p[1] = a[1];
  p[2] = a[2];
  if (n > 3) p.push_back(a[3]);

  vector<bool> v(p.size(), false);
  dfs(sa, p, v);
  sort(result.begin(), result.end());

  cout << result[2];
  return 0;
}