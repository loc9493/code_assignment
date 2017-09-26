//
//  Quote.swift
//  Assignment
//
//  Created by DuyLoc on 9/26/17.
//  Copyright © 2017 Codebox Solutions Ltd. All rights reserved.
//

import UIKit
import Tailor

class Quote: Mappable {
    required init(_ map: [String : Any]) {
        id <- map.property("id")
        tag <- map.property("tag")
        author <- map.property("author")
        quote <- map.property("quote")
    }
    
    var id: String?
    var tag: String?
    var author: String?
    var quote: String?
}
