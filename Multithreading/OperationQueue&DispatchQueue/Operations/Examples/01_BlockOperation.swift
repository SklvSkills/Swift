//
//  Block operation
//

import Foundation

// Client

class Client {
    func run() {
        let blockOperation = BlockOperation {
            print("Block operation 1")
        }
        
        let queue = OperationQueue()
        queue.addOperation(blockOperation)
        
        queue.addOperation {
            print("Block operation 2")
        }
    }
}

// Client().run()

// Block operation 1
// Block operation 2
