/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 28064                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/28064                          #+#        #+#      #+#    */
/*   Solved: 2024/10/04 23:05:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>
using namespace std;
#define fastio ios::sync_with_stdio(0), cin.tie(0)

template <typename t>
void pa(t T) {
  for (auto p : T) cout << p << " ";
  cout << "\n";
}

// 서로다른 5개의 구슬이 들어있는 구슬망에서 3개의 구슬을
// 뽑는 조합 구현
// nCr = 5C3

int n = 5;
int r = 3;
int arr[] = {1, 2, 3, 4, 5};

vector<int> v;

void combi(int start, vector<int> v) {
  if (v.size() == r) {
    pa(v);
    return;
  }
  for (int i = start + 1; i < n; i++) {
    v.push_back(arr[i]);
    combi(i, v);
    v.pop_back();
  }
  return;
}

int main() {
  combi(-1, v);
  return 0;
}

bool can_connect(const string &s1, const string &s2) {
  int len1 = s1.size(), len2 = s2.size();
  int min_len = min(len1, len2);

  for (int k = 1; k <= min_len; k++) {
    if (s1.substr(len1 - k, k) == s2.substr(0, k)) return true;

    if (s2.substr(len2 - k, k) == s1.substr(0, k)) return true;
  }
  return false;
}

// int main() {
//   fastio;
//   int n;
//   cin >> n;
//   vector<string> ss;
//   for (int i = 0; i < n; i++) {
//     string s;
//     cin >> s;
//     ss.push_back(s);
//   }
//   int count = 0;

//   for (int i = 0; i < n - 1; i++) {
//     for (int j = i + 1; j < n; j++) {
//       if (can_connect(ss[i], ss[j])) {
//         count++;
//       }
//     }
//   }

//   cout << count;
//   return 0;
// }