//
//  Task group
//

import UIKit

class Client {
    func run() {
        let keys = [1, 2, 3, 4, 5]

        Task {
            print(Date())
            
            let results = await withTaskGroup(of: (key: Int, value: String).self,
                                              returning: [Int: String].self,
                                              body: { taskGroup in
                for key in keys {
                    taskGroup.addTask {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        let value = String(key)
                        return (key, value)
                    }
                }
                
                var results = [Int: String]()
                for await result in taskGroup {
                    results[result.key] = result.value
                }
                return results
            })
            
            print(Date())
            print(results.sorted(by: { $0.key < $1.key }))
        }
    }
    
    func run2() {
        let imageURLs = [URL](repeating: URL(string: "https://source.unsplash.com/random")!, count: 10)
        
        Task {
            let images = try await withThrowingTaskGroup(of: UIImage?.self,
                                                      returning: [UIImage].self,
                                                      body: { taskGroup in
                for imageURL in imageURLs {
                    guard taskGroup.addTaskUnlessCancelled(operation: {
                        let (imageData, _) = try await URLSession.shared.data(from: imageURL)
                        return UIImage(data: imageData)
                    }) else { break }
                }
                
                guard Task.isCancelled == false else {
                    taskGroup.cancelAll()
                    return []
                }
                
//                try await taskGroup.waitForAll() // Calling waitForAll() will automatically wait
                                                   // for tasks you have not explicitly awaited,
                                                   // discarding any results they return.
                
                var images = [UIImage]()
                for try await image in taskGroup {
                    guard let image = image else { continue }
                    images.append(image)
                }
                return images
            })
            
            print(images.count)
        }
    }
}

// Client().run()

// 2022-12-20 12:43:45 +0000
// 2022-12-20 12:43:46 +0000
// [(key: 1, value: "1"), (key: 2, value: "2"), (key: 3, value: "3"), (key: 4, value: "4"), (key: 5, value: "5")]

// Client().run2()

// 10
