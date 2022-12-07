//
//  Compact map
//

// Client

class Client {
    func runArray() {
        let possibleNumbers = ["1", "2", "three", "///4///", "5"]
        
        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
        print(mapped)
        
        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
        print(compactMapped)
    }
    
    func runDictionary() {
        let possibleNumbers = [1: "1", 2: "2", 3: "three", 4: "///4///", 5: "5"]
        
        let mapped: [Int?] = possibleNumbers.map { key, value in Int(value) }
        print(mapped)
        
        let compactMapped: [Int] = possibleNumbers.compactMap { key, value in Int(value) }
        print(compactMapped)
    }
    
    func runSet() {
        let possibleNumbers: Set = ["1", "2", "three", "///4///", "5"]
        
        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
        print(mapped)
        
        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
        print(compactMapped)
    }
}

// Client().runArray()
// [Optional(1), Optional(2), nil, nil, Optional(5)]
// [1, 2, 5]

// Client().runDictionary()
// [Optional(5), Optional(1), nil, nil, Optional(2)]
// [5, 1, 2]

// Client().runSet()
// [nil, Optional(1), Optional(2), Optional(5), nil]
// [1, 2, 5]
