//
//  GroupViewController.swift
//  Mass
//
//  Created by Student on 10/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextFields

class GroupViewController:UIViewController,UITableViewDelegate, UITableViewDataSource
{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameGroupInput: MDCMultilineTextField!
//    var nameGroupController: MDCTextInputControllerOutlined?
    
    
    
    @IBOutlet weak var addGroupButton: UIButton!
    
    
    @IBAction func add_group(_ sender: Any) {
        Add_Group(Name: nameGroupInput.text ?? "default value")
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        nameGroupInput.placeholder = "Group Name"
//        nameGroupController = MDCTextInputControllerOutlined(textInput: nameGroupInput)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups_singleton.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups_singleton.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GroupTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "GroupCell") as! GroupTableViewCell
        
        cell.groupCount.text = groups_singleton[indexPath.row].getCount()
       cell.groupCode.text = groups_singleton[indexPath.row].getCode()
        cell.groupName.text = groups_singleton[indexPath.row].getName()
        
        return cell
        
        
    }
    
    
}
