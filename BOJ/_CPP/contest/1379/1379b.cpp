#include <bits/stdc++.h>

using namespace std;

int main() {
  vector<int> scores(20);
  for (int i = 0; i < 20; ++i) {
    cin >> scores[i];
  }

  int idx_20 = -1;
  for (int i = 0; i < 20; ++i) {
    if (scores[i] == 20) {
      idx_20 = i;
      break;
    }
  }

  int left_idx = (idx_20 - 1 + 20) % 20;
  int right_idx = (idx_20 + 1) % 20;

  double alice_expected_value =
      (scores[left_idx] + scores[idx_20] + scores[right_idx]) / 3.0;

  double bob_expected_value =
      accumulate(scores.begin(), scores.end(), 0) / 20.0;

  if (alice_expected_value > bob_expected_value) {
    cout << "Alice" << endl;
  } else if (alice_expected_value < bob_expected_value) {
    cout << "Bob" << endl;
  } else {
    cout << "Tie" << endl;
  }

  return 0;
}
