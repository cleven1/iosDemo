//
//  CLToast.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit
import SnapKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

class CLToast: NSObject {

    public class func showToast(view: UIView?, hint: String) {
        
        let toastView = UIView()
        toastView.backgroundColor = UIColor.black
        toastView.layer.cornerRadius = 10
        toastView.layer.masksToBounds = true
        toastView.alpha = 0.0
        if let v = view {
            v.addSubview(toastView)
        }else{
            CLCommon.mainWindow()?.addSubview(toastView)
        }
        toastView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        let hintLabel = UILabel()
        hintLabel.text = hint
        hintLabel.textColor = UIColor.white
        hintLabel.font = UIFont.systemFont(ofSize: 17)
        toastView.addSubview(hintLabel)
        hintLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.bottom.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15)
        }
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseOut,.allowUserInteraction], animations: {
            toastView.alpha = 0.8
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UIView.animate(withDuration: 0.25, animations: {
                    toastView.alpha = 0.0
                }) { (_) in
                    toastView.removeFromSuperview()
                }
            }
        }
    }
}
