/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17143                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17143                          #+#        #+#      #+#    */
/*   Solved: 2024/10/08 14:29:21 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

struct Shark {
  int r, c, s, d, z;
};

int dx[] = {0, 0, 0, 1, -1};
int dy[] = {0, -1, 1, 0, 0};

int main() {
  int br, bc, m;
  cin >> br >> bc >> m;
  vector<Shark> sharks;
  for (int i = 0; i < m; i++) {
    // (r, c)는 상어의 위치, s는 속력, d는 이동 방향, z는 크기
    int r, c, s, d, z;
    cin >> r >> c >> s >> d >> z;
    sharks.push_back({r, c, s, d, z});
  }
  int fisher = 1;
  int result = 0;

  for (int i = 1; i <= bc; i++) {
    // 낚시꾼 움직이면서 상어잡기
    for (auto &s : sharks) {
      bool catched = false;
      if (i == s.r) {
        for (int j = 1; j <= br; j++) {
          if (j == s.c) {
            result += s.z;
            // 현재 벡터의 요소를 제거하기.
            s.r = 0;
            s.c = 0;
            catched = true;
            break;
          }
        }
        if (catched) break;
      }
    }
    // 상어 움직이기
    vector<vector<int>> sharkBoard(br, vector<int>(bc, 0));
    for (auto s : sharks) {
      if (s.r == 0 && s.c == 0) continue;
      int nr = s.r + dx[s.d] * s.s;
      int nc = s.c + dy[s.d] * s.s;

      if (nr < 1) s.r = 1;
      if (nc < 1) s.c = 1;
      if (nr > br) s.c = br;
      if (nc > bc) s.c = bc;
      if (sharkBoard[s.r][s.c] > s.z) {
        s.r = 0;
        s.c = 0;
      }
    }

    cout << result;
  }
  return 0;
}