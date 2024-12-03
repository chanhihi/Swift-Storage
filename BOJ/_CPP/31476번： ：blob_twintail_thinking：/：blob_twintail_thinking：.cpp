/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 31476                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/31476                          #+#        #+#      #+#    */
/*   Solved: 2024/12/03 15:33:58 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>
#include <queue>
#include <vector>
#define MAX 5000
#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
int d, n, u, t, s, e, cnt;
bool banned[MAX][2];
bool visited[MAX];
int anst, ansp;

void twintail() {
  queue<pair<pair<int, int>, pair<int, int> > > q;
  visited[1] = true;
  q.push({{1, 1}, {0, 0}});

  while (!q.empty()) {
    auto cur = q.front();
    int curX = cur.first.first;
    int curD = cur.first.second;
    int curS = cur.second.first;
    int curT = cur.second.second;
    q.pop();

    cnt++;
    anst = max(anst, curT);

    if (curD == d) {
      continue;
    }

    if (!banned[curX][0] && !banned[curX][1]) {
      q.push({{curX * 2, curD + 1}, {curS + 1, curT + u + (t * (curS + 1))}});
      q.push({{(curX * 2) + 1, curD + 1},
              {curS + 1, curT + u + (t * (curS + 1))}});
    } else if (!banned[curX][0] && banned[curX][1]) {
      q.push({{curX * 2, curD + 1}, {curS, curT + u + (t * curS)}});
    } else if (banned[curX][0] && !banned[curX][1]) {
      q.push({{(curX * 2) + 1, curD + 1}, {curS, curT + u + (t * curS)}});
    }
  };
}

void ponytail(int depth, int cur) {
  cnt--;

  if (depth == d) {
    return;
  }

  if (!banned[cur][0] && !visited[cur * 2]) {
    visited[cur * 2] = true;
    ansp += u;
    ponytail(depth + 1, cur * 2);
    if (cnt > 0) {
      ansp += u;
    }
  }

  if (!banned[cur][1] && !visited[(cur * 2) + 1]) {
    visited[(cur * 2) + 1] = true;
    ansp += u;
    ponytail(depth + 1, (cur * 2) + 1);
    if (cnt > 0) {
      ansp += u;
    }
  }
}

void settings() {
  twintail();
  ponytail(1, 1);
}

int main() {
  FASTIO;

  cin >> d >> n >> u >> t;
  for (int i = 0; i < n; i++) {
    cin >> s >> e;
    if ((s * 2) == e) {
      banned[s][0] = true;
    } else {
      banned[s][1] = true;
    }
  }

  settings();

  if (anst < ansp) {
    cout << ":blob_twintail_aww:\n";
  } else if (anst > ansp) {
    cout << ":blob_twintail_sad:\n";
  } else {
    cout << ":blob_twintail_thinking:\n";
  }

  return 0;
}