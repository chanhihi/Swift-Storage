/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 20920                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/20920                          #+#        #+#      #+#    */
/*   Solved: 2024/11/21 15:56:14 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <map>
#include <unordered_map>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

struct mcmp {
  bool operator()(const pair<int, string> &a,
                  const pair<int, string> &b) const {
    if (a.first == b.first) {
      int avlen = a.second.size(), bvlen = b.second.size();
      if (avlen == bvlen) {
        return a.second < b.second;
      }
      return avlen > bvlen;
    }
    return a.first > b.first;
  }
};

int main() {
    FASTIO;

  int n, m;
  cin >> n >> m;

  unordered_map<string, int> c;
  for (int i = 0; i < n; i++) {
    string t;
    cin >> t;
    if (t.size() >= m) {
      c[t]++;
    }
  }

  multimap<pair<int, string>, string, mcmp> freq_map;
  for (const auto &pair : c) {
    freq_map.insert({{pair.second, pair.first}, pair.first});
  }

  for (const auto &entry : freq_map) {
    cout << entry.second << "\n";
  }

  return 0;
}
