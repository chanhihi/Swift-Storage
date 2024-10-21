/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 1644                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/1644                           #+#        #+#      #+#    */
/*   Solved: 2024/10/21 18:41:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <cmath>
#include <iostream>

using namespace std;

int n;
int pn[4000001];
int conPn[4000001];

int primeNumberSieve() {
  for (int i = 2; i <= n; i++) {
    pn[i] = i;
  }

  for (int i = 2; i <= sqrt(n); i++) {
    if (pn[i] == 0) continue;
    for (int j = i * i; j <= n; j += i) pn[j] = 0;
  }

  int j = 0;
  for (int i = 2; i <= n; i++) {
    if (pn[i] != 0) conPn[j++] = pn[i];
  }

  return j;
}

int main() {
  cin >> n;
  int count = 0;
  int conPnSize = 0;
  conPnSize = primeNumberSieve();

  int start = 0, end = 0, sum = 0;
  while (end <= conPnSize) {
    if (sum == n) {
      count++;
      sum -= conPn[start++];
    } else if (sum < n) {
      sum += conPn[end++];
    } else {
      sum -= conPn[start++];
    }
  }

  cout << count;

  return 0;
}