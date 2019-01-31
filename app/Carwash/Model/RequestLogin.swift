//
//  RequestLogin.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import ObjectMapper


/// Mappable Model RequestLogin da API
class RequestLogin: Mappable {

    var Email:String?
    var Password:String?
    
    required init?(map: Map) {
        Email = try! map.value("Email")
        Password = try! map.value("Password")
    }
    init() {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        Email    <- map["Email"]
        Password    <- map["Password"]
    }
}
