//
//  DateUtils.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import Foundation

class DateUtils {
    
    // 現在日付を取得する
    // フォーマット： yyyy/MM/dd
    static func getCurrentDate() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: now)
    }
    
}
