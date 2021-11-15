//
//  WeatherCell.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellObj: Employee? {
        didSet {
            lblName.text = cellObj?.employee_name
        }
    }
}
