/* ************************************************************************** */
/*                                                                            */
/*                                                      :::    :::    :::     */
/*   Problem Number: 15815                             :+:    :+:      :+:    */
/*                                                    +:+    +:+        +:+   */
/*   By: chanhihi <boj.kr/u/chanhihi>                +#+    +#+          +#+  */
/*                                                  +#+      +#+        +#+   */
/*   https://boj.kr/15815                          #+#        #+#      #+#    */
/*   Solved: 2025/01/15 20:53:57 by chanhihi      ###          ###   ##.kr    */
/*                                                                            */
/* ************************************************************************** */
#include <iostream>
#include <string>
#include <vector>

using namespace std;

// 스택에서 값을 꺼내 연산 후 다시 스택에 추가하는 함수
void performOperation(vector<int>& stack, char operation) {
  int secondOperand = stack.back();  // 두 번째 피연산자
  stack.pop_back();
  int firstOperand = stack.back();  // 첫 번째 피연산자
  stack.pop_back();

  switch (operation) {
    case '+':
      stack.push_back(firstOperand + secondOperand);
      break;
    case '-':
      stack.push_back(firstOperand - secondOperand);
      break;
    case '*':
      stack.push_back(firstOperand * secondOperand);
      break;
    case '/':
      stack.push_back(firstOperand / secondOperand);
      break;
  }
}

int main() {
  string inputExpression;
  cin >> inputExpression;

  vector<int> stack;  // 후위 표기법 처리를 위한 스택

  for (char ch : inputExpression) {
    if (isdigit(ch)) {
      // 숫자는 스택에 추가
      stack.push_back(ch - '0');
    } else {
      // 연산자는 처리
      performOperation(stack, ch);
    }
  }

  // 최종 결과 출력
  cout << stack[0];

  return 0;
}
