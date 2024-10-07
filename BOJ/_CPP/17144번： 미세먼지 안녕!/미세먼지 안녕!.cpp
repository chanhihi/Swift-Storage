/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17144                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17144                          #+#        #+#      #+#    */
/*   Solved: 2024/10/07 23:40:49 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;

int r, c, t;
int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};

void spread(vector<vector<int>> &room) {
  vector<vector<int>> newRoom = room;
  for (int y = 0; y < r; y++) {
    for (int x = 0; x < c; x++) {
      if (room[y][x] > 0) {
        int spreadCount = 0;
        int minus = room[y][x] / 5;
        for (int k = 0; k < 4; k++) {
          int ny = y + dy[k];
          int nx = x + dx[k];
          if (ny < 0 || nx < 0 || ny >= r || nx >= c) continue;
          if (room[ny][nx] == -1) continue;
          spreadCount++;
          newRoom[ny][nx] += minus;
        }
        newRoom[y][x] -= spreadCount * minus;
      }
    }
  }
  room = newRoom;
}

void air(vector<vector<int>> &room) {
  vector<vector<int>> newRoom = room;
  // up
  for (int x = 1; x < room[0].size(); x++) {
    newRoom.front()[x - 1] = room.front()[x];
  }
  // right
  for (int y = 1; y < room.size(); y++) {
    newRoom[y - 1].back() = room[y].back();
  }
  // down
  for (int x = 0; x < room[0].size() - 1; x++) {
    newRoom.back()[x + 1] = room.back()[x];
  }
  // left r-1까지함으로써 마지막것은 공기청정기로 쏙
  for (int y = 0; y < room.size() - 1; y++) {
    newRoom[y + 1].front() = room[y].front();
  }
  // 공기청정기 없어지고 바람불고
  newRoom.back()[0] = -1;
  newRoom.back()[1] = 0;
  room = newRoom;
}

int main() {
  cin >> r >> c >> t;

  vector<vector<int>> room(r, vector<int>(c, 0));
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      cin >> room[i][j];
    }
  }

  // 확산 -> 공기청정기 작동 -> 확산 -> 반복
  while (t--) {
    vector<vector<int>> newRoom;
    // 확산때는 전체 방에서 확산
    spread(room);
    // 순환시에는 방을 두개로 쪼개서 순환.
    // -1이 있는 행에 도달하면 거기까지 첫번째 방
    // 아래쪽은 뒤집어서 엎기.
    vector<vector<int>> upRoom;
    for (auto ro : room) {
      upRoom.push_back(ro);
      if (ro[0] == -1) break;
    }
    vector<vector<int>> downRoom;
    reverse(room.begin(), room.end());
    for (auto ro : room) {
      downRoom.push_back(ro);
      if (ro[0] == -1) break;
    }
    air(upRoom);
    air(downRoom);

    for (auto ro : upRoom) {
      newRoom.push_back(ro);
    }
    reverse(downRoom.begin(), downRoom.end());
    for (auto ro : downRoom) {
      newRoom.push_back(ro);
    }

    // for (auto roo : room) {
    //   for (auto ro : roo) cout << ro << " ";
    //   cout << "\n";
    // }

    room = newRoom;
  }

  int result = 0;
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (room[i][j] > 0) result += room[i][j];
    }
  }
  cout << result;

  return 0;
}