//
//  Manual start
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
        print("Hello, \(personsName). How are you?")
    }
}

// Client

class Client {
    func run() {
        let helloOperation = HelloOperation(personsName: "Peter")
        
        helloOperation.completionBlock = {
            print("Sorry I have to go! Bye Bye. See you.")
        }
        
        helloOperation.start()
    }
}

// Client().run()

// Hello, Peter. How are you?
// Sorry I have to go! Bye Bye. See you.
