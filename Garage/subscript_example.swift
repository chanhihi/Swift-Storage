//
//  subscript_example.swift
//  
//
//  Created by Chan on 2022/05/06.
//

// MARK: - 서브스크립트 subscript
/* 정의 문법
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 결과값 반환
    }
    
    set {
        // 적절한 설정자 역할 수행
    }
}
*/

// MARK: - 읽기 전용 서브 스크립트
/*
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 값 반환
    }
}

subscript(index: Int) -> Int {
    // 적절한 서브스크립트 결과값 반환
}
*/

// MARK: - School 서브스크립트 구현

struct Student {
    var name: String
    var number: Int
}

class School {
    var number = 0
    var student: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.student.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.student[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "CHAN","KANNA","GENIE","GAMJA","HONG","CHAN") // 중복 생길 수 있음

let aStuden: Student? = highSchool[1]
print(aStuden?.number, aStuden?.name)
print(highSchool[]?.name)
print(highSchool.student)
highSchool.addStudent(name: "BYE")
print(highSchool.student)

// MARK: - School 서브스크립트 구현

struct Student {
    var name: String
    var number: Int
}

class School {
    var number = 0
    var student: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.student.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.student[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "CHAN","KANNA","GENIE","GAMJA","HONG","CHAN") // 중복 생길 수 있음

let aStuden: Student? = highSchool[1]
print(aStuden?.number, aStuden?.name)
print(highSchool[]?.name)
print(highSchool.student)
highSchool.addStudent(name: "BYE")
print(highSchool.student)

// MARK: - 복수의 서브스크립트 구현

struct Student {
    var name: String
    var number: Int
}

class School {
    var number = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    subscript(name: String) -> Int? {
        get {
            return self.students.filter{$0.name == name}.first?.number
        }
        
        set {
            guard var number: Int = newValue else { return }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String, number: Int) -> Student? {
        return self.students.filter{$0.name == name && $0.number == number}.first
    }
}


let highSchool: School = School()
highSchool.addStudents(names: "CHAN","KANNA","GENIE","GAMJA","HONG","CHAN") // 중복 생길 수 있음

let aStuden: Student? = highSchool[1]
print(aStuden?.number, aStuden?.name)

print(highSchool["CHAN"])
print(highSchool["HIHI"])

highSchool[0] = Student(name: "NAHC", number: 0)
highSchool["IHIH"] = 1
print(highSchool["CHAN"], 5)
print(highSchool["GENIE"])
print(highSchool.students)


