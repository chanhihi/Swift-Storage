/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 2204                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/2204                           #+#        #+#      #+#    */
/*   Solved: 2024/11/21 13:47:43 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <cctype>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n;
  while (1) {
    cin >> n;
    if (n == 0) break;
    vector<pair<string, string>> v;
    for (int i = 0; i < n; i++) {
      string s, origin;
      cin >> s;
      origin = s;
      for (char &c : s) {
        c = toupper(c);
      }
      v.push_back({s, origin});
    }
    sort(v.begin(), v.end());
    cout << v[0].second << "\n";
  }

  return 0;
}