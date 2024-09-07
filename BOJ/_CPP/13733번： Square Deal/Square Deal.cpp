#include <iostream>
#include <string>
#include <utility>

using namespace std;

string answer = "NO";

void check(int W, int X, int Y, int Z) {
  if (W == Y && X + Z == Y) answer = "YES";
  if (W == Z && X + Y == Z) answer = "YES";
  if (X == Y && W + Z == Y) answer = "YES";
  if (X == Z && W + Y == Z) answer = "YES";
}

int main() {
  vector<pair<int, int> > s;
  for (int i = 0; i < 3; i++) {
    int w, h;
    cin >> w >> h;
    s.push_back(make_pair(w, h));
  }

  for (int i = 0; i < 3; i++) {
    if (s[0].first == s[1].first)
      check(s[0].first, s[0].second + s[1].second, s[2].first, s[2].second);
    if (s[0].first == s[1].second)
      check(s[0].first, s[0].second + s[1].first, s[2].first, s[2].second);
    if (s[0].second == s[1].first)
      check(s[0].second, s[0].first + s[1].second, s[2].first, s[2].second);
    if (s[0].second == s[1].second)
      check(s[0].second, s[0].first + s[1].first, s[2].first, s[2].second);
    swap(s[0].first, s[1].first);
    swap(s[1].first, s[2].first);
    swap(s[0].second, s[1].second);
    swap(s[1].second, s[2].second);
  }
  cout << answer;
}
