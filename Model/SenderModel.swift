//
//  SenderModel.swift
//  Mass
//
//  Created by Student on 10/23/18.
//  Copyright © 2018 Student. All rights reserved.
//

class Sender {
    var phoneNumber = "NU"
    var name = "NU"
    
    func getPhoneNumber() -> String
    {
        return phoneNumber;
    }
    
    func getName() -> String
    {
        return name;
    }
    
    init(name: String, phoneNumber: String)
    {
        self.phoneNumber = phoneNumber;
        self.name = name;
    }
    
}
