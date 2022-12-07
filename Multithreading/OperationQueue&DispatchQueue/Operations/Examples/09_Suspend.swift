//
//  Suspend
//

import Foundation

// Client

class Client {
    func run() {
        let queue = OperationQueue()
        
        for i in 1...5 {
            queue.addOperation { print(i) }
        }
        
        queue.isSuspended = true
        
        for i in 6...10 {
            queue.addOperation { print(i) }
        }
    }
}

// Client().run()

// 5
// 2
// 3
// 4
// 1
