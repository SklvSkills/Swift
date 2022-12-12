//
//  MainViewController.swift
//  AppleCoreData
//
//  Architecture: Apple MVC
//

import UIKit
import CoreData

extension String {
    fileprivate static let title = "House Stark"
}

class MainViewController: UITableViewController {
    private let personManager: PersonManager = {
        let coreDataStack = (UIApplication.shared.delegate as! AppDelegate).coreDataStack
        return PersonManager(stack: coreDataStack)
    }()
}

extension MainViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            
            tableView.insertRows(at: [newIndexPath], with: .fade)
            
        case .delete:
            guard let indexPath = indexPath else { return }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        case .update:
            guard let indexPath = indexPath else { return }
            
            tableView.reloadRows(at: [indexPath], with: .none)
            
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else { return }
            
            tableView.moveRow(at: indexPath, to: newIndexPath)
            
        default:
            break
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

extension MainViewController {
    @objc private func addButtonClicked(_ sender: UIBarButtonItem) {
        setEditing(false, animated: true)
        
        let controller = AddPersonController { [weak self] name in
            self?.personManager.add(name)
        }
        
        present(controller, animated: true)
    }
}

extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = .title
        personManager.fetchedResultsController.delegate = self
        
        if personManager.count == 0 {
            let characters: [Character] = AdapterJSONToArray(dataFile: "houseStark.json").convert()
            
            characters.forEach {
                personManager.add($0.name)
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked(_:)))
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        personManager.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = personManager.person(by: indexPath)?.name
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete,
              let id = personManager.person(by: indexPath)?.id else {
            return
        }
        
        personManager.delete(by: id)
    }
}
