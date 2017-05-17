

//
//  GitHubUser.swift
//  SKUtilsSwift
//
//  Created by Mac on 04.08.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class GitHubUser: Object, Mappable {
    
    dynamic var avatar_url: String? = nil
    dynamic var bio: String? = nil
    dynamic var blog: String? = nil
    dynamic var collaborators: Double = 0
    dynamic var company: String? = nil
    dynamic var created_at: String? = nil
    dynamic var disk_usage: Double = 0
    dynamic var email: String? = nil
    dynamic var events_url: String? = nil
    dynamic var followers: Double = 0
    dynamic var followers_url: String? = nil
    dynamic var following: Double = 0
    dynamic var following_url: String? = nil
    dynamic var gists_url: String? = nil
    dynamic var gravatar_id: String? = nil
    dynamic var hireable: String? = nil
    dynamic var html_url: String? = nil
    dynamic var id: Int = 0
    dynamic var location: String? = nil
    dynamic var login: String? = nil
    dynamic var name: String? = nil
    dynamic var organizations_url: String? = nil
    dynamic var owned_private_repos: Double = 0
//    plan =     {
//    collaborators = 0;
//    name = free;
//    "private_repos" = 0;
//    space = 976562499;
//    };
    dynamic var private_gists: Double = 0
    dynamic var public_gists: Double = 0
    dynamic var public_repos: Double = 0
    dynamic var received_events_url: String? = nil
    dynamic var repos_url: String? = nil
    dynamic var site_admin: Int = 0
    dynamic var starred_url: String? = nil
    dynamic var subscriptions_url: String? = nil
    dynamic var total_private_repos: Double = 0
    dynamic var type: String? = nil
    dynamic var updated_at: String? = nil
    dynamic var url: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(_ map: Map) {

    }
}
