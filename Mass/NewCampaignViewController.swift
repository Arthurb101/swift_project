//
//  NewCampaignViewController.swift
//  Mass
//
//  Created by Student on 10/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit
import SearchTextField
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_ButtonThemer




class NewCampaignViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate
{
    
    @IBOutlet weak var addCampaignButton: MDCButton!
    
    @IBOutlet weak var SendNowButton: MDCButton!
    
    
    @IBOutlet weak var campaignTitleText: UITextField!
    
    @IBOutlet weak var campaignGroupsText: UITextField!
    
    
    @IBOutlet weak var campaignMessageText: UITextField!
    
    @IBOutlet weak var GroupTableView: UICollectionView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var textField: UITextField!
    
    // Step 2: Create or get a button scheme
    let buttonScheme = MDCButtonScheme()
    
    
    var scheduleTime = ""
    var groupList = [String]()
    
    var autoCompletionPossibilities = string_group()
    var autoCompleteCharacterCount = 0
    var timer = Timer()
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
        print("inside Text Field")
        var subString = (textField.text!.capitalized as NSString).replacingCharacters(in: range, with: string) // 2
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0 { // 3 when a user clears the textField
            resetValues()
        } else {
            searchAutocompleteEntriesWIthSubstring(substring: subString) //4
        }
        return true
    }
    func formatSubstring(subString: String) -> String {
        let formatted = String(subString.dropLast(autoCompleteCharacterCount)).lowercased().capitalized //5
        return formatted
    }
    
    
    
    func resetValues() {
        autoCompleteCharacterCount = 0
        textField.text = ""
    }
    
    func searchAutocompleteEntriesWIthSubstring(substring: String) {
        let userQuery = substring
        let suggestions = getAutocompleteSuggestions(userText: substring) //1
        
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //2
                let autocompleteResult = self.formatAutocompleteResult(substring: substring, possibleMatches: suggestions) // 3
                self.putColourFormattedTextInTextField(autocompleteResult: autocompleteResult, userQuery : userQuery) //4
                self.moveCaretToEndOfUserQueryPosition(userQuery: userQuery) //5
            })
        } else {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //7
                self.textField.text = substring
            })
            autoCompleteCharacterCount = 0
        }
    }
    
    func getAutocompleteSuggestions(userText: String) -> [String]{
        var possibleMatches: [String] = []
        for item in autoCompletionPossibilities { //2
            let myString:NSString! = item as NSString
            let substringRange :NSRange! = myString.range(of: userText)
            
            if (substringRange.location == 0)
            {
                possibleMatches.append(item)
            }
        }
        return possibleMatches
    }
    
    func putColourFormattedTextInTextField(autocompleteResult: String, userQuery : String) {
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
        colouredString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: NSRange(location: userQuery.count,length:autocompleteResult.count))
        self.textField.attributedText = colouredString
    }
    func moveCaretToEndOfUserQueryPosition(userQuery : String) {
        if let newPosition = self.textField.position(from: self.textField.beginningOfDocument, offset: userQuery.count) {
            self.textField.selectedTextRange = self.textField.textRange(from: newPosition, to: newPosition)
        }
        let selectedRange: UITextRange? = textField.selectedTextRange
        textField.offset(from: textField.beginningOfDocument, to: (selectedRange?.start)!)
    }
    func formatAutocompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        autoCompleteCharacterCount = autoCompleteResult.count
        return autoCompleteResult
    }
    
    
    
    @IBAction func addGroup(_ sender: Any) {
        print("button clicked", textField.text)
        groupList.append(textField.text!)
        print(groupList)
        GroupTableView?.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupList.count
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GroupCollectionViewCell = self.GroupTableView.dequeueReusableCell(withReuseIdentifier: "GroupCell",for:indexPath) as! GroupCollectionViewCell
        cell.GroupButton.setTitle(textField.text, for: .normal)
       
        
    
        
        return cell
    }
    
    @IBAction func addCampaign(_ sender: Any) {
        var campaignTitle:String = campaignTitleText.text!
        var campaignSchedule = scheduleTime
        
        Add_Campaign(Title: campaignTitle, Groups:groupList,  Schedule: campaignSchedule ?? "")
        
    }
    
    @IBAction func getDate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let scheduleTime = dateFormatter.string(from: datePicker.date)
        
    }
    
    
    override func viewDidLoad() {
        GroupTableView.delegate = self
        GroupTableView.dataSource = self
        
        MDCOutlinedButtonThemer.applyScheme(buttonScheme, to: SendNowButton)
        
        
        
        
        
    }
    
}
