//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Tim Ng on 1/27/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
   
    
    
}

