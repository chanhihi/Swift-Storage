#include <bits/stdc++.h>

using namespace std;

struct robot {
  int r, c;
  int next_r, next_c;
  queue<int> next;
};

bool checkRobot(vector<robot> b) {
  for (int i = 0; i < b.size(); i++) {
    if (!b[i].next.empty()) {
      return false;
    }
  }
  return true;
}

int solution(vector<vector<int>> points, vector<vector<int>> routes) {
  int answer = 0;

  vector<robot> b(routes.size());
  int check[101][101] = {0};

  for (int i = 0; i < routes.size(); i++) {
    b[i].r = points[routes[i][0] - 1][0];
    b[i].c = points[routes[i][0] - 1][1];
    check[b[i].r][b[i].c]++;

    for (int j = 1; j < routes[i].size(); j++) {
      b[i].next.push(routes[i][j] - 1);
    }

    // 경로 설절
    int next_destination = b[i].next.front();
    b[i].next_r = points[next_destination][0];
    b[i].next_c = points[next_destination][1];
  }

  // 초기에 뭉쳐있는지 체크해야함.
  for (int i = 1; i <= 100; i++) {
    for (int j = 1; j <= 100; j++) {
      if (check[i][j] >= 2) {
        answer++;
      }
    }
  }

  while (!checkRobot(b)) {
    for (int i = 0; i < b.size(); i++) {
      // 경로 도착하면 다음 부터 돌지 않음
      if (b[i].next.empty() || !b[i].r || !b[i].c) continue;

      // 경로 도착
      if (b[i].r == b[i].next_r && b[i].c == b[i].next_c) {
        check[b[i].r][b[i].c]--;
        b[i].next.pop();

        // next가 비어있지 않으면 모든 bot 다음 경로 설정
        if (!b[i].next.empty()) {
          check[b[i].r][b[i].c]++;
          int next_destination = b[i].next.front();
          b[i].next_r = points[next_destination][0];
          b[i].next_c = points[next_destination][1];
        }
      }
    }

    // 한스탭씩
    for (int i = 0; i < b.size(); i++) {
      if (b[i].next.empty()) continue;
      check[b[i].r][b[i].c]--;
      // r 축 우선 이동
      if (b[i].r < b[i].next_r) {
        b[i].r++;
      } else if (b[i].r > b[i].next_r) {
        b[i].r--;
      } else if (b[i].c > b[i].next_c) {
        b[i].c--;
      } else if (b[i].c < b[i].next_c) {
        b[i].c++;
      }
      check[b[i].r][b[i].c]++;
    }

    // check board 뒤져서 로봇 둘이상이면 위험지역
    for (int i = 1; i <= 100; i++) {
      for (int j = 1; j <= 100; j++) {
        if (check[i][j] >= 2) {
          answer++;
        }
      }
    }
  }

  return answer;
}