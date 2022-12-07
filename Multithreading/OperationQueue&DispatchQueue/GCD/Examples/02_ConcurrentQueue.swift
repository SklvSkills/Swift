//
//  Concurrent queue
//

import Foundation

class Client {
    func run() {
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        
        concurrentQueue.async {
            print("Task 1 started")
            sleep(1)
            print("Task 1 finished")
        }
        
        concurrentQueue.async {
            print("Task 2 started")
            sleep(1)
            print("Task 2 finished")
        }
    }
}

// Client().run()

// Task 1 started
// Task 2 started
// Task 1 finished
// Task 2 finished
