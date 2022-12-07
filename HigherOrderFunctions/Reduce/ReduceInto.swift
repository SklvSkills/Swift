//
//  Reduce into
//

// Client

class Client {
    func runArray() {
        let letters = "abracadabra"
        
        let letterCount = letters.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }
        print(letterCount)
    }
    
    func runDictionary() {
        let letters = [1: "a", 2: "b", 3: "r", 4: "a", 5: "c", 6: "a", 7: "d", 8: "a", 9: "b", 10: "r", 11: "a"]
        
        let letterCount = letters.reduce(into: [:]) { counts, letter in
            counts[letter.value, default: 0] += 1
        }
        print(letterCount)
    }
    
    func runSet() {
        let letters: Set = ["a", "b", "r", "a", "c", "a", "d", "a", "b", "r", "a"]
        
        let letterCount = letters.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }
        print(letterCount)
    }
}

// Client().runArray()
// ["d": 1, "b": 2, "r": 2, "c": 1, "a": 5]

// Client().runDictionary()
// ["a": 5, "c": 1, "d": 1, "r": 2, "b": 2]

// Client().runSet()
// ["c": 1, "a": 1, "d": 1, "r": 1, "b": 1]
