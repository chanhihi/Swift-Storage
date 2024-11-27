/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 31796                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/31796                          #+#        #+#      #+#    */
/*   Solved: 2024/11/27 15:59:25 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int n;

int main() {
  cin >> n;
  vector<int> books(n);

  for (int i = 0; i < n; i++) {
    cin >> books[i];
  }

  sort(books.begin(), books.end());

  int minB = 0, count = 0;

  for (auto &b : books) {
    if (minB * 2 <= b) {
      minB = b;
      count++;
    }
  }

  cout << count;

  return 0;
}