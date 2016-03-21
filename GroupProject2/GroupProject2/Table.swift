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
    static var idCounter = 1
    var Orders = [Order]()
    static var tableCount = 0
    var Server: String
    
    init() {
        Id = Table.idCounter
        Table.idCounter += 1
        Server = ""
    }
    
    func AddOrder(order: Order) {
        Orders.append(order)
    }
    
    func DeleteOrderWithId(id: Int) {
        var index: Int?
        var i = 0
        for order in Orders {
            if order.OrderId == id {
                index = i
            }
            i += 1
        }
        if index != nil {
            Orders.removeAtIndex(index!)
        }
    }
}
