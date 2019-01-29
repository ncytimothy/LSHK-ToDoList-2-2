//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Tim Ng on 1/27/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

//TODO: Add Custom Delegation Code
// TODO: Handle Add Task
// TODO: Handle the change state of the task being completed

import UIKit

class ToDoListViewController: UITableViewController {
    
    let cellId = "cellId"
    
//-----------------------------------------------
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpNavBar()
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setUpNavBar() {
        navigationItem.title = "Tasks"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
       
       let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
        navigationController?.navigationBar.titleTextAttributes =  titleAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(handleAddTask))
    }

//-----------------------------------------------
    // MARK: UITableView Delegate Methods (Data Source and Delegate)
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
//-----------------------------------------------
    // MARK: UITableView Delegate Methods (Data Source and Delegate)
    
    @objc func handleAddTask() {
        print("handling add task...")
        let alert = UIAlertController(title: "Add a new task", message: "What do you need to work on?", preferredStyle: .actionSheet)
       
    }
    
}


extension UIColor {
    
    static let divisor: CGFloat = 255
    
    // 208, 48, 32
    static let defaultRed = UIColor.rgb(red: 220, green: 81, blue: 44)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
}
