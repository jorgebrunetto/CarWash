//
//  ResponseLogin.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseLogin da API
class ResponseLogin: Mappable {
    
    var Status:Bool
    var resultOk: ResultLogin?
    var resultFailure: String?
    
    required init?(map: Map) {
        Status = try! map.value("Status")
        resultOk = try? map.value("Result")
        resultFailure = try? map.value("Result")
    }
    
    func mapping(map: Map) {
        Status <- map["Status"]
        resultOk <- map["resultOk"]
        resultFailure <- map["resultFailure"]
    }
}
