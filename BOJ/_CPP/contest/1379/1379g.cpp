#include <bits/stdc++.h>

using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int n;
  cin >> n;

  vector<int> d(n);  // 공격력
  vector<int> h(n);  // 체력

  for (int i = 0; i < n; i++) {
    cin >> d[i];
  }
  for (int i = 0; i < n; i++) {
    cin >> h[i];
  }

  long long total_damage = 0;  // 누적된 총 피해량
  int alive_count = n;         // 현재 살아있는 플레이어 수
  int turn = 0;                // 현재 플레이어의 턴

  while (alive_count > 1) {
    // 현재 플레이어가 살아 있다면 공격 수행
    if (h[turn] > total_damage) {
      total_damage += d[turn];  // 현재 플레이어의 공격력만큼 총 피해량 증가

      // 공격을 받은 플레이어들 중 체력이 0 이하가 된 경우 처리
      for (int i = 0; i < n; i++) {
        if (i != turn && h[i] > total_damage &&
            h[i] <= total_damage + d[turn]) {
          alive_count--;  // 체력이 0 이하가 되는 플레이어 수 감소
        }
      }
    }

    // 다음 플레이어로 이동
    turn = (turn + 1) % n;

    // 다음 플레이어가 체력이 0 이하라면 건너뛰기
    while (alive_count > 1 && h[turn] <= total_damage) {
      turn = (turn + 1) % n;
    }
  }

  // 남은 플레이어 출력
  for (int i = 0; i < n; i++) {
    if (h[i] > total_damage) {
      cout << i + 1 << '\n';
      break;
    }
  }

  return 0;
}
