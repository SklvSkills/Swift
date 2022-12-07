//
//  Cancel
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
        
        blockOperation.cancel()
    }
    
    func run2() {
        let blockOperation = BlockOperation { print("Six") }
        blockOperation.qualityOfService = .userInitiated
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
        for i in 1...5 {
            queue.addOperation { print(i) } // qualityOfService = .default
        }
        queue.addOperation(blockOperation)
        
        queue.cancelAllOperations()
    }
}

// Client().run()

// 1
// 2
// 3
// 5
// 4

// Client().run2()

// 1
