//
//  Notify.swift
//

import Foundation

class Client {
    func run() {
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        
        let workItem = DispatchWorkItem {
            sleep(2)
            print("Work")
        }
        
        concurrentQueue.async(execute: workItem)
        
        workItem.notify(queue: .main) {
            print("Done")
        }
        
        workItem.wait()
        print("Wait")
    }
    
    func run2() {
        let group = DispatchGroup()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        concurrentQueue.async(group: group) {
            print("Async")
        }
        
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5)) {
            print("Async after")
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("Group done")
        }
        
        group.wait()
        print("Group wait")
    }
}

// Client().run()

// Work
// Wait
// Done

// Client().run2()

// Async
// Async after
// Group wait
// Group done
