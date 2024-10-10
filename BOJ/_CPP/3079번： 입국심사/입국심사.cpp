/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 3079                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/3079                           #+#        #+#      #+#    */
/*   Solved: 2024/10/10 16:10:41 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  int N, M;
  cin >> N >> M;

  vector<int> times(N);
  for (int i = 0; i < N; ++i) {
    cin >> times[i];
  }
  sort(times.begin(), times.end());

  long long left = 1;
  long long right = *max_element(times.begin(), times.end()) * (long long)M;
  long long result = right;

  while (left <= right) {
    long long mid = (left + right) / 2;
    long long people = 0;

    for (int i = 0; i < N; ++i) {
      people += mid / times[i];
      if (people >= M) break;
    }

    if (people >= M) {
      result = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  cout << result;

  return 0;
}
