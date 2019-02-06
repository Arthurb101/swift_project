//
//  GroupModel.swift
//  Mass
//
//  Created by Student on 10/18/18.
//  Copyright © 2018 Student. All rights reserved.
//

class Group {
    var senders = [Sender]()
    var name = "NONE"
    var code = "NONE"
    
    func randomString(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
    func getSenders() -> [Sender]
    {
        return senders;
    }
    
    func getName() -> String
    {
        return name;
    }
    
    func getCode() -> String
    {
        return code;
    }
    
    func getCount() -> String
    {
        return String(senders.count)
    }
    
    init(name: String , senders: [Sender]) {
        self.name = name;
        self.senders = senders;
        self.code = randomString(length: 4)
        
    }
    
}
