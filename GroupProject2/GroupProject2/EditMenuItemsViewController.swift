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
    
    let menuTypes = ["Apps", "Entres", "Deserts", "Drinks"]
    var currentMenuType = String()
    var itemName = String()
    var itemPrice = Double()
    var itemDescription = String()
    var menuTimes = UInt8()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.GetItemsForMenu()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //**USER INPUT**
    @IBAction func getItem(sender: UITextField) {
        if let textField = itemTextField.text{
            itemName = textField
        }
    }
    
    @IBAction func getPrice(sender: UITextField) {
        if let textField = Double(priceTextField.text!) {
            itemPrice = textField
        }
    }
    
    @IBAction func getDesc(sender: UITextField) {
        if let textField = descTextField.text {
            itemDescription = textField
        }
    }
    
    
    @IBAction func addNewMenuItem(sender: UISwitch) {
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
        menu.GetItemsForMenu()
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
        switch section {
        case 0:
            return "Apps"
        case 1:
            return "Entres"
        case 2:
            return "Desserts"
        case 3:
            return "Drinks"
        default:
            return nil
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
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

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
