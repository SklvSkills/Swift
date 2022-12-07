//
//  Semaphore
//

import Foundation

class Client {
    func run() {
        let semaphore = DispatchSemaphore(value: 2)
        
        for _ in 1...8 {
            DispatchQueue.global().async {
                semaphore.wait()
                sleep(2)
                print(Date())
                semaphore.signal()
            }
        }
    }
}

// Client().run()

// 2022-12-07 20:18:50 +0000
// 2022-12-07 20:18:50 +0000
// 2022-12-07 20:18:52 +0000
// 2022-12-07 20:18:52 +0000
// 2022-12-07 20:18:54 +0000
// 2022-12-07 20:18:54 +0000
// 2022-12-07 20:18:56 +0000
// 2022-12-07 20:18:56 +0000
