/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 3711                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/3711                           #+#        #+#      #+#    */
/*   Solved: 2024/11/21 11:41:49 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <set>
#include <vector>

using namespace std;

int main() {
  int n, g;
  cin >> n;

  while (n--) {
    cin >> g;
    vector<int> v;
    int studentNumber;

    for (int i = 0; i < g; i++) {
      cin >> studentNumber;
      v.push_back(studentNumber);
    }

    set<int> studentM;
    int m = 0;
    while (studentM.size() != g) {
      m++;
      studentM.clear();
      for (auto &sn : v) {
        studentM.insert(sn % m);
      }
    }
    cout << m << "\n";
  }
  return 0;
}