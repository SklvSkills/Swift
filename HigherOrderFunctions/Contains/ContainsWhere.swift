//
//  Contains where
//

// Client

class Client {
    func runArray() {
        let expenses = [21.37, 55.21, 9.32, 10.18, 388.77, 11.41]
        
        let hasBigPurchase = expenses.contains { $0 > 100 }
        print(hasBigPurchase)
    }
    
    func runDictionary() {
        let expenses = [1: 21.37, 2: 55.21, 3: 9.32, 4: 4010.18, 5: 388.77, 6: 11.41]
        
        let hasBigPurchase = expenses.contains { $0.value > 100 }
        print(hasBigPurchase)
    }
    
    func runSet() {
        let expenses: Set = [21.37, 55.21, 9.32, 10.18, 388.77, 11.41]
        
        let hasBigPurchase = expenses.contains { $0 > 100 }
        print(hasBigPurchase)
    }
}

// Client().runArray()
// true

// Client().runDictionary()
// true

// Client().runSet()
// true
