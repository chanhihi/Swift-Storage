/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 6987                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/6987                           #+#        #+#      #+#    */
/*   Solved: 2024/11/20 15:39:57 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>
#include <vector>

using namespace std;

vector<pair<int, int>> matches;

bool isValid(vector<vector<int>>& results, int matchIdx) {
  if (matchIdx == 15) {
    for (int i = 0; i < 6; i++) {
      if (results[i][0] != 0 || results[i][1] != 0 || results[i][2] != 0)
        return false;
    }
    return true;
  }

  int teamA = matches[matchIdx].first;
  int teamB = matches[matchIdx].second;

  if (results[teamA][0] > 0 && results[teamB][2] > 0) {
    results[teamA][0]--;
    results[teamB][2]--;
    if (isValid(results, matchIdx + 1)) return true;
    results[teamA][0]++;
    results[teamB][2]++;
  }

  if (results[teamA][1] > 0 && results[teamB][1] > 0) {
    results[teamA][1]--;
    results[teamB][1]--;
    if (isValid(results, matchIdx + 1)) return true;
    results[teamA][1]++;
    results[teamB][1]++;
  }

  if (results[teamA][2] > 0 && results[teamB][0] > 0) {
    results[teamA][2]--;
    results[teamB][0]--;
    if (isValid(results, matchIdx + 1)) return true;
    results[teamA][2]++;
    results[teamB][0]++;
  }

  return false;
}

void combi(int n, int r, int* arr, int start, vector<int> v) {
  if (v.size() == r) {
    matches.push_back({v[0], v[1]});
    return;
  }

  for (int i = start + 1; i < n; i++) {
    v.push_back(arr[i]);
    combi(n, r, arr, i, v);
    v.pop_back();
  }
}

int main() {
  vector<vector<int>> allGames(4, vector<int>(18));

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 18; j++) {
      cin >> allGames[i][j];
    }
  }

  int arr[] = {0, 1, 2, 3, 4, 5};
  vector<int> temp;
  combi(6, 2, arr, -1, temp);

  for (int i = 0; i < 4; i++) {
    vector<vector<int>> eachGames(6, vector<int>(3));
    for (int j = 0; j < 6; j++) {
      eachGames[j][0] = allGames[i][j * 3];
      eachGames[j][1] = allGames[i][j * 3 + 1];
      eachGames[j][2] = allGames[i][j * 3 + 2];
    }

    if (isValid(eachGames, 0))
      cout << "1 ";
    else
      cout << "0 ";
  }

  return 0;
}
