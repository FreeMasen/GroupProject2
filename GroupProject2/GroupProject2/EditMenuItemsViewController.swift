//
//  EditMenuItemsViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/29/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class EditMenuItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var editMenuTableView: UITableView!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var breakfastSwitch: UISwitch!
    @IBOutlet weak var happyHourSwitch: UISwitch!
    @IBOutlet weak var lunchSwitch: UISwitch!
    @IBOutlet weak var dinnerSwitch: UISwitch!
    
    @IBOutlet weak var menuTypePickerView: UIPickerView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    let menuTypes = ["Apps", "Entre", "Dessert", "Drinks"]
    var currentMenuType = "Apps"
    var itemName = String()
    var itemPrice = Double()
    var itemDescription = String()
    var menuTimes = UInt8()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //**USER INPUT**
    @IBAction func getItem(sender: UITextField) {
//        if let textField = itemTextField.text{
//            itemName = textField
//        }
    }
    
    @IBAction func getPrice(sender: UITextField) {
//        if let textField = Double(priceTextField.text!) {
//            itemPrice = textField
//        }
    }
    
    @IBAction func getDesc(sender: UITextField) {
//        if let textField = descTextField.text {
//            itemDescription = textField
//        }
    }
    
    
    @IBAction func addNewMenuItem(sender: UISwitch) {
        if let textField = itemTextField.text{
            itemName = textField
        }
        if let textField = Double(priceTextField.text!) {
            itemPrice = textField
        }
        if let textField = descTextField.text {
            itemDescription = textField
        }
        
        let newItem = Item(id: 99999, name: itemName, price: itemPrice, desc: itemDescription, menues: menuTimes, type: currentMenuType)
        SQLhelper.insertItem(newItem)
        itemTextField.text = nil
        priceTextField.text = nil
        descTextField.text = nil
        breakfastSwitch.on = false
        lunchSwitch.on = false
        happyHourSwitch.on = false
        dinnerSwitch.on = false
        menuTimes = 0
        menu = SQLhelper.GetMenu()
        editMenuTableView.reloadData()
    }
    
    //**Switches**
    @IBAction func addToBreakfast(sender: UISwitch) {
        if sender.on {
            menuTimes += MenuType.Breakfast.rawValue
        } else {
            menuTimes -= MenuType.Breakfast.rawValue
        }
    }
    
    @IBAction func addToHappyHour(sender: UISwitch) {
        if sender.on {
            menuTimes += MenuType.HappyHour.rawValue
        } else {
            menuTimes -= MenuType.HappyHour.rawValue
        }
    }
    
    
    @IBAction func addToLunch(sender: UISwitch) {
        if sender.on {
            menuTimes += MenuType.Lunch.rawValue
        } else {
            menuTimes -= MenuType.Lunch.rawValue
        }
    }
    
    @IBAction func addToDinner(sender: UISwitch) {
        if sender.on {
            menuTimes += MenuType.Dinner.rawValue
        } else {
            menuTimes -= MenuType.Dinner.rawValue
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu.Apps.count
        case 1:
            return menu.Entre.count
        case 2:
            return menu.Dessert.count
        case 3:
            return menu.Drinks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuTypes[section]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menuTypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.editMenuTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EditMenuItemCell
        switch indexPath.section {
        case 0:
            cell.itemLabel.text = menu.Apps[indexPath.row].Name
            cell.descLabel.text = menu.Apps[indexPath.row].Desc
            cell.priceLabel.text = String(format:"$%.2f", menu.Apps[indexPath.row].Price)
            break
        case 1:
            cell.itemLabel.text = menu.Entre[indexPath.row].Name
            cell.descLabel.text = menu.Entre[indexPath.row].Desc
            cell.priceLabel.text = String(format:"$%.2f", menu.Entre[indexPath.row].Price)
            break
        case 2:
            cell.itemLabel.text = menu.Dessert[indexPath.row].Name
            cell.descLabel.text = menu.Dessert[indexPath.row].Desc
            cell.priceLabel.text = String(format:"$%.2f", menu.Dessert[indexPath.row].Price)
            break
        case 3:
            cell.itemLabel.text = menu.Drinks[indexPath.row].Name
            cell.descLabel.text = menu.Drinks[indexPath.row].Desc
            cell.priceLabel.text = String(format:"$%.2f", menu.Drinks[indexPath.row].Price)
            break
        default: break
        }
        
        return cell
    }
    
    // ** Picker View **
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return menuTypes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return menuTypes[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        currentMenuType = menuTypes[row]
    }

    // Designates the actions for the row when the user swipes left on that row.
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .Normal, title: "edit", handler: { action in
            // Find the menu Item we are working with.
            let menus = [menu.Apps, menu.Entre, menu.Dessert, menu.Drinks]
            let selectedMenuItem = menus[indexPath.section][indexPath.row]
            
            self.populateFormWithItem(selectedItem: selectedMenuItem)
            
            // Show the Save and Cancel buttons. Hide the Add button.
            self.saveButton.enabled = true
            self.saveButton.alpha = 1.0
            self.cancelButton.enabled = true
            self.cancelButton.alpha = 1.0
            self.addButton.enabled = false
            self.addButton.alpha = 0.0
        })
        edit.backgroundColor = UIColor.greenColor()
        let delete = UITableViewRowAction(style: .Normal, title: "delete", handler: { action in
            // TODO: Make this do stuff.
        })
        delete.backgroundColor = UIColor.redColor()
        return [edit, delete]
    }
    
    // Populate the form with the Item information.
    private func populateFormWithItem(selectedItem item: Item) {
        self.itemTextField.text = item.Name
        self.priceTextField.text = String(item.Price)
        self.descTextField.text = item.Desc
        // Loop through all bit flags to find which MenuType the item belongs to.
        // n correspondes to the index of the array I put the menu type switches in
        // and the flag (2^n) corresponds to the respective bit flag we need to check.
        // This is probably a horrible unreadable way to do it...  I should probably
        // hide this is some funciton so I don't have to look at it.
        let menuTypeSwitches = [self.dinnerSwitch, self.happyHourSwitch, self.lunchSwitch, self.breakfastSwitch]
        for n in 0...3 {
            // Bitshifting to the left n times is equal to 2^n.
            // I think it looks better than Int(Pow(Float(2), Float(n)))
            let flag = 1 << n
            menuTypeSwitches[n].on = Int(item.Menues) & flag == flag
        }
        for (index, menuType) in menuTypes.enumerate() {
            if item.Type == menuType {
                menuTypePickerView.selectRow(index, inComponent: 0, animated: false)
                pickerView(menuTypePickerView, didSelectRow: index, inComponent: 0)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
