/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 32292                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/32292                          #+#        #+#      #+#    */
/*   Solved: 2024/12/08 12:27:35 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

using namespace std;

int main() {
  int t;
  cin >> t;
  for (int i = 0; i < t; i++) {
    int n;
    string s;
    cin >> n >> s;

    bool changed = true;
    while (changed) {
      string res;
      changed = false;
      for (size_t j = 0; j < s.size(); j++) {
        if (s[j] == 'A' && j + 2 < s.size() && s[j + 1] == 'B' &&
            s[j + 2] == 'B') {
          res += "BA";
          j += 2;
          changed = true;
        } else {
          res += s[j];
        }
      }
      s = res;
    }
    cout << s << "\n";
  }
  return 0;
}
