//
//  TeacherTableViewCell.swift
//  eighth
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiXin. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var tittle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
