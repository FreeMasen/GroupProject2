//
//  ServingFloor.swift
//  GroupProject2
//
//  Created by Robert Masen on 3/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class ServingFloor {
    var Tables = [Table]()
    var Servers = [String]()
    
    func removeTable(id: Int) {
        var itter = 0
        var index = -1
        for table in Tables {
            if table.Id == id {
                index = itter
            }
            itter += 1
        }
        if index > -1 {
            Tables.removeAtIndex(index)
        }
    }
}