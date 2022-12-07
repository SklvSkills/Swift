//
//  Concurrent loop
//

import Foundation

class Client {
    func run() {
        DispatchQueue.concurrentPerform(iterations: 5) { (i) in
            print(i)
        }
    }
}

// Client().run()

// 3
// 2
// 4
// 0
// 1
