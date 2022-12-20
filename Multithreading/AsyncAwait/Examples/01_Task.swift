//
//  Task
//

import Foundation

class Client {
    @MainActor func run() {
        print("1 \(Thread.current)")
        
        Task { // Task inherits context attributes
            print("2 \(Thread.current)")
        }
    }
    
    @MainActor func run2() {
        print("1 \(Thread.current)")
        
        Task.detached { // Task.detached doesn't inherit anything
            print("2 \(Thread.current)")
            
            await MainActor.run {
                print("3 \(Thread.current)")
            }
        }
    }
}

// Client().run()

// 1 <_NSMainThread: 0x600000a7c380>{number = 1, name = main}
// 2 <_NSMainThread: 0x600000a7c380>{number = 1, name = main}

// Client().run2()

// 1 <_NSMainThread: 0x60000118c3c0>{number = 1, name = main}
// 2 <NSThread: 0x6000011c1880>{number = 4, name = (null)}
// 3 <_NSMainThread: 0x60000118c3c0>{number = 1, name = main}
