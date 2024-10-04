/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 17646                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/17646                          #+#        #+#      #+#    */
/*   Solved: 2024/10/04 14:22:24 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

// Function to check if a number is a perfect square
bool isPerfectSquare(ll n) {
  ll sqrt_n = (ll)sqrt(n);
  return (sqrt_n * sqrt_n == n);
}

// Function to solve the problem
void solve(ll n) {
  // Case 1: n is a perfect square
  if (isPerfectSquare(n)) {
    cout << 1 << endl;
    cout << (ll)sqrt(n) << endl;
    return;
  }

  // Case 2: Check if it can be expressed as the sum of two squares
  for (ll i = 1; i * i <= n; ++i) {
    ll remainder = n - i * i;
    if (isPerfectSquare(remainder)) {
      cout << 2 << endl;
      cout << i << " " << (ll)sqrt(remainder) << endl;
      return;
    }
  }

  // Case 3: Check if it can be expressed as the sum of three squares
  ll temp = n;
  while (temp % 4 == 0) {
    temp /= 4;
  }
  if (temp % 8 != 7) {
    for (ll i = 0; i * i <= n; ++i) {
      for (ll j = i; i * i + j * j <= n; ++j) {
        ll remainder = n - i * i - j * j;
        if (isPerfectSquare(remainder)) {
          cout << 3 << endl;
          cout << i << " " << j << " " << (ll)sqrt(remainder) << endl;
          return;
        }
      }
    }
  }

  // Case 4: If none of the above, it must be the sum of four squares
  cout << 4 << endl;
  // Using a greedy approach to print the squares
  vector<ll> result;
  while (n > 0) {
    ll sq = (ll)sqrt(n);
    result.push_back(sq);
    n -= sq * sq;
  }
  // Adjusting to ensure the result matches exactly four squares
  while (result.size() < 4) {
    result.push_back(0);
  }
  for (auto &val : result) {
    cout << val << " ";
  }
  cout << endl;
}

int main() {
  ll n;
  cin >> n;
  solve(n);
  return 0;
}
