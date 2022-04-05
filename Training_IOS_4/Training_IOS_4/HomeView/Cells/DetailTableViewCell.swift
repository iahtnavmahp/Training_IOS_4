//
//  DetailTableViewCell.swift
//  Training_IOS_4
//
//  Created by Pham Van Thai on 04/04/2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblG: UILabel!
    @IBOutlet weak var lblLs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
