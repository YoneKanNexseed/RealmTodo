//
//  Todo.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id: Int = Int()
    @objc dynamic var title: String = String()
    @objc dynamic var date: String = String()
}
