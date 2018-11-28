//
//  ResponseRegisterUser.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseDefault da API
class ResponseDefault: Mappable {

    var Status:Bool
    var Result: String?
    
    required init?(map: Map) {
        Status = try! map.value("Status")
        
        Result = try? map.value("Result")
    }
    
    func mapping(map: Map) {
        
        Status <- map["Status"]
        
        Result <- map["Result"]
    }
}
