//
//  Remove all where
//

// Client

class Client {
    func runArray() {
        var phrase = "The rain in Spain stays mainly in the plain."
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        
        phrase.removeAll(where: { vowels.contains($0) })
        print(phrase)
    }
}

// Client().runArray()
// Th rn n Spn stys mnly n th pln.
