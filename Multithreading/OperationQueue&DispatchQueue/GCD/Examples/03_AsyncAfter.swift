//
//  Async after
//

import Foundation

class Client {
    func run() {
        print(Date())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            print(Date())
        }
    }
}

// Client().run()

// 2022-12-07 19:30:35 +0000
// 2022-12-07 19:30:40 +0000
