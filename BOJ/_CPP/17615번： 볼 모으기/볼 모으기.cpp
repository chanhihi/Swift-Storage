/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17615                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17615                          #+#        #+#      #+#    */
/*   Solved: 2024/10/22 13:26:33 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>
#define fastio ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int main() {
  fastio;
  int n;
  cin >> n;
  vector<char> s(n, '0');

  for (int i = 0; i < n; i++) {
    cin >> s[i];
  }

  // 앞쪽에서 연속된 R과 B의 개수
  int st_R = 0, st_B = 0;
  for (int i = 0; i < n; i++) {
    if (s[i] == 'R')
      st_R++;
    else
      break;
  }
  for (int i = 0; i < n; i++) {
    if (s[i] == 'B')
      st_B++;
    else
      break;
  }

  // 뒤쪽에서 연속된 R과 B의 개수
  int en_R = 0, en_B = 0;
  for (int i = n - 1; i >= 0; i--) {
    if (s[i] == 'R')
      en_R++;
    else
      break;
  }
  for (int i = n - 1; i >= 0; i--) {
    if (s[i] == 'B')
      en_B++;
    else
      break;
  }

  // 전체 R과 B의 개수 계산
  int total_R = count(s.begin(), s.end(), 'R');
  int total_B = count(s.begin(), s.end(), 'B');

  // R을 모두 왼쪽 혹은 오른쪽으로 이동시키는 경우
  int result_R = min(total_R - st_R, total_R - en_R);

  // B를 모두 왼쪽 혹은 오른쪽으로 이동시키는 경우
  int result_B = min(total_B - st_B, total_B - en_B);

  // 최소 이동 횟수 출력
  cout << min(result_R, result_B) << endl;

  return 0;
}
