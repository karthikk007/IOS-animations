//
//  MasterListViewController.swift
//  animations
//
//  Created by Karthik Kumar on 31/01/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class MasterListViewController: UITableViewController {
    
    var list: [(String, UIViewController.Type)] =
        [ ("Core Animation Layer",                          CAListViewController.self),
          ("CA Gradient Layer",                             CAGradientLayerListViewController.self),
          ("CA Shape Layer",                                CAShapeLayerListViewController.self),
          ("CA Text Layer",                                 CATextLayerListViewController.self),
          ("CA Emitter Layer",                              CAEmitterLayerListViewController.self),
          ("CA Replicator Layer Animations",                CAReplicatorLayerListViewController.self)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Animations"
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
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

