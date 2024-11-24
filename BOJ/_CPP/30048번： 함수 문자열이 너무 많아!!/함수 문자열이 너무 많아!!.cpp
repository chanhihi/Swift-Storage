/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 30048                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/30048                          #+#        #+#      #+#    */
/*   Solved: 2024/11/24 19:30:09 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>

using namespace std;

int profitTable[10000][300];
int maxProfit[10000];
int bestSellerCount[300];
int marketBestSeller[10000];

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
  int employeeCount, marketCount, chargeCount;
  cin >> employeeCount >> marketCount >> chargeCount;

  for (int i = 0; i < employeeCount; i++) {
    for (int j = 0; j < chargeCount; j++) {
      int market, profit;
      cin >> market >> profit;
      profitTable[market - 1][i] = profit;
      maxProfit[market - 1] = max(maxProfit[market - 1], profit);
    }
  }

  for (int i = 0; i < marketCount; i++) {
    if (maxProfit[i] == 0) {
      continue;
    }
    for (int j = 0; j < employeeCount; j++) {
      if (profitTable[i][j] == maxProfit[i]) {
        ++bestSellerCount[j];
        marketBestSeller[i] = j;
        break;
      }
    }
  }

  int tasks;
  cin >> tasks;

  for (int i = 0; i < tasks; i++) {
    int employee, market, profit;
    cin >> employee >> market >> profit;
    market--;
    employee--;

    if (marketBestSeller[market] == employee) {
      profitTable[market][employee] += profit;
      maxProfit[market] = profitTable[market][employee];
    } else {
      profitTable[market][employee] += profit;
      if (profitTable[market][employee] > maxProfit[market]) {
        maxProfit[market] = profitTable[market][employee];
        bestSellerCount[marketBestSeller[market]]--;
        marketBestSeller[market] = employee;
        bestSellerCount[employee]++;
      }
    }

    cout << countBestSeller(employeeCount, chargeCount);
  }

  return 0;
}