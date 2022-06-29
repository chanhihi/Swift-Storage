//
//  Remove duplicates (multiple of 2).swift
//  swift_practise
//
//  Created by Chan on 2022/06/29.
//
//	MARK: - 중복되는 수 제거. (2배수)

import Foundation

func remove_duplicates(_ s: String) {
	var flag = true
	var s = s
	while !s.isEmpty {
		let v = s.removeFirst()
		if  !s.contains(v) {
			print(v)
			flag = false
			break
		} else {
			s.remove(at: s.firstIndex(of: v)!)
		}
	}
	
	if flag == true {
		print("_")
	}
}

//solution("c c b x a b ")//x
//solution("rrrrrrrrrrrrrrrr") //_
//solution("usgbzovrssiuqlcvqbkjdrtncjezpccpvgpabhfqyzcnzunytbkunuutiibzkbvdtnjrogyiqzxqffojqqhyamwvjiwvvefqesok") //l
//solution("hvqwbnxpigrwvqbipudchzaubjaskmgzjiyvfnlpodrgghzrpuuuyhmncowyajwqwakqzglfkzegihsudkinesaqmqcfhr")//x
