/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 18222                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/18222                          #+#        #+#      #+#    */
/*   Solved: 2024/12/11 18:13:46 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

using namespace std;
using ll = long long;

int sol(ll k) {
  if (k == 0)
    return 0;
  else if (k == 1)
    return 1;
  else if (k % 2 == 0) {
    return sol(k / 2);
  } else {
    return 1 - sol(k / 2);
  }
}

int main() {
  int k;
  cin >> k;

  cout << sol(k - 1);

  return 0;
}
