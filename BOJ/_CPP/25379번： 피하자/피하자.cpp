/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 25379                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/25379                          #+#        #+#      #+#    */
/*   Solved: 2025/01/23 20:51:31 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int n;

int main() {
  FASTIO;
  cin >> n;
  vector<int> a;

  for (int i = 0; i < n; i++) {
    int t;
    cin >> t;
    a.push_back(t);
  }

  // 배열 a를 돌면서 앞쪽과 뒤쪽에 짝수, 홀수가 얼마나 있는지 확인하고 더 많이
  // 있는 부분쪽으로 보내기 (카운팅)

  return 0;
}