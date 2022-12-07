//
//  Thread safe array
//

import Foundation

class ThreadSafeArray<T> {
    private lazy var values = [T]()
    private let queue: DispatchQueue
    
    init(label: String) {
        queue = DispatchQueue(label: label, attributes: .concurrent)
    }
    
    var count: Int {
        queue.sync() {
            values.count
        }
    }
    
    func read(_ index: Int) -> T? {
        queue.sync() {
            guard index < values.count else {
                return nil
            }
            
            return values[index]
        }
    }
    
    func read() -> [T] {
        queue.sync() {
            values
        }
    }
    
    func append(_ newElement: T) {
        queue.async(flags: .barrier) { [weak self] in
            self?.values.append(newElement)
        }
    }
}

class Client {
    func run() {
        let intArray = ThreadSafeArray<Int>(label: "ThreadSafeIntArray")
        let group = DispatchGroup()
        
        for i in 0...25 {
            group.enter()
            DispatchQueue.global().async {
                intArray.append(i)
                group.leave()
            }
        }
        
        group.wait()
        print(intArray.read())
    }
}

// Client().run()

// [0, 1, 2, 3, 5, 7, 6, 8, 4, 11, 12, 9, 10, 13, 14, 15, 16, 19, 20, 18, 17, 21, 23, 22, 25, 24]
