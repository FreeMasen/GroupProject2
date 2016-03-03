//
//  Server.swift
//  GroupProject2
//
//  Created by Robert Masen on 3/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Server {
    var Name: String
    var Tables = [Table]()
    
    init(name: String) {
        Name = name
    }
    
    func assignTable(table: Table) {
        Tables.append(table)
    }
    
}