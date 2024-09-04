#include <bits/stdc++.h>

using namespace std;

int main() {
  map<string, string> m;
  int n;
  cin >> n;
  cin.ignore();

  for (int i = 0; i < n; i++) {
    string name, party;
    getline(cin, name);
    getline(cin, party);
    m[name] = party;
  }

  map<string, int> vote;
  cin >> n;
  cin.ignore();

  for (int i = 0; i < n; i++) {
    string name;
    getline(cin, name);

    if (m.find(name) != m.end()) {
      vote[name]++;
    } else {
      vote[name] = 1;
    }
  }

  int maxVotes = 0;
  string winner;
  bool tie = false;

  for (const auto& v : vote) {
    if (v.second > maxVotes) {
      maxVotes = v.second;
      winner = v.first;
      tie = false;
    } else if (v.second == maxVotes) {
      tie = true;
    }
  }

  if (tie) {
    cout << "tie" << endl;
  } else {
    cout << m[winner] << endl;
  }

  return 0;
}
