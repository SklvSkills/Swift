//
//  Cancel
//

import UIKit

class Client {
    private let imageURL = URL(string: "https://source.unsplash.com/random")!
    
    func run() {
        Task {
            let imageTask = Task { () -> UIImage? in
                print("Starting task...")
                
                print("Starting network request...")
                let (imageData, _) = try await URLSession.shared.data(from: imageURL)
                print("Completed network request")
                
                return UIImage(data: imageData)
            }
            
            imageTask.cancel()
            
            do {
                let _ = try await imageTask.value
            } catch {
                print(error)
            }
        }
    }

    func run2() {
        Task {
            let imageTask = Task { () -> UIImage? in
                print("Starting task...")
                
                try Task.checkCancellation()
                
                print("Starting network request...")
                let (imageData, _) = try await URLSession.shared.data(from: imageURL)
                print("Completed network request")
                
                return UIImage(data: imageData)
            }
            
            imageTask.cancel()
            
            do {
                let _ = try await imageTask.value
            } catch {
                print(error)
            }
        }
    }

    func run3() {
        Task {
            let imageTask = Task { () -> UIImage? in
                print("Starting task...")
                
                guard Task.isCancelled == false else {
                    print("Task was cancelled")
                    return nil
                }
                
                print("Starting network request...")
                let (imageData, _) = try await URLSession.shared.data(from: imageURL)
                print("Completed network request")
                
                return UIImage(data: imageData)
            }
            
            imageTask.cancel()
            
            do {
                let _ = try await imageTask.value
            } catch {
                print(error)
            }
        }
    }
}

// Client().run()

// Starting task...
// Starting network request...
// Error Domain=NSURLErrorDomain Code=-999 "cancelled"

// Client().run2()

// Starting task...
// CancellationError()

// Client().run3()

// Starting task...
// Task was cancelled
