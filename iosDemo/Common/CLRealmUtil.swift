//
//  CLRealmUtil.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class CLRealmUtil: NSObject {

    /// 配置数据库
    public class func configRealm() {
        /// 如果要存储的数据模型属性发生变化,需要配置当前版本号比之前大
        let dbVersion : UInt64 = 10
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let dbPath = docPath.appending("/defaultDB.realm")
        let config = Realm.Configuration(fileURL: URL.init(string: dbPath), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: dbVersion, migrationBlock: { (migration, oldSchemaVersion) in
            
        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
        
        Realm.Configuration.defaultConfiguration = config
        Realm.asyncOpen { (realm, error) in
            if let _ = realm {
                print("Realm 服务器配置成功!")
            }else if let error = error {
                print("Realm 数据库配置失败：\(error.localizedDescription)")
            }
        }
    }
    
    public class func saveData(dataModel: CLDataModel){
        DispatchQueue.main.async {
            let realm = try! Realm()
            try? realm.write{
                realm.add(dataModel)
            }
        }
    }
    
    public class func getAllData() -> [CLDataModel]?{
        let realm = try? Realm()
        guard let result = realm?.objects(CLDataModel.self).sorted(by: { (model1, model2) -> Bool in
            return model1.id.compare(model2.id) == .orderedDescending
        }) else {
            return nil
        }
        var tempArray = [CLDataModel]()
        for item in Array(result) {
            print(item.id)
            tempArray.append(item)
        }
        return tempArray
    }
    
    public class func deleteData(key: String){
        let realm = try? Realm()
//        realm?.delete()
    }
}
