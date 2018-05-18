//
//  LineAnimationListTableViewController.swift
//  animations
//
//  Created by Karthik Kumar on 07/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class LineAnimationListTableViewController: UITableViewController {
    
    let list: [(String, UIViewController.Type)] =
        [ ("Draw Line Animation",       DrawLineViewController.self),
          ("Line Animation",            AnimateLineViewController.self) ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return list.count > 0 ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
        // Configure the cell...
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = list[indexPath.row].0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = list[indexPath.row].1.init(nibName: nil, bundle: nil)
        viewController.title = list[indexPath.row].0
        navigationController?.pushViewController(viewController, animated: true)
    }

}
