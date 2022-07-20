//
//  Data.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/07/13.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var folder: String = ""
    @objc dynamic var due: String = ""
    @objc dynamic var alart: String = ""
}
