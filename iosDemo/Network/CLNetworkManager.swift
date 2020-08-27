//
//  CLNetworkManager.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit

class CLNetworkManager: NSObject {
    
    public static var sharedManager = CLNetworkManager();
    
    public func fetchData(success: @escaping (CLDataModel)->()){
        
        request(urlString: "https://api.github.com",success: success)
    }
    
    private func request(urlString: String, success: @escaping (CLDataModel)->()){
        guard let url = URL(string: urlString) else {
            print("url不合法");
            return
        }
        let session = URLSession.shared
        let task :URLSessionTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            if let jsonData: [String: Any] = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]{
                let model = CLDataModel()
                model.dataWithModel(data: jsonData)
                CLRealmUtil.saveData(dataModel: model)
                success(model)
            }
        }
        task.resume()
    }
}
