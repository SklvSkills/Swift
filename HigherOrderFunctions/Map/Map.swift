//
//  Map
//

// Client

class Client {
    func runArray() {
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        
        let lowercaseNames = cast.map { $0.lowercased() }
        print(lowercaseNames)
        
        let letterCounts = cast.map { $0.count }
        print(letterCounts)
    }
    
    func runDictionary() {
        let cast = [1: "Vivien", 2: "Marlon", 3: "Kim", 4: "Karl"]
        
        let lowercaseNames = cast.map { $0.value.lowercased() }
        print(lowercaseNames)
        
        let letterCounts = cast.map { $0.value.count }
        print(letterCounts)
    }
    
    func runSet() {
        let cast: Set = ["Vivien", "Marlon", "Kim", "Karl"]
        
        let lowercaseNames = cast.map { $0.lowercased() }
        print(lowercaseNames)
        
        let letterCounts = cast.map { $0.count }
        print(letterCounts)
    }
}

// Client().runArray()
// ["vivien", "marlon", "kim", "karl"]
// [6, 6, 3, 4]

// Client().runDictionary()
// ["marlon", "vivien", "kim", "karl"]
// [6, 6, 3, 4]

// Client().runSet()
// ["marlon", "vivien", "karl", "kim"]
// [6, 6, 4, 3]
