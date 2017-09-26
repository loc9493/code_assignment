//
//  ChannelTableViewCell.swift
//  Assignment
//
//  Created by DuyLoc on 9/21/17.
//  Copyright © 2017 Codebox Solutions Ltd. All rights reserved.
//

import UIKit
import CoreData

class ChannelTableViewCell: UITableViewCell {
    @IBOutlet var lblChannelName: UILabel!
    @IBOutlet var lblChannelNumber: UILabel!
    var channel: NSManagedObject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configureCellWithObject(object: Quote) {
        self.lblChannelName.text = object.quote
        self.lblChannelNumber.text = object.id
    }
}
