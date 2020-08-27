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
    
    public class func mainWindow() -> UIWindow?{
        if let window = UIApplication.shared.windows.first(where: { (wd) -> Bool in
            if wd.isKeyWindow{
                return true
            }else{
                return false
            }
        }){
            return window
        }
        return nil
    }
}
