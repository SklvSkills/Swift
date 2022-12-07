//
//  Filter
//

// Client

class Client {
    func runArray() {
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        
        let shortNames = cast.filter { $0.count < 5 }
        print(shortNames)
    }
    
    func runDictionary() {
        let cast = [1: "Vivien", 2: "Marlon", 3: "Kim", 4: "Karl"]
        
        let shortNames = cast.filter { $0.value.count < 5 }
        print(shortNames)
    }
    
    func runSet() {
        let cast: Set = ["Vivien", "Marlon", "Kim", "Karl"]
        
        let shortNames = cast.filter { $0.count < 5 }
        print(shortNames)
    }
}

// Client().runArray()
// ["Kim", "Karl"]

// Client().runDictionary()
// [4: "Karl", 3: "Kim"]

// Client().runSet()
// ["Karl", "Kim"]
