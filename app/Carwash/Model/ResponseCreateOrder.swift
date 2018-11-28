//
//  ResponseCreateOrder.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseCreateOrder da API
class ResponseCreateOrder: Mappable {

    var Status:Bool
    var Result:ItemCreateOrder?
    
    required init?(map: Map) {
        Status = try! map.value("Status")
        Result = try? map.value("Result")
    }
    
    func mapping(map: Map) {
        Status <- map["Status"]
        Result <- map["Result"]
    }
}
