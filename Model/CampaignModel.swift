//
//  CampaignModel.swift
//  Mass
//
//  Created by Student on 10/18/18.
//  Copyright © 2018 Student. All rights reserved.
//



class Campaign {
    var title: String = "NU"
    var groups = [Group]()
    var schedule: String = "NU"
    
    func getCampaign()
    {
        
    }
    
    func getTitle() -> String
    {
        return title;
    }
    
    init(title: String , groups: [Group],schedule: String) {
        self.title = title;
        self.groups = groups;
        self.schedule = schedule;
        
    }
    
}


