//
//  StringUtils.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import Foundation

class StringUtils {
    
    // 文字列がnilか空文字かチェックする
    static func isEmpty(str: String?) -> Bool {
        if str == nil || str!.isEmpty {
            return true
        }
        
        return false
    }
}
