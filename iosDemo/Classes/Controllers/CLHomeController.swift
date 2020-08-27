//
//  ViewController.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit

class CLHomeController: UIViewController {

    private var tableView: UITableView!
    private var dataArray: [CLModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getCacheData()
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] (timer) in
            self?.getNetworkData()
        }
    }

    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CLHomeItemCell.self, forCellReuseIdentifier: "dataCell")
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }

    @objc private func getNetworkData(){
        CLNetworkManager.sharedManager.fetchData { [weak self] (model) in
            guard let weakSelf = self else {return}
            weakSelf.getCacheData()
            DispatchQueue.main.async {
                CLToast.showToast(view: nil, hint: "有新数据")
            }
        }
    }
    
    private func getCacheData(){
        let allData = CLRealmUtil.getAllData()
        let model = allData?.first
        dataArray = CLDataModel.getArrayWithModel(toArray: model)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension CLHomeController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! CLHomeItemCell
        
        guard let dataArray = dataArray else {return cell}
        
        let m = dataArray[indexPath.row]
        
        cell.setData(model: m, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let dataArray = dataArray else {return}
        let m = dataArray[indexPath.row]
        print(m.key)
    }
}
