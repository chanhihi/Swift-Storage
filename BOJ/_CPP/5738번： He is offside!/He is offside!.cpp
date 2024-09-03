#include <bits/stdc++.h>

using namespace std;

int main() {
  while (true) {
    int o, d;
    cin >> o >> d;
    if (d == 0 && o == 0) {
      break;
    }
    cout << "\n";

    vector<int> offense(o), defense(d);
    for (int i = 0; i < o; i++) {
      cin >> offense[i];
    }
    for (int i = 0; i < d; i++) {
      cin >> defense[i];
    }

    int closest_attacker = *min_element(offense.begin(), offense.end());
    sort(defense.begin(), defense.end());

    if (closest_attacker < defense[1]) {
      cout << "Y";
    } else {
      cout << "N";
    }
  }
  return 0;
}