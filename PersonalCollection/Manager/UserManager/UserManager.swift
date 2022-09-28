//
//  UserManager.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import Foundation
import ObjectMapper

class UserManager : Mappable {
    
    var userName: String = ""
    var gender: String = ""
    var dateOfBirth: String = ""
    
    static let shared = UserManager()
    
    init() {
        
    }
    
    required init?(map: Map) {
        self.mapping(map: map)
    }
    
    convenience init(dic:[String:Any]) {
        let map = Map.init(mappingType: .fromJSON, JSON: dic)
        self.init(map:map)!
    }
    
    func deleteUser() {
        
        let router = RootRouter()
        
        userName = ""
        gender = ""
        dateOfBirth = ""
        saveUser(user: self)
        router.loadMainAppStructure()
    }
    
    func loadUser() {
        let userDef = UserDefaults.standard
        if ((userDef.string(forKey: Constant.USER_DATA)) != nil) {
            let uString = UserDefaults.standard.value(forKey: Constant.USER_DATA) as! String
            let mapper = Mapper<UserManager>()
            let userObj = mapper.map(JSONString: uString)
            let map = Map.init(mappingType: .fromJSON, JSON: (userObj?.toJSON())!)
            self.mapping(map:map)
        }
    }
    
    func saveUser(user:UserManager) {
        UserDefaults.standard.set(user.toJSONString()!, forKey: Constant.USER_DATA)
        UserDefaults.standard.synchronize()
        loadUser()
    }
    
    func isLoggedIn() -> Bool {
        return userName.count > 0
    }
    
    
    func mapping(map: Map) {
        userName <- map["userName"]
        gender <- map["gender"]
        dateOfBirth <- map["dateOfBirth"]
    }
    
}
