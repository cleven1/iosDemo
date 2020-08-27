//
//  CLHistoryController.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit
import MJRefresh

class CLHistoryController: UIViewController {

    private var tableView: UITableView!
    private var dataArray: [CLDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getCacheData()
    }
    

   private func setupUI() {
       tableView = UITableView(frame: .zero, style: .plain)
       tableView.delegate = self
       tableView.dataSource = self
       tableView.register(CLHomeItemCell.self, forCellReuseIdentifier: "dataHistoryCell")
       tableView.estimatedRowHeight = 80
       tableView.tableFooterView = UIView()
       view.addSubview(tableView)
       tableView.snp.makeConstraints { (make) in
           make.edges.equalToSuperview()
       }
       tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(self.getCacheData))
   }
    
    @objc private func getCacheData(){
        dataArray = CLRealmUtil.getAllData()
        tableView.reloadData()
        tableView.mj_header?.endRefreshing()
    }

}
extension CLHistoryController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataHistoryCell", for: indexPath) as! CLHomeItemCell
        
        guard let dataArray = dataArray else {return cell}
        
        cell.setHistoryData(dataModel: dataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
