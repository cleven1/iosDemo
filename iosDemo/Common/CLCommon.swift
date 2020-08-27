//
//  CLCommon.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit

class CLCommon: NSObject {
    
    public class func dateFormat(timeStamp: String) -> String{
        guard let ts = Double(timeStamp) else {
            return ""
        }
        let date = Date(timeIntervalSince1970: ts)
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let result = format.string(from: date)

        return result
    }

}
