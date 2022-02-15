//
//  SoloTableViewCell.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 25.01.2022.
//

import UIKit

class SoloTableViewCell: UITableViewCell {

    @IBOutlet weak var contractorName: UILabel!
    @IBOutlet weak var contractorDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
