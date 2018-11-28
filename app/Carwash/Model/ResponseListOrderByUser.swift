//
//  ResponseListOrderByUser.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseListOrderByUser da API
class ResponseListOrderByUser: Mappable {

    var Status:Bool
    var Result: [ResponseItemOrder]?
    
    required init?(map: Map) {
        Status = try! map.value("Status")
        
        Result = try? map.value("Result")
    }
    
    func mapping(map: Map) {
        
        Status <- map["Status"]
        
        Result <- map["Result"]
    }
}
