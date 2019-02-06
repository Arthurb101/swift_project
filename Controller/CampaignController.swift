//
//  CampaignController.swift
//  Mass
//
//  Created by Student on 10/23/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit

var groups_singleton = [Group]()
var campaigns_singleton = [Campaign]()


 func init_data()
{
    print("init was called!")
    var senderList = [Sender]()
    senderList.append(Sender(name: "Jesse",phoneNumber: "208-941-4812"))
    senderList.append(Sender(name: "Arthur", phoneNumber:"918-807-0495"))
    var group1 = Group(name: "Double Tree",senders: senderList)
    var friendList = [Sender]()
    friendList.append(Sender(name:"Arthur",phoneNumber:"918-807-0495"))
    friendList.append(Sender(name:"Nathan",phoneNumber:"360-525-5770"))
    friendList.append(Sender(name:"Carter",phoneNumber:"360-931-2014"))
    var group2 = Group(name:"Friends",senders: friendList)
    
    groups_singleton.append(group1)
    groups_singleton.append(group2)
    
    
    campaigns_singleton.append(Campaign(title:"Double Tree WakeUP",groups:[group1],schedule:"11/1/2018 7:00 AM"))
    campaigns_singleton.append(Campaign(title:"Party Time!!!",groups:[group2],schedule:"10/31/2018 10:00 PM"))
    
    
    
}

func string_group() -> [String]
{
    var string_group = [String]()
    for item in groups_singleton{
        string_group.append(item.getName())
    }
    return string_group
}
func Add_Group(Name:String)
{
    groups_singleton.append(Group(name:Name,senders: [Sender]()))
}

func Add_Campaign(Title:String,Groups:[String],Schedule:String)
{
    var group_l = [Group]()
    for mygroup in Groups
    {
        for group_t in groups_singleton
        {
            if (group_t.getName() == mygroup)
            {
                group_l.append(group_t)
            }
        }
        
    }
    campaigns_singleton.append(Campaign(title:Title,groups:group_l,schedule:Schedule))
}


