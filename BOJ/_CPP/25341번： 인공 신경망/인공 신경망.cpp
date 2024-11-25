/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 25341                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/25341                          #+#        #+#      #+#    */
/*   Solved: 2024/11/25 12:59:45 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <vector>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;
using ll = long long;

int N, M, Q;

vector<ll> inputLayer[2001];
vector<ll> hiddenLayer[2001];
ll weight[2001];
ll weightPrint;

vector<ll> input[2001];
ll multipleInput[2001];

int main() {
  FASTIO;
  cin >> N >> M >> Q;

  for (int i = 1; i <= M; i++) {
    int c;
    cin >> c;
    for (int j = 1; j <= c; j++) {
      int x;
      cin >> x;
      inputLayer[i].push_back(x);
    }
    for (int j = 1; j <= c; j++) {
      int x;
      cin >> x;
      hiddenLayer[i].push_back(x);
    }
    cin >> weight[i];
  }

  for (int i = 1; i <= M; i++) {
    int x;
    cin >> x;
    for (int j = 0; j < inputLayer[i].size(); j++) {
      multipleInput[inputLayer[i][j]] += (hiddenLayer[i][j] * x);
    }
    weight[i] *= x;
  }
  cin >> weightPrint;

  for (int i = 1; i <= Q; i++) {
    for (int j = 1; j <= N; j++) {
      int x;
      cin >> x;
      input[i].push_back(x);
    }
  }

  ll sum_last = 0;
  for (int i = 1; i <= M; i++) {
    sum_last += weight[i];
  }
  sum_last += weightPrint;

  for (int i = 1; i <= Q; i++) {
    ll Sum = 0;
    for (int j = 1; j <= N; j++) {
      Sum += input[i][j - 1] * multipleInput[j];
    }
    Sum += sum_last;
    cout << Sum << "\n";
  }

  return 0;
}