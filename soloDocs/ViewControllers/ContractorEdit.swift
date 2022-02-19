//
//  ContractorEdit.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 13.02.2022.
//

import UIKit
import CoreData

class ContractorEdit: UIViewController {

    @IBOutlet weak var textFieldCompanyName: UITextField!
    @IBOutlet weak var textCompanyDescription: UITextView!
    
    @IBAction func submitButtonAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contractors", in: context)
        let insertItem = Contractors(entity: entity!, insertInto: context)
        insertItem.id = contractorsList.count as NSNumber
        insertItem.name = textFieldCompanyName.text
        insertItem.preview = textCompanyDescription.text
        do {
            try context.save()
            contractorsList.append(insertItem)
            navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
