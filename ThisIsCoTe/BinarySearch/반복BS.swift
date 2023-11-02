//
//  반복BS.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/29.
//

func binarySearch(_ array: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
	var mid = -1, start = start, end = end
	while start <= end {
		mid = (start + end) / 2
		if array[mid] == target { return mid }
		else if array[mid] > target { end = mid - 1 }
		else { start = mid + 1 }
	}
	return -1
}

let nt = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, target) = (nt[0], nt[1])

var array = readLine()!.split{$0==" "}.map{Int(String($0))!}

var result = binarySearch(array.sorted(), target, 0, n-1)

print("result :", result == -1 ? "none" : result + 1)
