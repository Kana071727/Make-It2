//
//  TableViewCell.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/06/08.
//

import UIKit
import RealmSwift

class TableViewCell: UITableViewCell {
    
   let realm = try! Realm()
    
    
    @IBOutlet var shadowLayer: UIView!
    @IBOutlet var mainBackground: UIView!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let data: Data? = read()
        
        titleLabel.text = data?.name
    }
    
    func read() -> Data? {
        return realm.objects(Data.self).first
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
