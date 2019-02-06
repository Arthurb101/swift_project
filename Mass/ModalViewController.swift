//
//  ModalViewController.swift
//  Mass
//
//  Created by Student on 10/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController:UIViewController
{
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true,completion: nil) 
    }
    
}
