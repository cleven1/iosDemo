//
//  CLHomeItemCell.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit

class CLHomeItemCell: UITableViewCell {

    private var nameLabel: UILabel!
    private var subLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = UIColor.black
        contentView .addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        subLabel = UILabel()
        subLabel.textColor = UIColor(red: 151/255, green: 217/255, blue: 225/255, alpha: 1.0)
        subLabel.numberOfLines = 2
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    public func setData(model: CLModel, index: Int){
        nameLabel.text = model.key
        subLabel.text = model.value
        if model.key == "id" {
            nameLabel.text = "最后一次时间"
            subLabel.text = CLCommon.dateFormat(timeStamp: model.value)
        }
        if index == 0 {
            nameLabel.textColor = UIColor.red
            subLabel.textColor = UIColor(red: 183/255, green: 33/255, blue: 255/255, alpha: 1.0)
        }else{
            nameLabel.textColor = UIColor.black
            subLabel.textColor = UIColor(red: 151/255, green: 217/255, blue: 225/255, alpha: 1.0)
        }
    }
    
    public func setHistoryData(dataModel: CLDataModel){
        nameLabel.text = "请求时间: \(CLCommon.dateFormat(timeStamp: dataModel.id))"
        subLabel.text = CLDataModel.encoder(toDictionary: dataModel)?.description
    }
}
