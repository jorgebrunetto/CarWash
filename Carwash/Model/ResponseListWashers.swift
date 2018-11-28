//
//  ResponseListWashers.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseListWashers da API
class ResponseListWashers: Mappable {

    var Status:Bool
    var listWashers: [ResponseWashers]?
    var error: String?

    required init?(map: Map) {
        Status = try! map.value("Status")
       
        listWashers = try? map.value("Result")
        error = try? map.value("Result")
    }
    
    func mapping(map: Map) {
        Status <- map["Status"]
        
        listWashers <- map["Result"]
        error <- map["Result"]
    }

}
