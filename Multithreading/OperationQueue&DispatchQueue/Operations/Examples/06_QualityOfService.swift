//
//  Quality of service
//

import Foundation

// Client

class Client {
    func run() {
        let blockOperation = BlockOperation { print("Six") }
        blockOperation.qualityOfService = .userInitiated
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
        for i in 1...5 {
            queue.addOperation { print(i) } // qualityOfService = .default
        }
        queue.addOperation(blockOperation)
    }
}

// Client().run()

// 1
// Six
// 3
// 4
// 5
// 2
