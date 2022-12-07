//
//  Timer
//

import Foundation

class Client {
    private var timer: DispatchSourceTimer?
    
    private func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    private func startTimer() {
        stopTimer()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
        
        timer = DispatchSource.makeTimerSource(queue: concurrentQueue)
        timer!.schedule(deadline: .now(), repeating: .seconds(5), leeway: .milliseconds(100))
        
        timer!.setEventHandler {
            print(Date())
        }
        
        timer!.resume()
    }
    
    func run() {
        startTimer()
        sleep(25)
        stopTimer()
    }
}

// Client().run()

// 2022-12-07 19:52:58 +0000
// 2022-12-07 19:53:03 +0000
// 2022-12-07 19:53:08 +0000
// 2022-12-07 19:53:13 +0000
// 2022-12-07 19:53:18 +0000
