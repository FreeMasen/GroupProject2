//
//  Menu.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Menu {
    var currentMenuWindow: MenuType = .Dinner
    var Items = [Item]()
    
    func GetItemsForMenu() {
        Items = SQLLiteHelper.GetCurrentMenu(currentMenuWindow)
    }
}

