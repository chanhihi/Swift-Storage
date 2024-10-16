/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17088                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17088                          #+#        #+#      #+#    */
/*   Solved: 2024/10/16 19:16:17 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

#define IMAX 987654321

int n;
int minResult = IMAX;

void check_arithmetic(const vector<int> &b, int first, int second) {
  int d = second - first;
  int count = 0;

  if (b[0] != first) count++;
  if (b[1] != second) count++;

  int expected = second;

  for (int i = 2; i < n; i++) {
    expected += d;
    if (b[i] == expected)
      continue;
    else if (b[i] - 1 == expected || b[i] + 1 == expected)
      count++;
    else
      return;
  }

  minResult = min(minResult, count);
}

int main() {
  cin >> n;
  vector<int> b(n);
  for (int i = 0; i < n; i++) {
    cin >> b[i];
  }

  if (n == 1 || n == 2) {
    cout << "0";
    return 0;
  }

  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      check_arithmetic(b, b[0] + i, b[1] + j);
    }
  }

  if (minResult == IMAX)
    cout << "-1";
  else
    cout << minResult;

  return 0;
}
