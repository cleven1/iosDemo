//
//  CLDataModel.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit
import RealmSwift

struct CLModel {
    var key: String = ""
    var value: String = ""
}

class CLDataModel: Object,Encodable {

    @objc dynamic var id: String = ""
    @objc dynamic var authorizations_url: String = ""
    @objc dynamic var code_search_url: String = ""
    @objc dynamic var commit_search_url: String = ""
    @objc dynamic var current_user_authorizations_html_url: String = ""
    @objc dynamic var current_user_repositories_url: String = ""
    @objc dynamic var current_user_url: String = ""
    @objc dynamic var emails_url: String = ""
    @objc dynamic var emojis_url: String = ""
    @objc dynamic var events_url: String = ""
    @objc dynamic var feeds_url: String = ""
    @objc dynamic var followers_url: String = ""
    @objc dynamic var following_url: String = ""
    @objc dynamic var gists_url: String = ""
    @objc dynamic var hub_url: String = ""
    @objc dynamic var issue_search_url: String = ""
    @objc dynamic var issues_url: String = ""
    @objc dynamic var keys_url: String = ""
    @objc dynamic var label_search_url: String = ""
    @objc dynamic var notifications_url: String = ""
    @objc dynamic var organization_repositories_url: String = ""
    @objc dynamic var organization_teams_url: String = ""
    @objc dynamic var organization_url: String = ""
    @objc dynamic var public_gists_url: String = ""
    @objc dynamic var rate_limit_url: String = ""
    @objc dynamic var repository_search_url: String = ""
    @objc dynamic var repository_url: String = ""
    @objc dynamic var starred_gists_url: String = ""
    @objc dynamic var starred_url: String = ""
    @objc dynamic var user_organizations_url: String = ""
    @objc dynamic var user_repositories_url: String = ""
    @objc dynamic var user_search_url: String = ""
    @objc dynamic var user_url: String = ""
 
    
    public func dataWithModel(data: [String: Any]){
        self.id = "\(Int(NSDate().timeIntervalSince1970))"
        self.authorizations_url = data["authorizations_url"] as! String
        self.code_search_url = data["code_search_url"] as! String
        self.commit_search_url = data["commit_search_url"] as! String
        self.current_user_authorizations_html_url = data["current_user_authorizations_html_url"] as! String
        self.current_user_repositories_url = data["current_user_repositories_url"] as! String
        self.current_user_url = data["current_user_url"] as! String
        self.emails_url = data["emails_url"] as! String
        self.emojis_url = data["emojis_url"] as! String
        self.events_url = data["events_url"] as! String
        self.feeds_url = data["feeds_url"] as! String
        self.followers_url = data["followers_url"] as! String
        self.following_url = data["following_url"] as! String
        self.gists_url = data["gists_url"] as! String
        self.hub_url = data["hub_url"] as! String
        self.issue_search_url = data["issue_search_url"] as! String
        self.issues_url = data["issues_url"] as! String
        self.keys_url = data["keys_url"] as! String
        self.label_search_url = data["label_search_url"] as! String
        self.notifications_url = data["notifications_url"] as! String
        self.organization_repositories_url = data["organization_repositories_url"] as! String
        self.organization_teams_url = data["organization_teams_url"] as! String
        self.organization_url = data["organization_url"] as! String
        self.public_gists_url = data["public_gists_url"] as! String
        self.rate_limit_url = data["rate_limit_url"] as! String
        self.repository_search_url = data["repository_search_url"] as! String
        self.repository_url = data["repository_url"] as! String
        self.starred_gists_url = data["starred_gists_url"] as! String
        self.starred_url = data["starred_url"] as! String
        self.user_organizations_url = data["user_organizations_url"] as! String
        self.user_repositories_url = data["user_repositories_url"] as! String
        self.user_search_url = data["user_search_url"] as! String
        self.user_url = data["user_url"] as! String
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    public static func encoder(toDictionary model: CLDataModel?) ->[String:Any]?{
        guard let m = model else {return nil}
        let encoder = JSONEncoder()

        encoder.outputFormatting = .prettyPrinted
        
        guard let data = try? encoder.encode(m)else{
            return nil
        }

        guard let dict = try?JSONSerialization.jsonObject(with: data, options: .mutableLeaves)as? [String:Any]else{
            return nil
        }
        return dict
    }
    
    public static func getArrayWithModel(toArray model: CLDataModel?) ->[CLModel]{
        guard let m = model else {
            return []
        }
        
        guard let dict = encoder(toDictionary: m) else {
            return []
        }
        var tempArray = [CLModel]()
        let model = CLModel(key: "id", value: dict["id"] as! String)
        tempArray.append(model)
        for (key,value) in dict {
            if key != "id" {
                let model = CLModel(key: key, value: value as! String)
                tempArray.append(model)
            }
        }
        return tempArray
    }
}
