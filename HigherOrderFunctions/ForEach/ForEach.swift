//
//  For each
//

// Client

class Client {
    func runArray() {
        let numberWords = ["one", "two", "three"]
        
        numberWords.forEach { word in
            print(word, terminator: " ")
        }
        print()
    }
    
    func runDictionary() {
        let numberWords = [1: "one", 2: "two", 3: "three"]
        
        numberWords.forEach { key, value in
            print(value, terminator: " ")
        }
        print()
    }
    
    func runSet() {
        let numberWords: Set = ["one", "two", "three"]
        
        numberWords.forEach { word in
            print(word, terminator: " ")
        }
        print()
    }
}

// Client().runArray()
// one two three

// Client().runDictionary()
// two three one

// Client().runSet()
// three two one
