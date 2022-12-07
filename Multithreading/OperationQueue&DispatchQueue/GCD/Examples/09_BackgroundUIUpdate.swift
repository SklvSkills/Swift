//
//  Background UI update
//

import UIKit

class Client {
    let toggleSwitch = UISwitch()
    
    func run() {
        toggleSwitch.isOn = true
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(5)) {
            DispatchQueue.main.async {
                toggleSwitch.setOn(false, animated: true)
            }
        }
    }
}

// Client().run()

// toggleSwitch is on
// After 5 second
// toggleSwitch is off (animated)
