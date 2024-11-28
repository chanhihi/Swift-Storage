/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 3684                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/3684                           #+#        #+#      #+#    */
/*   Solved: 2024/11/28 22:45:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

#define MOD 10001
using namespace std;

int main() {
  int t;
  cin >> t;
  bool flag = false;

  vector<int> v(t);
  for (int i = 0; i < t; i++) {
    cin >> v[i];
  }

  int ra, rb;

  for (int a = 0; a <= 10000; a++) {
    for (int b = 0; b <= 10000; b++) {
      int cnt = 0;
      for (int i = 0; i < t - 1; i++) {
        int num = (a * v[i] + b) % MOD;
        if (v[i + 1] == (a * num + b) % MOD)
          cnt++;
        else
          break;
      }

      if (cnt == t - 1) {
        flag = true;
        ra = a;
        rb = b;
      }

      if (flag == true) break;
    }

    if (flag == true) break;
  }

  for (int i = 0; i < t; i++) {
    cout << (ra * v[i] + rb) % MOD << '\n';
  }
}