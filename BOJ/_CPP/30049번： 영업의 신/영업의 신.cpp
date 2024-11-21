/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 30049                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/30049                          #+#        #+#      #+#    */
/*   Solved: 2024/11/21 11:35:45 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

#define FASTIO ios::sync_with_stdio(0), cin.tie(0)

using namespace std;

int marketBestSeller[10000];
int bestSellerCount[300];
int salesTable[10000][300];
int maxSales[10000];

int countBestSeller(int employeeCount, int chargeCount) {
  int count = 0;
  for (int i = 0; i < employeeCount; i++) {
    if (bestSellerCount[i] == chargeCount) {
      count++;
    }
  }
  return count;
}

int main() {
  FASTIO;

  int n, m, k;
  cin >> n >> m >> k;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < k; j++) {
      int store, sales;
      cin >> store >> sales;
      salesTable[store - 1][i] = sales;
      maxSales[store - 1] = max(maxSales[store - 1], sales);
    }
  }

  for (int i = 0; i < m; i++) {
    if (maxSales[i] == 0) continue;
    for (int j = 0; j < n; j++) {
      if (salesTable[i][j] == maxSales[i]) {
        ++bestSellerCount[j];
        marketBestSeller[i] = j;
        break;
      }
    }
  }

  int tasks;
  cin >> tasks;

  for (int i = 0; i < tasks; i++) {
    int employee, store, sales;
    cin >> employee >> store >> sales;
    store--;
    employee--;

    if (marketBestSeller[store] == employee) {
      salesTable[store][employee] += sales;
      maxSales[store] = salesTable[store][employee];
    } else {
      salesTable[store][employee] += sales;
      if (salesTable[store][employee] > maxSales[store]) {
        maxSales[store] = salesTable[store][employee];
        bestSellerCount[marketBestSeller[store]]--;
        marketBestSeller[store] = employee;
        bestSellerCount[employee]++;
      }
    }

    cout << countBestSeller(n, k) << "\n";
  }

  return 0;
}