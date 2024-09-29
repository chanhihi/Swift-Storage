/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 29719                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/29719                          #+#        #+#      #+#    */
/*   Solved: 2024/09/29 12:54:23 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

#define mod 1000000007

long long modular_pow(long long base, long long exponent) {
  long long result = 1;
  while (exponent > 0) {
    if (exponent % 2 == 1) {
      result = (result * base) % mod;
    }
    base = (base * base) % mod;
    exponent /= 2;
  }
  return result;
}

int main() {
  long long n, m;
  cin >> n >> m;

  long long total = modular_pow(m, n);
  long long without = modular_pow(m - 1, n);
  long long answer = (total - without + mod) % mod;

  cout << answer << endl;
  return 0;
}
