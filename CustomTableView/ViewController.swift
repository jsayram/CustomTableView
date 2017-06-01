//
//  ViewController.swift
//  CustomTableView
//
//  Created by jose ramirez on 6/1/17.
//  Copyright © 2017 Jose Ramirez. All rights reserved.

/* In order to set this tableView to put anything you want
 //Step 1: The first step is to create a custom UITableViewCell subclass.
            So you can go to file, new, file. Under IOS, choose Cocoa Touch Class and hit next.
            Make sure to choose your subclass as a UITableViewCell subclass. 
   Step 2: name the class CustomCell. Or of course, anything you want.
   Step 3: From here, make sure the language is set to swift, and hit next.
            I'm just gonna save in the default location and hit create. And there we go! Some built-in methods are added, like awakeFromNib and setSelected.
   Step 4: Let's go back to our storyboard. And now we need to associate our prototype cell with our custom cell. So I'm going to select the prototype cell, and I want to point out here that I have the identifier set to cell already. So if it's not set to cell, and it's not matching that identifier string that you have in dequeueReusableCell in tableView cellForRowAt, you're going to need to make sure that they match. So, back to Main.storyboard. So in here, I'm going to go to the identity inspector, which is to the left of the attributes inspector, and the class is going to be CustomCell, then hit return to commit the change.
   Step 5: Then you can just design the cell as you see fit like you would design a normal ViewController by searching for UI element switches, labels, etc...
   Step 6: make the connections from the UIElements to the CustomCell class
 
 Step 7: So I'll return to the standard editor and then head over to ViewController.swift. 
         Inside of tableView cellForRowAt indexPath, I need to make a few changes. 
         Instead of using a UITableViewCell, we're using the subclass CustomCell.
 
        So the method, dequeuReusableCell, is going to return a UITableViewCell.
        Now since we know we want to use that custom cell, we're going to need to typecast it as
       a custom cell. Then when we modify line 
       
        "cell.textLabel?.text = data[indexPath.section][indexPath.row]" 7.)
        instead of using the built-in text label, let's use our custom property label.
      And that's it! We've referenced the custom property here. 
       It should update just like it did before, except for now we're using a custom subclass, and we can add other user-interface elements and organize them however we like.
 
*/
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let data:[[String]] = [["Item 1","Item 2", "Item 3"],
                           ["Item A","Item B", "Item C"]]
    let headers:[String] = ["Numbered","Lettered"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //7.)
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! CustomCell   // added as! CustomCell
        // cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.label.text = data[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
