//
//  Person.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/8/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name : String
    var id : String
    
    init(name: String, id: String)
    {
        self.name = name
        self.id = id
    }
    
}
