//
//  SQLLiteHelper.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class SQLLiteHelper {
    
    static func GetCurrentMenu(menuType: MenuType) -> [Item] {
        switch menuType {
        case .Brunch:
            return GetBrunchMenuItems()
        case .Dinner:
            return GetDinnerMenuItems()
        case .Drinks:
            return GetDrinksMenuItems()
        case .Apps:
            return GetAppsMenuItems()
        }
    }
    
    static func GetBrunchMenuItems() -> [Item] {
        //implement SQL Get
        return [Item]()
    }
    
    static func GetDinnerMenuItems() -> [Item] {
        //implement SQL Get
        return [Item]()
    }
    
    static func GetDrinksMenuItems() -> [Item] {
        //implement SQL Get
        return [Item]()
    }
    
    static func GetAppsMenuItems() -> [Item] {
        //implement SQL Get
        return [Item]()
    }
}

enum MenuType {
    case Brunch
    case Dinner
    case Drinks
    case Apps
}