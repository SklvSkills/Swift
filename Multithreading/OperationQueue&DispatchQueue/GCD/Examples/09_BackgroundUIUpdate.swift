//
//  Background UI update
//

import UIKit

class Client {
    static let toggleSwitch = UISwitch()
    
    func run() {
        Client.toggleSwitch.isOn = true
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(5)) {
            DispatchQueue.main.async {
                Client.toggleSwitch.setOn(false, animated: true)
            }
        }
    }
}

// Client().run()

// toggleSwitch is on
// After 5 second
// toggleSwitch is off (animated)
