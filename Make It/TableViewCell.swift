//
//  TableViewCell.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/06/08.
//

import UIKit


class TableViewCell: UITableViewCell {
    
  

    
    
   //cellの背景
    @IBOutlet var shadowLayer: UIView!
    @IBOutlet var mainBackground: UIView!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
