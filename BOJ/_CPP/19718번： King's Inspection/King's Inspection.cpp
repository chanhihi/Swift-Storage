#include <iostream>
#include <vector>

using namespace std;

int main() {
  vector<int> treasury(3);
  cin >> treasury[0] >> treasury[1] >> treasury[2];
  if (treasury[0] == treasury[1] && treasury[1] == treasury[2]) {
    cout << 0;
    return 0;
  }
  sort(treasury.begin(), treasury.end());
  int result = treasury[2] - treasury[1];
  treasury[0] += result;
  result += (treasury[2] - treasury[0]) * 2;

  cout << result;
  return 0;
}