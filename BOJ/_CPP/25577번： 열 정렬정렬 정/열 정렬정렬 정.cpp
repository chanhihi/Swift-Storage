/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 25577                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/25577                          #+#        #+#      #+#    */
/*   Solved: 2024/12/09 23:07:52 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

#define MAXV 1e9

using namespace std;

int main() {
  int n;
  cin >> n;

  vector<int> a(n);

  for (int i = 0; i < n; i++) {
    cin >> a[i];
  }

  vector<int> sortedA = a;
  sort(sortedA.begin(), sortedA.end());

  int res = 0;

  for (int i = 0; i < n; i++) {
    for (int j = i; j < n; j++) {
      int min = a[i];
    }
  }

  return 0;
}