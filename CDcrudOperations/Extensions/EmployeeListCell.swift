//
//  EmployeeListCell.swift
//  CDcrudOperations
//
//  Created by Sarika on 15.03.22.
//

import UIKit

class EmployeeListCell: UITableViewCell {

    @IBOutlet weak var lblEmployeeName: UILabel!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    
    override func awakeFromNib() {
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
