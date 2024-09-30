/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 20055                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/20055                          #+#        #+#      #+#    */
/*   Solved: 2024/10/08 21:48:00 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <deque>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n, k;
  cin >> n >> k;
  deque<pair<int, int>> belts;
  for (int i = 0; i < n * 2; i++) {
    int r;
    cin >> r;
    belts.push_back({r, 0});
    // first 내구도, second 로봇 유무
  }
  int loop = 0;
  while (true) {
    loop++;
    // 벨트회전
    auto t = belts.back();
    belts.pop_back();
    belts.push_front(t);

    // for (auto a : belts)
    //   cout << loop << "- belts >> " << a.first << ", " << a.second << "\n";

    if (belts[n - 1].second == 1) {
      belts[n - 1].second = 0;
    }

    // 맨뒤에 로봇도 처음으로 이동시켜줘야한다 ~
    if (belts.front().first > 0 && belts.front().second == 0 &&
        belts.back().second == 1) {
      belts.front().first--;
      swap(belts.front().second, belts.back().second);
    }

    // 로봇은 회전방향으로 이동할 수 있다면 바로 이동한다.
    for (int i = n * 2 - 1; i > 0; i--) {
      if (belts[i].first > 0 && belts[i].second == 0 &&
          belts[i - 1].second == 1) {
        belts[i].first--;
        swap(belts[i].second, belts[i - 1].second);
      }
    }

    // 움직였는데 n에 로봇이 있다면 내려라
    if (belts[n - 1].second == 1) {
      belts[n - 1].second = 0;
    }

    // n에 로봇이 없으면 즉시 올린다.
    if (belts.front().first > 0 && belts.front().second == 0) {
      belts.front().first--;
      belts.front().second = 1;
    }

    int rK = 0;
    for (auto b : belts) {
      if (b.first == 0) rK++;
    }
    if (rK >= k) break;
  }

  cout << loop;
  return 0;
}