/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 10157                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/10157                          #+#        #+#      #+#    */
/*   Solved: 2024/10/19 18:43:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

using namespace std;

int dy[] = {-1, 0, 1, 0};
int dx[] = {0, 1, 0, -1};
int x, y, res;
vector<vector<int>> b;

void find_target(int c, int r) {
  int i = 0;
  b[r][c] = 1;

  while (b[r][c] != res) {
    int nx = c + dx[i];
    int ny = r + dy[i];

    if (ny < 0 || ny >= y || nx < 0 || nx >= x || b[ny][nx] != 0) {
      i = (i + 1) % 4;
      continue;
    }

    b[ny][nx] = b[r][c] + 1;
    c = nx;
    r = ny;

    if (b[ny][nx] == res) {
      cout << nx + 1 << " " << y - ny;
      break;
    }
  }
}

int main() {
  cin >> x >> y >> res;
  if (x * y < res) {
    cout << "0";
    return 0;
  } else if (res == 1) {
    cout << "1 1";
  }
  b.resize(y, vector<int>(x, 0));
  find_target(0, y - 1);
  return 0;
}
