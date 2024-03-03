//
//  ViewController.swift
//  MyOwnTableViewApp
//
//  Created by student on 3/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tab: UITableView!

   
    let sectionsData = [
        ["Cities", "New York", "Tokyo", "Paris", "Sydney"],
        ["Musical Instruments", "Guitar", "Piano", "Violin", "Drums"],
        ["Cuisines", "Italian", "Mexican", "Japanese", "Indian"],
        ["Planets", "Mercury", "Venus", "Earth", "Mars"],
        ["Books Genres", "Fantasy", "Sci-Fi", "Mystery", "Non-fiction"]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tab.delegate = self
        tab.dataSource = self

        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

       
        let selectedItem = sectionsData[indexPath.section][indexPath.row + 1]

        let alertController = UIAlertController(title: "Item Selected", message: "You have selected \(selectedItem)", preferredStyle: .alert)

       
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            
        present(alertController, animated: true, completion: nil)
    }

    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return sectionsData[section].count - 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
       
        cell.textLabel?.text = sectionsData[indexPath.section][indexPath.row + 1]
        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return sectionsData[section][0]
    }

  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        let headerLabel = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.bounds.size.width, height: 25))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.textColor = UIColor.white
        headerLabel.text = sectionsData[section][0]
        headerView.addSubview(headerLabel)

        return headerView
    }

  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}



