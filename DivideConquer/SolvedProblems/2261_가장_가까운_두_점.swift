//
//  2261_가장_가까운_두_점.swift
//  swift_practise
//
//  Created by Chan on 2023/02/10.
//
//	https://www.acmicpc.net/problem/2261
//
//	MARK: - Divide Conquer

let n = Int(readLine()!)!

var Map = [(x: Int, y: Int)]()

for _ in 0..<n {
	let l = readLine()!.split(separator: " ").map({Int($0)!})
	Map.append((x:l[0], y:l[1]))
}

Map.sort(by: { (a:(Int,Int) , b:(Int, Int)) -> Bool in
	if (a.0 == b.0){ return a.1 < b.1 }
	else { return a.0 < b.0 }
})

print(Divide_Conquer(0, n-1))

func Distance (_ a: (Int, Int), _ b: (Int, Int)) -> Int { return (a.0 - b.0) * (a.0 - b.0) + (a.1 - b.1) * (a.1 - b.1) }

func Divide_Conquer (_ start: Int, _ end: Int) -> Int {
	let mid = Int((start + end) / 2)
	if end - start == 1{ return Distance(Map[end], Map[start]) }
	if end - start == 2 { return min(Distance(Map[end], Map[start]), Distance(Map[end], Map[mid]), Distance(Map[mid], Map[start]))}
	
	let left = Divide_Conquer(start, mid)
	let right = Divide_Conquer(mid, end)
	var min_distance = min(left,right)
	
	var check_stars = [(x: Int, y: Int)]()
	for i in start...end {
		let dis = Map[mid].x - Map[i].x
		if dis * dis < min_distance {
			check_stars.append(Map[i])
		}
	}
	check_stars.sort(by: { (a:(Int,Int) , b:(Int, Int)) -> Bool in
		if (a.1 == b.1){ return a.0 < b.0 }
		else { return a.1 < b.1 }
	})
	let loop = check_stars.count
	for i in 0..<loop {
		for k in i+1..<loop{
			if (check_stars[i].y - check_stars[k].y) * (check_stars[i].y - check_stars[k].y) > min_distance { break }
			min_distance = min(min_distance, Distance(check_stars[i], check_stars[k]))
		}
	}
	return min_distance
}
