/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 14445                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/14445                          #+#        #+#      #+#    */
/*   Solved: 2024/12/04 15:17:48 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>

using namespace std;
using ll = long long;

int main() {
  ll n;
  cin >> n;
  if (n == 1)
    cout << 0;
  else if (n & (1 << 0))
    cout << (n / 2) + 1;
  else
    cout << n / 2;
}