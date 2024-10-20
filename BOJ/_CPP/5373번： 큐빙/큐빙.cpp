/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 5373                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/5373                           #+#        #+#      #+#    */
/*   Solved: 2024/10/11 21:39:40 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
using namespace std;

#define U 0
#define D 1
#define F 2
#define B 3
#define L 4
#define R 5

// 0 - up, 1 - down, 2 - front
// 3 - back 4 - left 5 - blue
char cube[6][3][3];

void setting_cube() {
  char cube_color[6] = {'w', 'y', 'r', 'o', 'g', 'b'};

  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        cube[i][j][k] = cube_color[i];
      }
    }
  }
}

void rotate_cube(int dir, char p_m) {
  char tmp[3];

  if (dir == U) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[2][0][i];
      for (int i = 0; i < 3; i++) cube[2][0][i] = cube[5][0][i];
      for (int i = 0; i < 3; i++) cube[5][0][i] = cube[3][2][2 - i];
      for (int i = 0; i < 3; i++) cube[3][2][2 - i] = cube[4][0][i];
      for (int i = 0; i < 3; i++) cube[4][0][i] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[2][0][i];
      for (int i = 0; i < 3; i++) cube[2][0][i] = cube[4][0][i];
      for (int i = 0; i < 3; i++) cube[4][0][i] = cube[3][2][2 - i];
      for (int i = 0; i < 3; i++) cube[3][2][2 - i] = cube[5][0][i];
      for (int i = 0; i < 3; i++) cube[5][0][i] = tmp[i];
      return;
    }
  }
  if (dir == D) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[2][2][i];
      for (int i = 0; i < 3; i++) cube[2][2][i] = cube[4][2][i];
      for (int i = 0; i < 3; i++) cube[4][2][i] = cube[3][0][2 - i];
      for (int i = 0; i < 3; i++) cube[3][0][2 - i] = cube[5][2][i];
      for (int i = 0; i < 3; i++) cube[5][2][i] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[2][2][i];
      for (int i = 0; i < 3; i++) cube[2][2][i] = cube[5][2][i];
      for (int i = 0; i < 3; i++) cube[5][2][i] = cube[3][0][2 - i];
      for (int i = 0; i < 3; i++) cube[3][0][2 - i] = cube[4][2][i];
      for (int i = 0; i < 3; i++) cube[4][2][i] = tmp[i];
      return;
    }
  }

  if (dir == F) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][2][i];
      for (int i = 0; i < 3; i++) cube[0][2][i] = cube[4][2 - i][2];
      for (int i = 0; i < 3; i++) cube[4][2 - i][2] = cube[1][0][2 - i];
      for (int i = 0; i < 3; i++) cube[1][0][2 - i] = cube[5][i][0];
      for (int i = 0; i < 3; i++) cube[5][i][0] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][2][i];
      for (int i = 0; i < 3; i++) cube[0][2][i] = cube[5][i][0];
      for (int i = 0; i < 3; i++) cube[5][i][0] = cube[1][0][2 - i];
      for (int i = 0; i < 3; i++) cube[1][0][2 - i] = cube[4][2 - i][2];
      for (int i = 0; i < 3; i++) cube[4][2 - i][2] = tmp[i];
      return;
    }
  }

  if (dir == B) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][0][i];
      for (int i = 0; i < 3; i++) cube[0][0][i] = cube[5][i][2];
      for (int i = 0; i < 3; i++) cube[5][i][2] = cube[1][2][2 - i];
      for (int i = 0; i < 3; i++) cube[1][2][2 - i] = cube[4][2 - i][0];
      for (int i = 0; i < 3; i++) cube[4][2 - i][0] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][0][i];
      for (int i = 0; i < 3; i++) cube[0][0][i] = cube[4][2 - i][0];
      for (int i = 0; i < 3; i++) cube[4][2 - i][0] = cube[1][2][2 - i];
      for (int i = 0; i < 3; i++) cube[1][2][2 - i] = cube[5][i][2];
      for (int i = 0; i < 3; i++) cube[5][i][2] = tmp[i];
      return;
    }
  }

  if (dir == L) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][i][0];
      for (int i = 0; i < 3; i++) cube[0][i][0] = cube[3][i][0];
      for (int i = 0; i < 3; i++) cube[3][i][0] = cube[1][i][0];
      for (int i = 0; i < 3; i++) cube[1][i][0] = cube[2][i][0];
      for (int i = 0; i < 3; i++) cube[2][i][0] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][i][0];
      for (int i = 0; i < 3; i++) cube[0][i][0] = cube[2][i][0];
      for (int i = 0; i < 3; i++) cube[2][i][0] = cube[1][i][0];
      for (int i = 0; i < 3; i++) cube[1][i][0] = cube[3][i][0];
      for (int i = 0; i < 3; i++) cube[3][i][0] = tmp[i];
      return;
    }
  }

  if (dir == R) {
    if (p_m == '+') {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][i][2];
      for (int i = 0; i < 3; i++) cube[0][i][2] = cube[2][i][2];
      for (int i = 0; i < 3; i++) cube[2][i][2] = cube[1][i][2];
      for (int i = 0; i < 3; i++) cube[1][i][2] = cube[3][i][2];
      for (int i = 0; i < 3; i++) cube[3][i][2] = tmp[i];
      return;
    } else {
      for (int i = 0; i < 3; i++) tmp[i] = cube[0][i][2];
      for (int i = 0; i < 3; i++) cube[0][i][2] = cube[3][i][2];
      for (int i = 0; i < 3; i++) cube[3][i][2] = cube[1][i][2];
      for (int i = 0; i < 3; i++) cube[1][i][2] = cube[2][i][2];
      for (int i = 0; i < 3; i++) cube[2][i][2] = tmp[i];
      return;
    }
  }
}

void rotate_face_90(int dir, char p_m) {
  int temp[3][3];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      temp[i][j] = cube[dir][i][j];
    }
  }

  if (p_m == '+') {
    cube[dir][0][0] = temp[2][0];
    cube[dir][1][0] = temp[2][1];
    cube[dir][2][0] = temp[2][2];
    cube[dir][0][1] = temp[1][0];
    cube[dir][1][1] = temp[1][1];
    cube[dir][2][1] = temp[1][2];
    cube[dir][0][2] = temp[0][0];
    cube[dir][1][2] = temp[0][1];
    cube[dir][2][2] = temp[0][2];
    return;
  } else {
    cube[dir][0][0] = temp[0][2];
    cube[dir][1][0] = temp[0][1];
    cube[dir][2][0] = temp[0][0];
    cube[dir][0][1] = temp[1][2];
    cube[dir][1][1] = temp[1][1];
    cube[dir][2][1] = temp[1][0];
    cube[dir][0][2] = temp[2][2];
    cube[dir][1][2] = temp[2][1];
    cube[dir][2][2] = temp[2][0];
    return;
  }
}

int main() {
  ios::sync_with_stdio(0), cin.tie(0);

  int t;
  cin >> t;

  for (int i = 0; i < t; i++) {
    setting_cube();

    int n;
    cin >> n;

    for (int j = 0; j < n; j++) {
      string rot;
      cin >> rot;
      int d = 0;
      if (rot[0] == 'U') d = U;
      if (rot[0] == 'D') d = D;
      if (rot[0] == 'F') d = F;
      if (rot[0] == 'B') d = B;
      if (rot[0] == 'L') d = L;
      if (rot[0] == 'R') d = R;

      rotate_face_90(d, rot[1]);
      rotate_cube(d, rot[1]);
    }

    for (int k = 0; k < 3; k++) {
      for (int l = 0; l < 3; l++) {
        cout << cube[0][k][l];
      }
      cout << '\n';
    }
  }
  return 0;
}