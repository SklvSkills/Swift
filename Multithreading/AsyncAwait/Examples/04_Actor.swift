//
//  Actor
//

import Foundation

struct Storage<T> {
    let key: String
    var value: T
    
    init(key: String, value: T) {
        self.key = key
        self.value = value
    }
    
    mutating func updateValue(_ newValue: T) {
        value = newValue
        print(value)
    }
}

actor IsolatedStorage<T> {
    nonisolated let key: String
    var value: T
    
    init(key: String, value: T) {
        self.key = key
        self.value = value
    }
    
    func updateValue(_ newValue: T) {
        value = newValue
        print(value)
    }
    
    // Async access examples
    
    func copy(to storage: IsolatedStorage<T>) async {
        await storage.updateValue(value)
    }
    
    func copy2(to storage: isolated IsolatedStorage<T>) {
        storage.value = value
    }
}

class Client {
    func run() {
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        var storage = Storage(key: "Storage", value: 0)
        
        concurrentQueue.async() {
            for i in 1...3 {
                storage.updateValue(i)
            }
        }
        
        concurrentQueue.async() {
            for j in 4...6 {
                storage.updateValue(j)
            }
        }
    }
    
    func run2() {
        let storage = IsolatedStorage(key: "IsolatedStorage", value: 0)
        
        Task.detached {
            for i in 1...3 {
                await storage.updateValue(i)
            }
            
        }
        
        Task.detached {
            for j in 4...6 {
                await storage.updateValue(j)
            }
        }
    }
}

// Client().run()

// 4 <- Bad: race condition
// 4
// 5
// 6
// 2
// 3

// Client().run2()

// 1
// 4
// 2
// 5
// 3
// 6
