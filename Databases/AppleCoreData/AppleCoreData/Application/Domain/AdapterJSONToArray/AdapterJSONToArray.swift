//
//  AdapterJSONToArray.swift
//  AppleCoreData
//

import Foundation

class AdapterJSONToArray<T: Decodable> {
    private let fileName: String
    
    init(dataFile fileName: String) {
        self.fileName = fileName
    }
}

extension AdapterJSONToArray {
    func convert() -> [T] {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil),
              let data = try? Data(contentsOf: file),
              let array = try? JSONDecoder().decode([T].self, from: data) else {
            return []
        }
        
        return array
    }
}
