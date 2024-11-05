/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 4108                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/4108                           #+#        #+#      #+#    */
/*   Solved: 2024/11/05 16:44:35 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int dy[] = {0, 0, 1, 1, 1, -1, -1, -1};
int dx[] = {1, -1, 1, 0, -1, 1, 0, -1};
int r, c;

void printBoard(vector<vector<int>> &b) {
  for (auto nr : b) {
    for (auto nc : nr) {
      if (nc == -1)
        cout << "*";
      else
        cout << nc;
    }
    cout << "\n";
  }
}

void fillBoard(vector<vector<int>> &b, int y, int x) {
  for (int i = 0; i < 8; ++i) {
    int ny = y + dy[i];
    int nx = x + dx[i];

    if (ny < 0 || ny >= r || nx < 0 || nx >= c || b[ny][nx] < 0) continue;

    b[ny][nx]++;
  }
}

int main() {
  while (1) {
    cin >> r >> c;
    if (r == 0 && c == 0) break;

    vector<vector<int>> b(r, vector<int>(c, 0));

    for (int i = 0; i < r; ++i) {
      for (int j = 0; j < c; ++j) {
        char ch;
        cin >> ch;
        if (ch == '.') continue;
        b[i][j] = -1;
      }
    }

    for (int i = 0; i < r; ++i) {
      for (int j = 0; j < c; ++j) {
        if (b[i][j] == -1) {
          fillBoard(b, i, j);
        }
      }
    }
    printBoard(b);
  }

  return 0;
}