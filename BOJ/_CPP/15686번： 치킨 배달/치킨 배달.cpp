/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15686                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15686                          #+#        #+#      #+#    */
/*   Solved: 2024/10/07 00:28:53 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <bits/stdc++.h>

using namespace std;
#define INF 1e9

struct House {
  int r, c;
};

struct Chicken {
  int r, c;
};

vector<House> houses;
vector<Chicken> chickens;
vector<int> choice;
int minCityDistance = INF;

void calculateDistance() {
  int cityDistance = 0;
  for (int i = 0; i < houses.size(); i++) {
    int minHouseDistance = INF;
    for (int j = 0; j < chickens.size(); j++) {
      if (choice[j] == 1) {
        int houseDistance =
            abs(houses[i].r - chickens[j].r) + abs(houses[i].c - chickens[j].c);
        if (houseDistance < minHouseDistance) {
          minHouseDistance = houseDistance;
        }
      }
    }
    cityDistance += minHouseDistance;
  }
  if (cityDistance < minCityDistance) {
    minCityDistance = cityDistance;
  }
}

int main() {
  int n, m, f;
  cin >> n >> m;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cin >> f;
      if (f == 1)
        houses.push_back({i, j});
      else if (f == 2)
        chickens.push_back({i, j});
    }
  }

  for (int i = 0; i < chickens.size() - m; i++) choice.push_back(0);
  for (int i = 0; i < m; i++) choice.push_back(1);

  do {
    calculateDistance();
  } while (next_permutation(choice.begin(), choice.end()));

  cout << minCityDistance;
  return 0;
}