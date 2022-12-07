//
//  Barrier
//

import Foundation

class Client {
    func run() {
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        var value = 0
        
        concurrentQueue.async() {
            for i in 1...3 {
                value = i
                print("Queue 1: \(value)")
            }
        }
        
        concurrentQueue.async() {
            for j in 4...6 {
                value = j
                print("Queue 2: \(value)")
            }
        }
    }
    
    func run2() {
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        var value = 0
                    
        concurrentQueue.async(flags: .barrier) {
            for i in 1...3 {
                value = i
                print("Queue 1: \(value)")
            }
        }
        
        concurrentQueue.async(flags: .barrier) {
            for j in 4...6 {
                value = j
                print("Queue 2: \(value)")
            }
        }
    }
}

// Client().run() - without (flags: .barrier)

// Queue 1: 1
// Queue 2: 1 <- Bad: race condition
// Queue 2: 5
// Queue 1: 2
// Queue 1: 3
// Queue 2: 6

// Client().run2() - with (flags: .barrier)

// Queue 1: 1
// Queue 1: 2
// Queue 1: 3
// Queue 2: 4
// Queue 2: 5
// Queue 2: 6
