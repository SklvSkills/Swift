//
//  Async
//

import Foundation

class Client {
    func sleep1() async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return 1
    }
    
    func sleep2() async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return 2
    }
    
    func sleep3() async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return 3
    }
    
    func run() {
        Task {
            print(Date())
            let value1 = await sleep1()
            let value2 = await sleep2()
            let value3 = await sleep3()
            
            let _ = value1 + value2 + value3
            print(Date())
        }
    }
}

// Client().run()

// 2022-12-19 09:30:44 +0000
// 2022-12-19 09:30:47 +0000
