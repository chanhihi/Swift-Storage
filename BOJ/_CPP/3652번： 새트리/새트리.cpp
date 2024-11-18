/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 3652                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/l/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/3652                           #+#        #+#      #+#    */
/*   Solved: 2024/11/18 17:20:44 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

using namespace std;

int main() {
  char d;
  int l, r, t;
  cin >> l >> d >> r;
  string s;
  while (l != r)
    if (l > r) {
      s.push_back('R');
      t = r, r = l - r, l = t;
    } else {
      s.push_back('L');
      t = l, l = r - l, r = t;
    }
  cout << s;
}
