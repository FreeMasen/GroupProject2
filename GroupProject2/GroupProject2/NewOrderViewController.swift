//
//  NewOrderViewController.swift
//  GroupProject2
//
//  Created by Casey on 3/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var drinkPickerView: UIPickerView!
    @IBOutlet weak var appPickerView: UIPickerView!
    @IBOutlet weak var mainCoursePickerView: UIPickerView!
    
    @IBOutlet weak var dessert: UIPickerView!
    @IBOutlet weak var addOrderButton: UIButton!
    
    var selectedApp = -1
    var selectedDrink = -1
    var selectedEntre = -1
    var selectedDessert = -1
    
    
    var order: Order?
    var table: Table?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView  {
        case drinkPickerView:
            selectedDrink = row
            break
        case appPickerView:
            selectedApp = row
            break
        case mainCoursePickerView:
            selectedEntre = row
            break
        case dessert:
            selectedDessert = row
            break
        default:
            break
        }
    }
    
   
    @IBAction func addOrderToTable(sender: UIButton) {
        if let t = table , o = order {
            t.Orders.append(o)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if let items = order?.Items {
            return items.count
        }
        return 0
    }
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == drinkPickerView {
                return menu.Drinks.count
        
        } else if pickerView == appPickerView {
            return menu.Apps.count
        
        } else if pickerView == mainCoursePickerView {
            return menu.Entre.count
        
        } else  if pickerView == dessert {
            return menu.Dessert.count
        }
        else {
            return 0
        }
    }
    
    @IBAction func addDesert(sender: AnyObject) {
        if selectedDessert != -1 {
            order?.Items.append(menu.Dessert[selectedApp])
        }
    }
    
    @IBAction func addDrinks(sender: AnyObject) {
        if selectedDrink != -1 {
            order?.Items.append(menu.Drinks[selectedDrink])
        }
    }
    //pull drinks from the database
    @IBAction func addMain(sender: AnyObject) {
        if selectedEntre != -1 {
            order?.Items.append(menu.Entre[selectedDrink])
        }
    }
    
    @IBAction func addApps(sender: AnyObject) {
        if selectedApp != -1 {
            order?.Items.append(menu.Apps[selectedApp])
        }
    }
}
