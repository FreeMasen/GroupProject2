//
//  Table.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Table {
    let Id: Int
    var Orders = [Order]()
    static var tableCount = 0
    var Server: String
    
    init() {
        Table.tableCount += 1
        Id = Table.tableCount
        Server = ""
    }
    
    func AddOrder(order: Order) {
        Orders.append(order)
    }
    
    func DeleteOrderWithId(id: Int) {
        var index: Int?
        var i = 0
        for order in Orders {
            i += 1
            if order.OrderId == id {
                index = i
            }
        }
        if index != nil {
            Orders.removeAtIndex(index!)
        }
    }
}