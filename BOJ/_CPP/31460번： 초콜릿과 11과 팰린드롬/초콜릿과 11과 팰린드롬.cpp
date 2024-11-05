/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 31460                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/31460                          #+#        #+#      #+#    */
/*   Solved: 2024/11/05 16:58:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
  int t;
  cin >> t;
  vector<string> results;

  while (t--) {
    int n;
    cin >> n;

    if (n == 1) {
      results.push_back("0");
    } else {
      string palindrome = "1" + string(n - 2, '2') + "1";
      results.push_back(palindrome);
    }
  }

  for (const auto& result : results) {
    cout << result << "\n";
  }

  return 0;
}
