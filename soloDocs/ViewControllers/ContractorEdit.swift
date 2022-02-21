//
//  ContractorEdit.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 13.02.2022.
//

import UIKit
import CoreData

class ContractorEdit: UIViewController {
    
    var selectedContractor: Contractors? = nil
    @IBOutlet weak var textFieldCompanyName: UITextField!
    @IBOutlet weak var textCompanyDescription: UITextView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func submitButtonAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contractors", in: context)
        
        textFieldCompanyName.layer.masksToBounds = true
        textFieldCompanyName.layer.borderColor = UIColor.blue.cgColor
        textFieldCompanyName.layer.borderWidth = 1.0
        
        if selectedContractor == nil {
            
            let insertItem = Contractors(entity: entity!, insertInto: context)
            insertItem.id = contractorsList.count as NSNumber
            insertItem.name = textFieldCompanyName.text
            insertItem.preview = textCompanyDescription.text
            
            do {
                try context.save()
                contractorsList.append(insertItem)
                navigationController?.popViewController(animated: true)
            } catch let error as NSError {
                let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil ))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contractors")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let contractor = result as! Contractors
                    if(contractor == selectedContractor) {
                        contractor.name = textFieldCompanyName.text
                        contractor.preview = textCompanyDescription.text
                        try context.save()
                        break
                    }
                }
                navigationController?.popViewController(animated: true)
            } catch let error as NSError {
                print("Could not update. \(error), \(error.userInfo)")
            }
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Do you want to delete a contractor?", preferredStyle: .alert)
        
        alert.addAction( UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
            
        alert.addAction(
            UIAlertAction(title: "OK, delete", style: .destructive, handler: { _ in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contractors")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let contractor = result as! Contractors
                    if(contractor == self.selectedContractor){
                        context.delete(contractor)
                        try context.save()
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } catch let error as NSError {
                print("Could not update. \(error), \(error.userInfo)")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedContractor != nil) {
            deleteButton.isHidden = false
            textFieldCompanyName.text = selectedContractor?.name
            textCompanyDescription.text = selectedContractor?.preview
        } else {
            deleteButton.isHidden = true
        }
    }
}
