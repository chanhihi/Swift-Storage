/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15553                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15553                          #+#        #+#      #+#    */
/*   Solved: 2024/12/17 18:14:04 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)
using namespace std;

int main() {
  FASTIO;

  int n, k;
  cin >> n >> k;
  vector<int> v;

  int t = n, last = -1e9;

  for (int i = 0; i < n; i++) {
    int x;
    cin >> x;
    v.push_back(x - last);
    last = x + 1;
  }

  sort(v.begin(), v.end());

  for (int i = 0; i < n - k; i++) {
    t += v[i];
  }

  cout << t;

  return 0;
}