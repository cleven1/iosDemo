//
//  CLDataModel.swift
//  iosDemo
//
//  Created by cleven on 2020/8/27.
//  Copyright © 2020 cleven. All rights reserved.
//

import UIKit
import RealmSwift

class CLDataModel: Object {

    @objc var id: String {
        return "\(NSDate().timeIntervalSince1970)"
    }
    @objc var authorizations_url: String = ""
    @objc var code_search_url: String = ""
    @objc var commit_search_url: String = ""
    @objc var current_user_authorizations_html_url: String = ""
    @objc var current_user_repositories_url: String = ""
    @objc var current_user_url: String = ""
    @objc var emails_url: String = ""
    @objc var emojis_url: String = ""
    @objc var events_url: String = ""
    @objc var feeds_url: String = ""
    @objc var followers_url: String = ""
    @objc var following_url: String = ""
    @objc var gists_url: String = ""
    @objc var hub_url: String = ""
    @objc var issue_search_url: String = ""
    @objc var issues_url: String = ""
    @objc var keys_url: String = ""
    @objc var label_search_url: String = ""
    @objc var notifications_url: String = ""
    @objc var organization_repositories_url: String = ""
    @objc var organization_teams_url: String = ""
    @objc var organization_url: String = ""
    @objc var public_gists_url: String = ""
    @objc var rate_limit_url: String = ""
    @objc var repository_search_url: String = ""
    @objc var repository_url: String = ""
    @objc var starred_gists_url: String = ""
    @objc var starred_url: String = ""
    @objc var user_organizations_url: String = ""
    @objc var user_repositories_url: String = ""
    @objc var user_search_url: String = ""
    @objc var user_url: String = ""
 
    
    init(data: [String: Any]) {
        super.init()
        setValuesForKeys(data)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        print("----\(String(describing: value))")
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
