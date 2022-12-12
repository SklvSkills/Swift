//
//  AddPersonController.swift
//  AppleCoreData
//
//  Architecture: Apple MVC
//

import UIKit

extension String {
    fileprivate static let add = "Add Person"
    fileprivate static let name = "Name"
    fileprivate static let save = "Save"
    fileprivate static let cancel = "Cancel"
}

class AddPersonController: UIAlertController {
    convenience init(saveHandler: @escaping (String) -> Void) {
        self.init(title: .add, message: nil, preferredStyle: .alert)
        
        addTextField { textField in
            textField.placeholder = .name
        }
        
        let saveAction = UIAlertAction(title: .save, style: .default) { [weak self] _ in
            guard let name = self?.textFields?.first?.text else { return }
            
            saveHandler(name)
        }
        
        let cancelAction = UIAlertAction(title: .cancel, style: .cancel)
        
        addAction(saveAction)
        addAction(cancelAction)
    }
}
