//
//  Reduce
//

// Client

class Client {
    func runArray() {
        let numbers = [1, 2, 3, 4]
        
        let numberSum = numbers.reduce(0, { x, y in x + y })
        print(numberSum)
        
        let numberSum2 = numbers.reduce(0, +)
        print(numberSum2)
    }
    
    func runDictionary() {
        let numbers = [1: "One", 2: "Two", 3: "Three", 4: "Four"]
        
        let numberSum = numbers.reduce(0, { x, y in x + y.key })
        print(numberSum)
    }
    
    func runSet() {
        let numbers: Set = [1, 2, 3, 4]
        
        let numberSum = numbers.reduce(0, { x, y in x + y })
        print(numberSum)
        
        let numberSum2 = numbers.reduce(0, +)
        print(numberSum2)
    }
}

// Client().runArray()
// 10
// 10

// Client().runDictionary()
// 10

// Client().runSet()
// 10
// 10
