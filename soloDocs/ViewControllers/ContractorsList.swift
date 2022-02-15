//
//  ViewController.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 25.01.2022.
//

import UIKit


class ContractorsList: UIViewController {
    
    let cellId = "soloCell"
    
    var contractorsList = [Contractors]()
    
    @IBOutlet weak var viewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTable.dataSource = self
        viewTable.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //viewTable.isEditing = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        let btnSetting = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(goToSetting))
        navigationItem.leftBarButtonItem = btnSetting
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc func goToSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsTableViewController") as! SettingsTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swapeRead = UIContextualAction(style: .normal, title: "Непрочитанное") { (action, view, success) in
            print("No read swipe")
        }
        swapeRead.image = UIImage(named: "document")
        swapeRead.backgroundColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1)
        return UISwipeActionsConfiguration(actions: [swapeRead])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipeMore = UIContextualAction(style: .normal, title: "Ещё") { (action, view, success) in
            print("MORE")
        }
        swipeMore.image = UIImage(named: "menu")
        swipeMore.backgroundColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 1.0)
        
        let swipeAttention = UIContextualAction(style: .normal, title: "Внимание") { (action, view, success) in
            print("Attantion")
        }
        swipeAttention.image = UIImage(named: "attention")
        swipeAttention.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        
        let config = UISwipeActionsConfiguration(actions: [swipeMore, swipeAttention])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
}

extension ContractorsList: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contractorsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:cellId) as! SoloTableViewCell
        
        let contractor: Contractors!
        contractor = contractorsList[indexPath.row]
        cell.contractorName.text = contractor.name
        cell.contractorDescription.text = contractor.preview
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewTable.reloadData()
    }
}
