//
//  Async operation
//

import Foundation

class AsyncOperation: Operation {
    private let queue = DispatchQueue(label: "AsyncOperationQueue", attributes: .concurrent)
    private var stateExecuting = false
    private var stateFinished = false
    
    override var isAsynchronous: Bool { true }
    
    override private(set) var isExecuting: Bool {
        get {
            queue.sync { stateExecuting }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            queue.sync(flags: [.barrier]) { stateExecuting = newValue }
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override private(set) var isFinished: Bool {
        get {
            queue.sync { stateFinished }
        }
        set {
            willChangeValue(forKey: "isFinished")
            queue.sync(flags: [.barrier]) { stateFinished = newValue }
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override func start() {
        guard !isCancelled else {
            finish()
            return
        }
        
        isFinished = false
        isExecuting = true
        main()
    }
    
    func finish() {
        isExecuting = false
        isFinished = true
    }
}

class GetURL: AsyncOperation {
    private let url: URL
    private var task: URLSessionTask?
    
    init?(_ string: String) {
        guard let url = URL(string: string) else { return nil }
        self.url = url
    }
    
    override func main() {
        print("Begin main")
        
        guard !isCancelled else {
            finish()
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            data != nil ? print("Data OK") : print("Data error")
            self?.finish()
        }
        
        task!.resume()
        
        print("End main")
    }
    
    override func cancel() {
        task?.cancel()
        super.cancel()
    }
}

// Client

class Client {
    func run() {
        guard let getUrl = GetURL("https://www.apple.com") else { return }
        
        getUrl.completionBlock = {
            print("Done")
        }
        
        let queue = OperationQueue()
        queue.addOperation(getUrl)
    }
}

// Client().run()

// Begin main
// End main
// Data OK
// Done
