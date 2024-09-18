#include <bits/stdc++.h>

using namespace std;

int main() {
  int a, b, n;
  cin >> n >> a >> b;
  int c = 1, d = 1;

  while (n--) {
    c += a;
    d += b;
    if (d > c) {
      int temp;
      temp = c;
      c = d;
      d = temp;
    } else if (c == d) {
      d--;
    }
  }
  cout << c << " " << d;
}