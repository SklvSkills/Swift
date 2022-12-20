//
//  Async let
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
            async let value1 = sleep1()
            async let value2 = sleep2()
            async let value3 = sleep3()
            
            let _ = await (value1 + value2 + value3)
            print(Date())
        }
    }
}

// Client().run()

// 2022-12-19 09:34:11 +0000
// 2022-12-19 09:34:12 +0000
