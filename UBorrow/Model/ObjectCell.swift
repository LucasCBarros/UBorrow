//
//  ObjectCell.swift
//  UBorrow
//
//  Created by Lucas Barros on 09/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class ObjectCell: UITableViewCell {

    @IBOutlet weak var _objectCellIcon: UIImageView!
    @IBOutlet weak var _objectCellName: UILabel!
    @IBOutlet weak var _objectCellPersonName: UILabel!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var iconHolderImage: UIImageView!
    @IBOutlet weak var arrowLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
