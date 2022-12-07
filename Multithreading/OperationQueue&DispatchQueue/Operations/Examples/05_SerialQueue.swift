//
//  Serial queue
//

import Foundation

// Client

class Client {
    func run() {
        let startTime = Date().timeIntervalSince1970
        
        let concurrentQueue = OperationQueue()
        for _ in 1...5 {
            concurrentQueue.addOperation { sleep(1) }
        }
        concurrentQueue.waitUntilAllOperationsAreFinished()
        
        let duration = Date().timeIntervalSince1970 - startTime
        print(duration)
    }
    
    func run2() {
        let startTime = Date().timeIntervalSince1970
        
        let serialQueue = OperationQueue()
        serialQueue.maxConcurrentOperationCount = 1
        for _ in 1...5 {
            serialQueue.addOperation { sleep(1) }
        }
        serialQueue.waitUntilAllOperationsAreFinished()
        
        let duration = Date().timeIntervalSince1970 - startTime
        print(duration)
    }
}

// Client().run()

// 1.0063889026641846

// Client().run2()

// 5.011798143386841
