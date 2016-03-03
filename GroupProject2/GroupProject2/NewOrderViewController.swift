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
    
    @IBOutlet weak var addOrderButton: UIButton!
    
    var drinkList = []
    var appList = []
    var mainCourseList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func addOrderToTable(sender: UIButton) {
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == drinkPickerView {
                return drinkList.count
        
        } else if pickerView == appPickerView {
            return appList.count
        
        } else if pickerView == mainCoursePickerView {
            return mainCourseList.count
        
        } else {
            return 0
        }
    }
    
    //pull drinks from the database
    func addDrinksToDrinkList() {
            
    }
    
    //pull apps from the database
    func addAppsToAppList() {
    
    
    }
    
    // pull main courses from the database
    func addMainCourseToMainCourseList() {

    
    }
}
