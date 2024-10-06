/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 14891                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/14891                          #+#        #+#      #+#    */
/*   Solved: 2024/10/06 23:36:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

void rotate(deque<int> &gear, int dir) {
  if (dir == -1) {
    int front = gear.front();
    gear.pop_front();
    gear.push_back(front);
  } else if (dir == 1) {
    int back = gear.back();
    gear.pop_back();
    gear.push_front(back);
  }
}

int main() {
  vector<deque<int>> gears(5, deque<int>(8));

  for (int i = 1; i < 5; i++) {
    string state;
    cin >> state;
    for (int j = 0; j < 8; j++) {
      gears[i][j] = state[j] - '0';
    }
  }

  int k;
  cin >> k;

  for (int i = 0; i < k; i++) {
    int x, dir;
    cin >> x >> dir;

    vector<int> rotation(5, 0);
    rotation[x] = dir;

    for (int i = x; i > 1; i--) {
      if (gears[i - 1][2] != gears[i][6]) {
        rotation[i - 1] = -rotation[i];
      } else {
        break;
      }
    }

    for (int i = x; i < 4; i++) {
      if (gears[i][2] != gears[i + 1][6]) {
        rotation[i + 1] = -rotation[i];
      } else {
        break;
      }
    }

    for (int i = 1; i <= 4; i++) {
      rotate(gears[i], rotation[i]);
    }
  }

  int result = 0;
  if (gears[1][0] == 1) result += 1;
  if (gears[2][0] == 1) result += 2;
  if (gears[3][0] == 1) result += 4;
  if (gears[4][0] == 1) result += 8;

  cout << result << endl;

  return 0;
}
