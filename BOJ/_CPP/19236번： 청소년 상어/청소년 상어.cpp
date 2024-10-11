/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 19236                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/19236                          #+#        #+#      #+#    */
/*   Solved: 2024/10/11 14:20:34 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <algorithm>
#include <iostream>
#include <vector>

// base index 1
// 위 좌위 좌 좌밑 밑 우밑 우 우위
int dy[] = {-1, -1, 0, 1, 1, 1, 0, -1};
int dx[] = {0, -1, -1, -1, 0, 1, 1, 1};

using namespace std;

// id = 0  == shark
#define SHARK 0
struct Fish {
  int d, y, x;
  bool alive;
};

int maxResult;

void moveFish(int sharkX, int sharkY, vector<vector<int>>& b,
              vector<Fish>& vf) {
  for (int i = 1; i <= 16; i++) {
    if (!vf[i].alive) continue;  // 죽은 물고기는 무시

    // 현재 순서인 물고기의 위치
    int cy = vf[i].y;
    int cx = vf[i].x;
    int cd = vf[i].d;

    // 물고기가 이동할 위치 계산
    for (int j = 0; j < 8; j++) {
      int nd = (cd + j) % 8;  // 45도씩 회전하며 새로운 방향 설정
      int ny = cy + dy[nd];
      int nx = cx + dx[nd];

      // 이동 가능한 위치가 아닌 경우 continue
      if (nx < 0 || ny < 0 || nx >= 4 || ny >= 4 ||
          (nx == sharkX && ny == sharkY))
        continue;

      // 물고기 객체의 방향 갱신
      vf[i].d = nd;

      // 다른 물고기가 있는 경우, 위치를 서로 교환
      if (b[ny][nx] != -1) {
        int targetFishId = b[ny][nx];

        // 물고기 i와 targetFish의 좌표 교환
        int targetY = vf[targetFishId].y;
        int targetX = vf[targetFishId].x;

        vf[i].y = targetY;        // 물고기 i의 새로운 y 좌표
        vf[i].x = targetX;        // 물고기 i의 새로운 x 좌표
        vf[targetFishId].y = cy;  // targetFish의 새로운 y 좌표
        vf[targetFishId].x = cx;  // targetFish의 새로운 x 좌표

        // 배열에서 물고기 번호 교환
        b[cy][cx] = targetFishId;
        b[ny][nx] = i;

      } else {
        // 빈 칸으로 이동하는 경우
        b[ny][nx] = i;
        b[cy][cx] = -1;  // 원래 위치를 빈 칸으로 변경
        vf[i].y = ny;
        vf[i].x = nx;
      }
      break;  // 이동 후에는 더 이상 반복하지 않고 다음 물고기로 넘어감
    }
  }
}

void dfs(int sum, vector<vector<int>> b, vector<Fish> vf) {
  // 상어가 해당 칸에 있는 물고기를 잡아먹기.
  int sharkX = vf[SHARK].x, sharkY = vf[SHARK].y;
  int fishId = b[sharkY][sharkX];

  vf[SHARK].d = vf[fishId].d;
  vf[fishId].alive = false;
  b[sharkY][sharkX] = -1;

  sum += fishId;
  maxResult = max(maxResult, sum);

  moveFish(sharkX, sharkY, b, vf);

  for (int i = 1; i < 4; i++) {
    int ny = sharkY + dy[vf[SHARK].d] * i;
    int nx = sharkX + dx[vf[SHARK].d] * i;

    if (nx < 0 || ny < 0 || nx >= 4 || ny >= 4 || b[ny][nx] == -1) continue;

    vf[SHARK].x = nx;
    vf[SHARK].y = ny;

    dfs(sum, b, vf);
  }
}

int main() {
  vector<vector<int>> b(4, vector<int>(4, 0));
  vector<Fish> vf(17, {0, 0, 0, true});

  int id, d;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      cin >> id >> d;
      Fish fish = {d - 1, i, j, true};
      b[i][j] = id;
      vf[id] = fish;
    }
  }

  maxResult = 0;

  dfs(maxResult, b, vf);

  cout << maxResult;

  return 0;
}