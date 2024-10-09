/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 4659                              :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/4659                           #+#        #+#      #+#    */
/*   Solved: 2024/10/09 17:01:01 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

using namespace std;

char vowels[5] = {'a', 'e', 'i', 'o', 'u'};

bool check_include_vowel(std::string s) {
  for (int i = 0; i < s.size(); i++) {
    for (int j = 0; j < 5; j++) {
      bool found = s[i] == vowels[j];
      if (found) return true;
    }
  }

  return false;
}

bool check_conti_three_letters(std::string s) {
  int v_count = 0;
  int c_count = 0;

  for (int i = 0; i < s.size(); i++) {
    bool exist = false;
    for (int j = 0; j < 5; j++) {
      exist = (s[i] == vowels[j]);
      if (exist) {
        v_count += 1;
        c_count = 0;
        break;
      }
    }

    if (!exist) {
      v_count = 0;
      c_count += 1;
    }

    if (v_count >= 3 || c_count >= 3) return false;
  }
  return true;
}

bool check_conti_two_letters(std::string s) {
  int count = 1;
  char prev_letter = s[0];

  for (int i = 1; i < s.size(); i++) {
    if (prev_letter == s[i] && prev_letter != 'e' && prev_letter != 'o')
      return false;
    prev_letter = s[i];
    count = 1;
  }
  return true;
}

int main() {
  std::string s = "";

  while (true) {
    std::cin >> s;
    if (s == "end") break;

    bool case1 = check_include_vowel(s);
    bool case2 = check_conti_three_letters(s);
    bool case3 = check_conti_two_letters(s);

    bool total = case1 && case2 && case3;

    if (total) {
      std::cout << "<" << s << "> is acceptable." << std::endl;
    } else {
      std::cout << "<" << s << "> is not acceptable." << std::endl;
    }
  }

  return 0;
}
