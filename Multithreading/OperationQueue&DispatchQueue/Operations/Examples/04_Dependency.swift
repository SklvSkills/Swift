//
//  Dependency
//

import Foundation

class HelloOperation: Operation {
    private let personsName: String
    
    init(personsName: String) {
        self.personsName = personsName
        super.init()
    }
    
    override func main() {
        guard !isCancelled else { return }
        sleep(1)
        print("Hello, \(personsName). How are you?")
    }
}

class ByeOperation: Operation {
    override func main() {
        guard !isCancelled, dependencies.isEmpty || !dependencies.contains(where: { $0.isCancelled }) else { return }
        print("Sorry I have to go! Bye Bye. See you.")
    }
}

// Client

class Client {
    func run() {
        let helloOperation = HelloOperation(personsName: "Peter")
        let byeOperation = ByeOperation()
        
        let queue = OperationQueue()
        queue.addOperation(byeOperation)
        queue.addOperation(helloOperation)
    }
    
    func run2() {
        let helloOperation = HelloOperation(personsName: "Peter")
        let byeOperation = ByeOperation()
        byeOperation.addDependency(helloOperation)
        
        let queue = OperationQueue()
        queue.addOperation(byeOperation)
        queue.addOperation(helloOperation)
    }
}

// Client().run()

// Sorry I have to go! Bye Bye. See you.
// Hello, Peter. How are you?

// Client().run2()

// Hello, Peter. How are you?
// Sorry I have to go! Bye Bye. See you.
