//
//  Cancel
//

import Foundation

class Client {
    func run() {
        var workItem: DispatchWorkItem!
        
        // Cancel execution
        
        workItem = DispatchWorkItem {
            print("Done")
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1), execute: workItem)
        
        workItem.cancel()
        
        // Cancellation in progress
        
        workItem = DispatchWorkItem {
            for i in 1...5 {
                guard !workItem.isCancelled else {
                    print("Cancelled")
                    break
                }

                sleep(1)
                print(i)
            }
        }
        
        DispatchQueue.global().async(execute: workItem)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
            workItem.cancel()
        }
    }
}

// Client().run()

// 1
// 2
// 3
// Cancelled
