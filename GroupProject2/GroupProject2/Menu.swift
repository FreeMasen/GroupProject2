//
//  Menu.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Menu {
    var currentMenuWindow = MenuType.Dinner.rawValue
    var Apps = [Item]()
    var Entre = [Item]()
    var Dessert = [Item]()
    var Drinks = [Item]()
    
    init() {
        
    }
    
    func GetItemsForMenu() {
        for item in SQLhelper.GetItems() {
            if item.Menues & currentMenuWindow == currentMenuWindow {
                switch item.Type {
                    case 1:
                        Apps.append(item)
                        break
                    case 2:
                        Entre.append(item)
                        break
                    case 4:
                        Dessert.append(item)
                        break
                    case 8:
                        Drinks.append(item)
                        break
                    default:
                        break
                }
            }
        }
    }
}

