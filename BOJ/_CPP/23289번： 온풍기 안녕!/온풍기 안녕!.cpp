/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 23289                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/23289                          #+#        #+#      #+#    */
/*   Solved: 2024/10/12 20:30:35 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, 1};

int wdx[4][3] = {{-1, 0, 1}, {-1, 0, 1}, {1, 1, 1}, {-1, -1, -1}};
int wdy[4][3] = {{1, 1, 1}, {-1, -1, -1}, {-1, 0, 1}, {-1, 0, 1}};

int r, c, k;

void spreadWind(int x, int y, int dir, vector<vector<int>>& temper,
                const vector<vector<bool>>& wall_horizontal,
                const vector<vector<bool>>& wall_vertical, int r, int c) {
  vector<vector<bool>> visited(r, vector<bool>(c, false));  // 방문 여부 체크
  queue<tuple<int, int, int>> q;  // (x, y, 바람 세기)

  int nx = x + dx[dir];
  int ny = y + dy[dir];

  if (nx < 0 || nx >= r || ny < 0 || ny >= c) return;  // 범위 밖이면 무시
  if ((dir == 0 && wall_vertical[x][y]) ||
      (dir == 1 && wall_horizontal[x][y]) ||
      (dir == 2 && wall_vertical[nx][ny]) ||
      (dir == 3 && wall_horizontal[nx][ny]))
    return;

  q.push({nx, ny, 5});  // 바람이 처음 시작되는 칸
  temper[nx][ny] += 5;
  visited[nx][ny] = true;

  while (!q.empty()) {
    auto [cx, cy, power] = q.front();
    q.pop();
    if (power == 1) continue;  // 바람 세기가 1이면 더 이상 확산 안 함

    for (int i = 0; i < 3; i++) {
      int nx = cx + wdx[dir][i];
      int ny = cy + wdy[dir][i];

      // 범위 체크
      if (nx < 0 || nx >= r || ny < 0 || ny >= c) continue;

      // 벽 체크: 벽이 있으면 바람 확산 불가
      bool blocked = false;
      if (i == 0 && (wall_vertical[cx][cy] || wall_horizontal[cx - 1][cy]))
        blocked = true;
      if (i == 1 && (dir == 1 || dir == 3))
        blocked = true;  // 왼쪽, 아래일 때 좌우로는 벽을 체크하지 않음
      if (i == 2 && (wall_vertical[cx][cy] || wall_horizontal[cx + 1][cy]))
        blocked = true;

      if (blocked) continue;

      // 방문 안 했을 경우 바람 확산
      if (!visited[nx][ny]) {
        temper[nx][ny] += power - 1;
        q.push({nx, ny, power - 1});
        visited[nx][ny] = true;
      }
    }
  }
}

int main() {
  // r, c, 온도 k. 검사해야함.
  // 가장 처음에는 모든 칸의 온도가 0
  cin >> r >> c >> k;

  vector<vector<int>> room(r, vector<int>(c, 0));
  //   0: 빈 칸
  // 1: 방향이 오른쪽인 온풍기가 있음
  // 2: 방향이 왼쪽인 온풍기가 있음
  // 3: 방향이 위인 온풍기가 있음
  // 4: 방향이 아래인 온풍기가 있음
  // 5: 온도를 조사해야 하는 칸

  vector<vector<int>> temper(r, vector<int>(c, 0));
  vector<pair<int, pair<int, int>>> temperCheck;
  vector<int> fanDirections;
  vector<pair<int, int>> fans;

  // 온풍기 및 조사 칸 정보 입력
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      cin >> room[i][j];
      if (room[i][j] == 5) {
        temperCheck.push_back({0, {i, j}});
      } else if (room[i][j] >= 1 && room[i][j] <= 4) {
        fans.push_back({i, j});
        fanDirections.push_back(room[i][j] - 1);  // 방향은 0~3으로 맞춰줌
      }
    }
  }
  int w;
  cin >> w;
  vector<vector<bool>> wall_horizontal(r, vector<bool>(c, false));
  vector<vector<bool>> wall_vertical(r, vector<bool>(c, false));

  for (int i = 0; i < w; i++) {
    int x, y, t;
    cin >> x >> y >> t;
    x -= 1;
    y -= 1;

    if (t == 0)
      wall_vertical[x - 1][y] = true;
    else if (t == 1)
      wall_horizontal[x][y] = true;
  }

  // t == 0 > (x, y) (x-1,y) wall 왼쪽 막힘 dx[0]
  // t == 1 > (x, y) (x,y+1) wall 아래 막힘 dx[1]

  // 1. 모든 온풍기에서 바람이 한번 나옴.
  // 2. 온도 조절됨.
  // 3. 온도가 1이상인 가장 바깥쪽의 온도가 1씩 감소
  // 4. 초콜릿 먹음 result ++;
  // 5. 조사하는 모든칸이 온도 K이상이 되었는지 검사. 모든 온도가 K 이상이면
  // 테스트 중단, 아니면 반복
  int result = 0;
  while (true) {
    // 바람 확산 시뮬레이션
    for (int i = 0; i < fans.size(); i++) {
      int fx = fans[i].first;
      int fy = fans[i].second;
      int dir = fanDirections[i];
      spreadWind(fx, fy, dir, temper, wall_horizontal, wall_vertical, r, c);
    }

    // 3. 바깥온도 감소
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (i == 0 && temper[i][j] > 0)
          temper[i][j]--;
        else if (j == 0 && temper[i][j] > 0)
          temper[i][j]--;
        else if (r - 1 == i && temper[i][j] > 0)
          temper[i][j]--;
        else if (r - 1 == j && temper[i][j] > 0)
          temper[i][j]--;
      }
    }

    // 디버깅용 출력
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        cout << temper[i][j] << " ";
      }
      cout << endl;  // 줄바꿈 추가
    }
    cout << "-------" << endl;  // 구분선 추가

    // 4. 초콜릿머건
    result++;
    if (result > 100) {
      cout << result;
      return 0;
    }

    // 5. 온도체크
    for (auto& t : temperCheck) {
      t.first = temper[t.second.first][t.second.second];
      if (t.first < k) break;
      cout << result;
      return 0;
    }
  }

  // 먹는 초콜릿 갯수 출력. 만약 100개를 넘기면 101 출력.(한턴에 하나씩오름)

  return 0;
}