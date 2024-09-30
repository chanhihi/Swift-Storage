#include <iostream>
#include <string>

using namespace std;

int main() {
  string s;
  cin >> s;

  if (s == "(1)") {
    cout << 0 << endl;
  } else if (s == "1)(") {
    cout << 1 << endl;
  } else if (s == ")1(") {
    cout << 2 << endl;
  } else {
    cout << 1 << endl;
  }

  return 0;
}
