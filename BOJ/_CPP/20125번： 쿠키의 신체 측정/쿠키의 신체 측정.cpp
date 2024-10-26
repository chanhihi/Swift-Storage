/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 20125                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/20125                          #+#        #+#      #+#    */
/*   Solved: 2024/10/26 19:46:54 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
using namespace std;

int N;
char** arr;
int leftArm(int x, int y) {
  int count = 0;
  for (int i = 0; i < y; i++) {
    if (arr[x][i] == '*') {
      count++;
    }
  }
  return count;
}

int rightArm(int x, int y) {
  int count = 0;
  for (int i = y + 1; i < N; i++) {
    if (arr[x][i] == '*') {
      count++;
    }
  }
  return count;
}

int belly(int x, int y) {
  int count = 0;
  for (int i = x + 1; i < N; i++) {
    if (arr[i][y] == '*') {
      count++;
    }
  }
  return count;
}

int leg(int x, int y) {
  int count = 0;
  for (int i = x + 1; i < N; i++) {
    if (arr[i][y] == '*') {
      count++;
    }
  }
  return count;
}

bool heart(int i, int j) {
  if (arr[i][j] == '*' && arr[i][j + 1] == '*' && arr[i][j - 1] == '*' &&
      arr[i - 1][j] == '*' && arr[i + 1][j] == '*') {
    return true;
  } else {
    return false;
  }
}

int main() {
  string str;
  cin >> N;
  arr = new char*[N];
  for (int i = 0; i < N; i++) {
    cin >> str;
    arr[i] = new char[str.length()];
    for (int j = 0; j < str.length(); j++) {
      arr[i][j] = str.at(j);
    }
  }
  for (int i = 1; i < N - 1; i++) {
    for (int j = 1; j < N - 1; j++) {
      if (heart(i, j)) {
        cout << i + 1 << " " << j + 1 << "\n";
        cout << leftArm(i, j) << " " << rightArm(i, j) << " " << belly(i, j)
             << " " << leg(i + 1, j - 1) << " " << leg(i + 1, j + 1);
        break;
      }
    }
  }
  return 0;
}