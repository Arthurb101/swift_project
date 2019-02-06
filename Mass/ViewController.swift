//
//  ViewController.swift
//  Mass
//
//  Created by Student on 10/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomAppBar
import MaterialComponents.MaterialButtons

class ViewController:UIViewController, UITableViewDelegate, UITableViewDataSource
    {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomAppBar: MDCBottomAppBarView!
    
    
    @objc func doSomething()
    {
        print("button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewView")

        self.present(nextViewController, animated:true, completion:nil)
    }
    
        
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        init_data()
        

        bottomAppBar.floatingButton.addTarget(self, action: #selector(doSomething), for: .touchDown)

        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            campaigns_singleton.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(campaigns_singleton.count)
        return campaigns_singleton.count
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CampaignTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CampaignTableViewCell
        
        cell.campaignTitle.text = campaigns_singleton[indexPath.row].getTitle()
        cell.campaignSchedule.text = "11/22/2018"
        
        return cell
    }


}

