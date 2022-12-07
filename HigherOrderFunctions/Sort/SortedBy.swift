//
//  Sorted by
//

// Client

class Client {
    func runArray() {
        let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        
        let descendingStudents = students.sorted(by: >)
        print(descendingStudents)
    }
    
    func runDictionary() {
        let students = [1: "Kofi", 2: "Abena", 3: "Peter", 4: "Kweku", 5: "Akosua"]
        
        let descendingStudents = students.sorted(by: >)
        print(descendingStudents)
    }
    
    func runSet() {
        let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        
        let descendingStudents = students.sorted(by: >)
        print(descendingStudents)
    }
}

// Client().runArray()
// ["Peter", "Kweku", "Kofi", "Akosua", "Abena"]

// Client().runDictionary()
// [(key: 5, value: "Akosua"), (key: 4, value: "Kweku"), (key: 3, value: "Peter"), (key: 2, value: "Abena"), (key: 1, value: "Kofi")]

// Client().runSet()
// ["Peter", "Kweku", "Kofi", "Akosua", "Abena"]
