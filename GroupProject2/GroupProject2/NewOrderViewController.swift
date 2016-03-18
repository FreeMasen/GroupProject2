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
    
    var selectedApp = 0
    var selectedDrink = 0
    var selectedEntre = 0
    var selectedDessert = 0
    
    
    var order: Order?
    var table: Table?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cancel = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: Selector("cancel"))
        self.navigationItem.leftBarButtonItem = cancel
        let plus = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("addOrderToTable"))
        self.navigationItem.rightBarButtonItem = plus
        
        drinkPickerView.reloadAllComponents()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
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
    
    func cancel() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
   
    func addOrderToTable() {
        if let t = table , o = order {
            t.Orders.append(o)
        }
        self.navigationController?.popViewControllerAnimated(true)
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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView  {
        case drinkPickerView:
            return menu.Drinks[row].Name
        case appPickerView:
            return menu.Apps[row].Name
        case mainCoursePickerView:
            return menu.Entre[row].Name
        case dessert:
            return menu.Dessert[row].Name
        default:
            return ""
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
